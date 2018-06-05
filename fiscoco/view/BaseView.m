//
//  BaseView.m
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/5.
//  Copyright © 2018 administrator. All rights reserved.
//

#import "BaseView.h"
#import "Constants.h"

@implementation BaseView

-(instancetype) initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
    }
    return self;
}

-(TopStatusView*) titleBarView{
    if(!_titleBarView){
       _titleBarView = [[TopStatusView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 45)];
    }
    return _titleBarView;
}

-(void) initTitleBarAttr: (NSString* ) backIconName title:(NSString*) title
        rightOptionsIcon:(NSString*) rightIcon
   rightOptionIsVisiable:(BOOL) visiable{
    
    [[self titleBarView] initAttr:backIconName rightOptionsIcon:rightIcon rightOptionIsVisiable:visiable];
    [[self titleBarView] setTitle:title];
    [self addSubview:[self titleBarView]];
    [self titleBarView].titleClickListenr = self;
    
}

#pragma 顶部标题栏协议接口
-(void) onBack{
    NSLog(@"41--------this is super class back subclass is:%@",self);
    
}
-(void) onMore:(UIView *)view{
    NSLog(@"45--------this is super class onMoreClick subclass is:%@",self);

}
//-------end---------

     

@end
