//
//  TopStatusView.h
//  fiscoco
//
//  Created by administrator on 2018/5/21.
//  Copyright © 2018年 administrator. All rights reserved.
//  顶部状态栏视图
//

#import <UIKit/UIKit.h>

//头部点击返回回调
@protocol TitleBarClickListener <NSObject>
@optional
-(void) onBack;         //点击返回的回调
-(void) onMore;         //点击更多的回调

@end

@interface TopStatusView : UIView

@property(nonatomic,strong) UIImageView* imgBack;
@property(nonatomic,strong) UIImageView* imgMore;

@property(nonatomic,copy) NSString* title;
@property(nonatomic,weak) id<TitleBarClickListener> titleClickListenr;

-(void) setTitle:(NSString*)title;

-(void) initAttr: (NSString* ) backIconName
rightOptionsIcon:(NSString*) rightIcon
rightOptionIsVisiable:(BOOL) visiable;

@end
