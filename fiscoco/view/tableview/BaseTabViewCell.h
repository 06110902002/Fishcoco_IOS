//
//  BaseTabViewCell.h
//  BossJob
//
//  Created by liuxiaobing on 19/08/2017.
//  Copyright © 2017 刘小兵. All rights reserved.
//

#import <UIKit/UIKit.h>


@class BaseModel;

@protocol CellClickListener

@optional
-(void) onClick:(UIView*)view data:(BaseModel*) data;
-(void) onLongClick:(UIView*) view data:(BaseModel*)data;

@end

/**
 列表中基类单元格，所有的单元均需扩展此类
 */
@interface BaseTabViewCell : UITableViewCell

@property(nonatomic,weak) id<CellClickListener> clickListener;


-(void) initItemView;

-(void) bindData:(BaseModel*_Nonnull) data;



/**
 根据tag对应的view绑定点击事件
 */
-(void) bindClickListener:(id<CellClickListener>) click;

-(UIView*) getViewByTag:(NSInteger) tag;


/**
 此接口为回收资源接口，子类需要扩展
 */
-(void) recycRes;

@end
