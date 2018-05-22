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
    [self initTitleBar : true];
    [self setTitle:@"首页"];
    [self setStatusBarBackgroundColor:[UIColor colorWithWhite:1.0 alpha:1.0]];
    
}


-(void) initTitleBar : (BOOL) visiableRightOptions{
    [super initTitleBar : visiableRightOptions];
    NSLog(@"24--------initTitleBar");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
