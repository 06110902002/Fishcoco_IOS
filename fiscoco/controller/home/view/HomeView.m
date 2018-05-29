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
#import "EquOrSpaceEntity.h"
#import "EquOrSpaceView.h"

@implementation HomeView

-(instancetype) initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
    }
    return self;
}

-(void) buildTopNavbarView{
    
    self.sceneDataList = [NSMutableArray array];
    for(int i = 0; i < 4; i ++){
        
        HomeSceneEntity* homeSceneEntity = [[HomeSceneEntity alloc] init];
        [homeSceneEntity setSceneName:[NSString stringWithFormat:@"场景%d",i]];
        [homeSceneEntity setType:i];
        [self.sceneDataList addObject:homeSceneEntity];
    }
    
    self.equOrSpaceList = [NSMutableArray array];
    for(int i = 0; i < 14; i ++){
        
        EquOrSpaceEntity* homeSceneEntity = [[EquOrSpaceEntity alloc] init];
        [homeSceneEntity setName:[NSString stringWithFormat:@"开关%d",i]];
        [homeSceneEntity setType:i];
        [self.equOrSpaceList addObject:homeSceneEntity];
    }
    
    //添加一张背景图
    UIImageView* topBgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"magnetic_door_title_bg"]];
    [self addSubview:topBgView];
    
    [topBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 240.0));
        make.left.equalTo(self);
    }];
    
    //导航栏
    self.titleBarView = [[TopStatusView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 45)];
    [self.titleBarView initAttr:@"index_message"
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
    flowLayout.itemSize = CGSizeMake(130, 130);
    
    //flowLayout.minimumLineSpacing = 10;     // 每一列cell之间的间距
    // flowLayout.minimumInteritemSpacing = 10; //每一列cell之间的间距
    //flowLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
    
    self.sceneListView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.sceneListView.backgroundColor = [UIColor clearColor];
    self.sceneListView.tag = 23;
    self.sceneListView.dataSource = self;
    self.sceneListView.delegate = self;
    self.sceneListView.showsVerticalScrollIndicator = NO;
    self.sceneListView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.sceneListView];
    [self.sceneListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 150.0));
        make.top.equalTo(self).offset(80);
    }];
    [self.sceneListView  registerClass:[SceneView class] forCellWithReuseIdentifier:@"sceneItem"];
    [self.sceneListView reloadData];
   
    //我的设备 与我的空间 列表
    self.equAndSpaceSwitchView = [[UIView alloc] init];
    self.equAndSpaceSwitchView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.equAndSpaceSwitchView ];
    [self.equAndSpaceSwitchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 60));
        make.top.equalTo(topBgView.mas_bottom);
    }];
    
    self.equSpaceIconView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 35, 35)];
    self.equSpaceIconView.contentMode = UIViewContentModeScaleAspectFit;
    self.equSpaceIconView.image = [UIImage imageNamed:@"index_equipment_list_icon"];
    [self.equAndSpaceSwitchView addSubview:self.equSpaceIconView];

    
    //我的设备与空间的切换按钮标题文本
    self.equSpaceLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 10, 135, 35)];
    UIFont* font = [UIFont systemFontOfSize:15];
    self.equSpaceLabel.textColor = [UIColor blackColor];
    self.equSpaceLabel.text = @"我的设备";
    self.equSpaceLabel.font = font;
    self.equSpaceLabel.textAlignment = NSTextAlignmentLeft;
    self.equSpaceLabel.numberOfLines = 0;
    [self.equAndSpaceSwitchView addSubview:self.equSpaceLabel];
    
    //切换按钮
    self.equSpaceSwitchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.equSpaceSwitchBtn.frame = CGRectMake(SCREEN_WIDTH - 60, 5, 35, 35);
    self.equSpaceSwitchBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.curSwitchBtnImgName = @"list";
    [self.equSpaceSwitchBtn setImage:[UIImage imageNamed:self.curSwitchBtnImgName] forState:UIControlStateNormal];
    [self.equSpaceSwitchBtn addTarget:self action:@selector(onClickListener:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.equAndSpaceSwitchView addSubview:self.equSpaceSwitchBtn];
   
    //设备或者空间视图
    self.equAndSpaceLayout = [[UICollectionViewFlowLayout alloc] init];
    self.equAndSpaceLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.equAndSpaceLayout.itemSize = CGSizeMake(SCREEN_WIDTH, 60);
    self.equAndSpaceLayout.minimumLineSpacing = 1;
    self.equAndSpaceLayout.sectionInset = UIEdgeInsetsMake(2, 0, 0, 0);
    
    //网格布局
    self.equAndSpaceGridLayout = [[UICollectionViewFlowLayout alloc] init];
    self.equAndSpaceGridLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.equAndSpaceGridLayout.itemSize = CGSizeMake(floor(SCREEN_WIDTH / 4) - 4, SCREEN_WIDTH / 4);
    self.equAndSpaceGridLayout.minimumLineSpacing = 1;
    self.equAndSpaceGridLayout.minimumInteritemSpacing = 0;
    self.equAndSpaceGridLayout.sectionInset = UIEdgeInsetsMake(2, 0, 0, 1);
    
    self.equAndSpaceListView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.equAndSpaceLayout];
    self.equAndSpaceListView.backgroundColor = [UIColor colorWithRed:200.0f / 255.0f green:200.0f/255.0f blue:200.0/255.0f alpha:1.0];
    self.equAndSpaceListView.tag = 24;
    
    self.equAndSpaceListView.dataSource = self;
    self.equAndSpaceListView.delegate = self;
    self.equAndSpaceListView.showsVerticalScrollIndicator = NO;
    self.equAndSpaceListView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.equAndSpaceListView];
    [self.equAndSpaceListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 260));
        make.top.equalTo(topBgView.mas_bottom).offset(50);
    }];
    [self.equAndSpaceListView  registerClass:[EquOrSpaceView class] forCellWithReuseIdentifier:@"equItem"];
    
}

-(void)onClickListener:(UIButton *) button{
    
    if([self.curSwitchBtnImgName isEqualToString:@"list"]){
        self.curSwitchBtnImgName = @"gongge";
        [self.equAndSpaceListView setCollectionViewLayout:self.equAndSpaceGridLayout animated:true];
        [self.gridCellItemView setIsGrid:true];
        
    }else{
        self.curSwitchBtnImgName = @"list";
        [self.equAndSpaceListView setCollectionViewLayout:self.equAndSpaceLayout animated:true];
        [self.gridCellItemView setIsGrid:false];
    }
    [self.equAndSpaceListView updateConstraintsIfNeeded];
   // [self.equAndSpaceListView reloadData];
    [button setImage:[UIImage imageNamed:self.curSwitchBtnImgName] forState:UIControlStateNormal];
    
}

//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//定义展示的UICollectionViewCell的个数 //返回每个分区的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if([collectionView isKindOfClass:[self.sceneListView class]]){
        return [self.sceneDataList count];
    }
    return [self.equOrSpaceList count];
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if(collectionView.tag == 23){
        SceneView *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"sceneItem" forIndexPath:indexPath];
        if (!cell) {
            cell = [[SceneView alloc] init];
        }
        [cell initItemView];
        HomeSceneEntity* model = ((HomeSceneEntity* )self.sceneDataList[indexPath.row]);
        [cell bindData:model];
        return cell;
        
    }else{
        
        self.gridCellItemView =  [collectionView dequeueReusableCellWithReuseIdentifier:@"equItem" forIndexPath:indexPath];
        if (!self.gridCellItemView) {
            self.gridCellItemView = [[EquOrSpaceView alloc] init];
        }
        [self.gridCellItemView setIsGrid:false];
        [self.gridCellItemView initItemView];
        EquOrSpaceEntity* model = ((EquOrSpaceEntity* )self.equOrSpaceList[indexPath.row]);
        [self.gridCellItemView bindData:model];
        return self.gridCellItemView;
    }
}

//-(CGSize)collectionView:(UICollectionView *)collectionView
//                 layout:(UICollectionViewLayout *)collectionViewLayout
// sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//
//    if(collectionView.collectionViewLayout == self.equAndSpaceLayout){
//        return CGSizeMake(SCREEN_WIDTH, 60);
//    }else{
//
//        return CGSizeMake(SCREEN_WIDTH / 4, SCREEN_WIDTH / 5);
//    }
//
//}

/*-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    NSLog(@"125------:%d",section);
    return UIEdgeInsetsMake(15, 15, 5, 15);//分别为上、左、下、右
}*/

// 两个cell之间的最小间距，是由API自动计算的，只有当间距小于该值时，cell会进行换行
/*- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 55;
}
*/
// 两行之间的最小间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    NSLog(@"228---------:");
//
//    return 5;
//}


//设置可以选中
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//点击item方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SceneView *cell = (SceneView *)[collectionView cellForItemAtIndexPath:indexPath];

    NSLog(@"121-------%@",cell.title.text);
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
