//
//  EquOrSpaceView.h
//  fiscoco
//
//  Created by administrator on 2018/5/28.
//  Copyright © 2018年 administrator. All rights reserved.
//  设备或者空间的item视图

#import <UIKit/UIKit.h>
@class EquOrSpaceEntity;

@interface EquOrSpaceView : UICollectionViewCell

@property(nonatomic,strong,nonnull) UIImageView* icon;
@property(nonatomic,strong,nonnull) UILabel* title;
@property(nonatomic,assign) BOOL isGrid;

-(void) initItemView;

-(void) bindData:(EquOrSpaceEntity*_Nonnull) data;

-(void) recycRes;

@end

