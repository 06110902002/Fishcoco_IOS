//
//  PopWindow.h
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/1.
//  Copyright © 2018 administrator. All rights reserved.
//  弹出框，在任何位置弹出对话框

#import <UIKit/UIKit.h>

//使用block 作取消的回调
typedef void(^CancelListener)(UIView* view);


@interface PopWindow : UIView


@property(nonatomic,strong) UIView* mBgView;

@property(nonatomic,strong) CancelListener onCancel;


//声明一个block的属性
@property(nonatomic,strong) void (^ConfirmListener)(UIView* );


/**
 显示

 @param targetView 目标视图
 @param titlesAndIcons 文本与图标
 @param isClose 触摸外面是否可关闭本弹窗
 */
-(void) show :(UIView*) targetView withOptions:(NSDictionary*) titlesAndIcons isTouchOutSideClose:(BOOL) isClose;

@end
