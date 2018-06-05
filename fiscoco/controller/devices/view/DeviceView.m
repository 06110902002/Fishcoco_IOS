//
//  DeviceView.m
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/5.
//  Copyright © 2018 administrator. All rights reserved.
//

#import "DeviceView.h"
#import "Constants.h"
#import "DevicesTabView.h"
#import "Masonry.h"

@implementation DeviceView

-(instancetype) initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        UIImageView* topBgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"magnetic_door_title_bg"]];
        topBgView.frame = CGRectMake(0, 20, SCREEN_WIDTH, 45);
        [self addSubview:topBgView];
        
        [super initTitleBarAttr:@"back_white" title:@"设备管理" rightOptionsIcon:@"ic_f1_add" rightOptionIsVisiable:false];
    }
    return self;
}



#pragma 顶部标题栏协议接口
-(void) onBack{
    [self.window.rootViewController dismissViewControllerAnimated:true completion:^{}];
}

-(void) onMore:(UIView *)view{
}
//-------end---------


-(void)buildDeviesListView{
    
    UILabel* headView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    headView.text = @"refresh...";
    headView.backgroundColor = [UIColor greenColor];
    
    
    //下面开始处理隐藏部分，默认显示快捷消息
    DevicesTabView* quickWordsView = [[DevicesTabView alloc] init];
    //quickWordsView.tableHeaderView = headView;
    quickWordsView.separatorInset = UIEdgeInsetsMake(0,10,0,10);  //top left right down
    quickWordsView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];  //删除底部多余行，及分割线
    [self addSubview:quickWordsView];
    
    [quickWordsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.top.equalTo(self.mas_top).offset(60);
        make.height.mas_equalTo(SCREEN_HEIGHT - 60);
        
    }];
    
}


@end
