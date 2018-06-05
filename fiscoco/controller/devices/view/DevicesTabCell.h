//
//  DevicesTabCell.h
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/5.
//  Copyright © 2018 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTabViewCell.h"
#import "DevicesEntity.h"

@interface DevicesTabCell : BaseTabViewCell

@property(nonatomic,strong) UILabel* nameLabel;
@property(nonatomic,strong) UIImageView* linkIcon;
@property(nonatomic,strong) UIButton* OnOrOff;
@property(nonatomic,strong) DevicesEntity* data;

@end
