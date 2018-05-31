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
@property(nonatomic,strong) EquOrSpaceEntity* data;
@property(nonatomic,assign) CGPoint startPos;
@property(nonatomic,strong) CABasicAnimation* mAnim;

-(void) initItemView;

-(void) bindData:(EquOrSpaceEntity*_Nonnull) data;


/**
 获取动画对象

 @param time 动画时间
 @param type 动画类型
 @return 动画对象
 */
-(CABasicAnimation*) buildAnim:(CFTimeInterval )time totateType:(NSInteger) type;

-(void) recycRes;

@end

