//
//  DevicesVC.m
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/5.
//  Copyright © 2018 administrator. All rights reserved.
//

#import "DevicesVC.h"
#import "Constants.h"

@interface DevicesVC ()

@end

@implementation DevicesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setStatusBarBackgroundColor:[UIColor colorWithWhite:1.0 alpha:1.0]];
    
    self.mDevicesView = [[DeviceView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.mDevicesView buildDeviesListView];
    [self.view addSubview:self.mDevicesView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
