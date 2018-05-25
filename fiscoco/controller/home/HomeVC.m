//
//  HomeVC.m
//  fiscoco
//
//  Created by administrator on 2018/5/21.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "HomeVC.h"
#import "HomeView.h"
#import "Masonry.h"
#import "Constants.h"


@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self initTitleBar:@"air_high_speed" rightOptionsIcon:@"ic_f1_add" rightOptionIsVisiable:TRUE];
    //[self setTitle:@"首页"];
    [self setStatusBarBackgroundColor:[UIColor colorWithWhite:1.0 alpha:1.0]];
    
    self.homeView = [[HomeView alloc] init];
    [self.homeView buildTopNavbarView];
    [self.view addSubview:self.homeView];
    [self.homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT));
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
