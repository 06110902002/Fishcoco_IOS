//
//  SceneView.h
//  fiscoco
//
//  Created by administrator on 2018/5/25.
//  Copyright © 2018年 administrator. All rights reserved.
//  首页场景视图

#import <UIKit/UIKit.h>
@class HomeSceneEntity;

@interface SceneView : UICollectionViewCell

@property(nonatomic,strong,nonnull) UIImageView* icon;
@property(nonatomic,strong,nonnull) UILabel* title;

-(void) initItemView;

-(void) bindData:(HomeSceneEntity*_Nonnull) data;

-(void) recycRes;

@end
