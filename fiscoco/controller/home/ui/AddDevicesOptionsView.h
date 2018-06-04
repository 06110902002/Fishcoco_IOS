//
//  AddDevicesOptionsView.h
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/4.
//  Copyright © 2018 administrator. All rights reserved.
//  右上角添加设备选择操作视图

#import <UIKit/UIKit.h>

typedef void (^ OnCanfrimListener)(NSUInteger tag);          //确认的回调

@interface AddDevicesOptionsView : UIView

@property(nonatomic,copy) OnCanfrimListener onConfirm;
@property(nonatomic,strong) void(^OnCancelListener)(NSUInteger tag);

-(void) initTitle:(NSMutableArray*) titles andIcon:(NSMutableArray*) icons;


@end
