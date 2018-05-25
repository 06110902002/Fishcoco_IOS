//
//  HomeView.m
//  fiscoco
//
//  Created by administrator on 2018/5/24.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "HomeView.h"
#import "Constants.h"
#import "Masonry.h"
#import "SceneView.h"
#import "HomeSceneEntity.h"

@implementation HomeView

-(instancetype) initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
    }
    return self;
}

-(void) buildTopNavbarView{
    
    self.sceneDataList = [NSMutableArray array];
    for(int i = 0; i < 7; i ++){
        
        HomeSceneEntity* homeSceneEntity = [[HomeSceneEntity alloc] init];
        [homeSceneEntity setSceneName:[NSString stringWithFormat:@"场景%d",i]];
        
    }
    
    //添加一张背景图
    UIImageView* topBgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"magnetic_door_title_bg"]];
    [self addSubview:topBgView];
    
    [topBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 270.0));
        make.left.equalTo(self);
    }];
    
    //导航栏
    self.titleBarView = [[TopStatusView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 45)];
    [self.titleBarView initAttr:@"air_high_speed"
               rightOptionsIcon:@"ic_f1_add"
          rightOptionIsVisiable:true];
    [self addSubview:self.titleBarView];
    self.titleBarView.titleClickListenr = self;
    
    //构建设备与空间的segment
    NSArray *array = [NSArray arrayWithObjects:@"设备",@"空间",nil];
    self.segment = [[UISegmentedControl alloc]initWithItems:array];
    self.segment.selectedSegmentIndex = 0;
    self.segment.tintColor = [UIColor whiteColor];
    [self.segment addTarget:self action:@selector(segmentChange:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.segment];
    [self.segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(160, 30.0));
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(30);
    }];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
   
    flowLayout.minimumLineSpacing = 50;     // 每一行cell之间的间距
    // flowLayout.minimumInteritemSpacing = 10; //每一列cell之间的间距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
    
    self.sceneListView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.sceneListView.backgroundColor = [UIColor redColor];
    self.sceneListView.dataSource = self;
    self.sceneListView.delegate = self;
    [self addSubview:self.sceneListView ];
    [self.sceneListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 150.0));
        make.top.equalTo(self).offset(70);
    }];
    [self.sceneListView  registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"sceneItem"];
    
   

    
    //我的设备 与我的空间 列表
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 15;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SceneView *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"sceneItem" forIndexPath:indexPath];
    if (!cell ) {
        NSLog(@"cell为空,创建cell");
        cell = [[SceneView alloc] init];
    }
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}




//顶部返回点击的回调
-(void) onBack{
    
    NSLog(@"52----------onBack");
}
-(void) onMore{
    
    NSLog(@"56----------onMore");
}

- (void)segmentChange:(UISegmentedControl *)sgc{
    
    NSLog(@"70------------");
}

@end
