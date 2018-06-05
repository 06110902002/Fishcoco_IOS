//
//  BaseView.h
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/5.
//  Copyright © 2018 administrator. All rights reserved.
//  项目中的视图基类

#import <UIKit/UIKit.h>
#import "TopStatusView.h"

@interface BaseView : UIView<TitleBarClickListener>

@property(nonatomic,strong) TopStatusView* titleBarView;


-(void) initTitleBarAttr: (NSString* ) backIconName title:(NSString*) title
rightOptionsIcon:(NSString*) rightIcon
rightOptionIsVisiable:(BOOL) visiable;


@end
