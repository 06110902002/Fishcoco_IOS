//
//  BottomTabBarVC.m
//  fiscoco
//
//  Created by administrator on 2018/5/21.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "BottomTabBarVC.h"

#import "HomeVC.h"
#import "MallVC.h"
#import "DiscoverVC.h"
#import "MineVC.h"
#import "UIImage+UIImageExtras.h"


@interface BottomTabBarVC ()

@end

@implementation BottomTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) initMenu{
    

    self.homeVC = [[HomeVC alloc] init];
    self.homeVC.tabBarItem.title = NSLocalizedString(@"homePage",nil);
    self.homeVC.tabBarItem.tag = 0;
    UIImage* selectImg = [UIImage imageNamed:@"ic_main_tab_find_pre"];
    self.homeVC.tabBarItem.selectedImage = [selectImg imageByScalingToSize:CGSizeMake(30, 30)];
    UIImage* normalImg = [UIImage imageNamed:@"ic_main_tab_find_nor"];
    self.homeVC.tabBarItem.image = [normalImg imageByScalingToSize:CGSizeMake(30, 30)];
    
    self.mallVC = [[MallVC alloc] init];
    self.mallVC.tabBarItem.title = NSLocalizedString(@"mall",nil);
    self.mallVC.tabBarItem.tag = 1;
    UIImage* mallSelectImg = [UIImage imageNamed:@"ic_main_tab_find_pre"];
    self.mallVC.tabBarItem.selectedImage = [mallSelectImg imageByScalingToSize:CGSizeMake(30, 30)];
    UIImage* mallNormalImg = [UIImage imageNamed:@"ic_main_tab_find_nor"];
    self.mallVC.tabBarItem.image = [mallNormalImg imageByScalingToSize:CGSizeMake(30, 30)];
    
    self.discoverVC = [[DiscoverVC alloc] init];
    self.discoverVC.tabBarItem.title = NSLocalizedString(@"discover",nil);
    self.discoverVC.tabBarItem.tag = 0;
    UIImage* dis_selectImg = [UIImage imageNamed:@"ic_main_tab_find_pre"];
    self.discoverVC.tabBarItem.selectedImage = [dis_selectImg imageByScalingToSize:CGSizeMake(30, 30)];
    UIImage* dis_normal = [UIImage imageNamed:@"ic_main_tab_find_nor"];
    self.discoverVC.tabBarItem.image = [dis_normal imageByScalingToSize:CGSizeMake(30, 30)];
    
    self.mineVC = [[MineVC alloc] init];
    self.mineVC.tabBarItem.title = NSLocalizedString(@"mine",nil);
    self.mineVC.tabBarItem.tag = 0;
    UIImage* mine_selectImg = [UIImage imageNamed:@"ic_main_tab_find_pre"];
    self.homeVC.tabBarItem.selectedImage = [mine_selectImg imageByScalingToSize:CGSizeMake(30, 30)];
    UIImage* mine_normalImg = [UIImage imageNamed:@"ic_main_tab_find_nor"];
    self.mineVC.tabBarItem.image = [mine_normalImg imageByScalingToSize:CGSizeMake(30, 30)];
    

    self.viewControllers = @[self.homeVC, self.mallVC, self.discoverVC, self.mineVC];
    self.delegate = self;
    
}

-(void) updateTips:(NSInteger)index withCount:(NSInteger)count{
    
    switch(index){
            
        case 0:{
            self.homeVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",count];
            self.homeVC.tabBarItem.badgeColor = [UIColor redColor];
        }
            break;
            
        case 1:{
            self.mallVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",count];
            self.mallVC.tabBarItem.badgeColor = [UIColor redColor];
        }
            break;
            
        case 2:{
            self.discoverVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",count];
            self.discoverVC.tabBarItem.badgeColor = [UIColor redColor];
        }
            break;
            
        case 3:{
            self.mineVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",count];
            self.mineVC.tabBarItem.badgeColor = [UIColor redColor];
        }
            break;
    }
    
}

@end
