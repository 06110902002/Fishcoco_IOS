//
//  BaseViewController.h
//  fiscoco
//
//  Created by administrator on 2018/5/21.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopStatusView.h"

@interface BaseViewController : UIViewController<TitleBarClickListener>

@property(nonatomic,assign) CGRect screenSize;
@property(nonatomic,strong) TopStatusView* titleBarView;

-(CGRect)getScreenSize;                                   //获取屏幕尺寸
-(void)setStatusBarBackgroundColor:(UIColor *)color;      //设置状态栏颜色

-(void) initTitleBar : (BOOL) visiableRightOptions;
-(void) setTitle:(NSString*) title;

@end
