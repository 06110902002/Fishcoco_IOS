//
//  EquOrSpaceView.m
//  fiscoco
//
//  Created by administrator on 2018/5/28.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "EquOrSpaceView.h"
#import "Masonry.h"
#import "EquOrSpaceEntity.h"

@implementation EquOrSpaceView

-(instancetype) init{
    
    if(self = [super init]){
        [self initItemView];
    }
    return self;
}

-(void) initItemView{
    self.isGrid = false;
    self.backgroundColor = [UIColor whiteColor];
    
    self.icon = [[UIImageView alloc] init];
    self.icon.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.icon];
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40.0, 40.0));
        make.leftMargin.mas_offset(10);
        make.centerY.equalTo(self);
    }];
    
    self.title = [[UILabel alloc] init];
    self.title.textColor = [UIColor whiteColor];
    self.title.textAlignment = NSTextAlignmentCenter;
    self.title.font = [UIFont systemFontOfSize:14];
    self.title.textColor = [UIColor blackColor];
    [self addSubview:self.title];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60.0, 30.0));
        make.leftMargin.mas_offset(60);
        make.centerY.equalTo(self);
    }];
    
}

- (void)setIsGrid:(BOOL)isGrid{
    
    _isGrid = isGrid;
    
    if (isGrid) {
    
        [self.icon mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(10);
            make.size.mas_equalTo(CGSizeMake(60.0, 30.0));
            make.centerX.equalTo(self);
        }];
        
        [self.title mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60.0, 30.0));
            make.top.equalTo(self.icon.mas_bottom).offset(10);
            make.centerX.equalTo(self);
        }];

    } else {

        [self.icon mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(40.0, 40.0));
            make.leftMargin.mas_offset(10);
            make.centerY.equalTo(self);
        }];
        
        [self.title mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60.0, 30.0));
            make.leftMargin.mas_offset(60);
            make.centerY.equalTo(self);
        }];
    }
}

-(void)bindData:(EquOrSpaceEntity *)data{
    
    NSString* iconName = nil;
    switch (data.type) {
        case 0:{
            iconName = @"kaiguan_icon";
        }
            break;
            
        case 1:{
            iconName = @"linkage_electric_machine_icon";
        }
            break;
            
        case 2:{
            iconName = @"equipment_color_icon_curtain_motor";
        }
            break;
            
        case 3:{
            iconName = @"equipment_color_icon_switch_new";
        }
            break;
            
        default:
            iconName = @"equipment_color_icon_switch_new";
            break;
    }
    self.icon.image = [UIImage imageNamed:iconName];
    self.title.text = data.name;
    
    NSLog(@"105-----------:%@",data.name);
}

-(void) recycRes{
    
}

@end
