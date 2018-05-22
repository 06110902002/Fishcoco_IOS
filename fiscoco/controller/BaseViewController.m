//
//  BaseViewController.m
//  fiscoco
//
//  Created by administrator on 2018/5/21.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "BaseViewController.h"
#import "TopStatusView.h"
#import "Constants.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.screenSize = [self getScreenSize];
}


-(CGRect)getScreenSize{
    
    return [UIScreen mainScreen].bounds;
}

//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}
//设置状态栏字体为白色
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void) initTitleBar : (BOOL) visiableRightOptions{
    
    NSLog(@"44----------:%f  height : %f",self.screenSize.size.width, self.screenSize.size.height);
    self.titleBarView = [[TopStatusView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 45)];
    [self.titleBarView initAttr:visiableRightOptions];
    self.titleBarView.backgroundColor = [UIColor colorWithRed:118.0f / 255.0 green:198.f / 255.0 blue:192.0f / 255.0 alpha:1.0];
    [self.view addSubview:self.titleBarView];
    
    self.titleBarView.titleClickListenr = self;
}

-(void) setTitle:(NSString *)title{
    if(self.titleBarView){
        [self.titleBarView setTitle:title];
    }
}

//顶部返回点击的回调
-(void) onBack{
    
    NSLog(@"52----------onBack");
}
-(void) onMore{
    
    NSLog(@"56----------onMore");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

