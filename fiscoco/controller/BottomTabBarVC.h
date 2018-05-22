//
//  BottomTabBarVC.h
//  fiscoco
//
//  Created by administrator on 2018/5/21.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeVC;
@class MallVC;
@class DiscoverVC;
@class MineVC;

@interface BottomTabBarVC : UITabBarController<UITabBarControllerDelegate>

@property(nonatomic,strong) HomeVC* homeVC;
@property(nonatomic,strong) MallVC* mallVC;
@property(nonatomic,strong) DiscoverVC* discoverVC;
@property(nonatomic,strong) MineVC* mineVC;



-(void) initMenu;


/**
 更新底部导航未读消息
 
 @param index 待更新的uibatitem索引
 @param count 消息数
 */
-(void) updateTips:(NSInteger) index withCount:(NSInteger) count;


@end
