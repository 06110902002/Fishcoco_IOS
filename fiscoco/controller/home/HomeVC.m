//
//  HomeVC.m
//  fiscoco
//
//  Created by administrator on 2018/5/21.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "HomeVC.h"


@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleBar:@"ic_f1_add" rightOptionsIcon:@"ic_f1_add" rightOptionIsVisiable:TRUE];
    [self setTitle:@"首页"];
    [self setStatusBarBackgroundColor:[UIColor colorWithWhite:1.0 alpha:1.0]];
    
}

/*---------点击头部的接口------*/
-(void) onBack{
    NSLog(@"消息中心------");
}

-(void) onMore{
    NSLog(@"更多------");

}
/*---------end--------------*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
