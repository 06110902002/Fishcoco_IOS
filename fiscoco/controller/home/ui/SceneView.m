//
//  SceneView.m
//  fiscoco
//
//  Created by administrator on 2018/5/25.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "SceneView.h"
#import "Masonry.h"
#import "HomeSceneEntity.h"

@implementation SceneView

-(instancetype) init{
    
    if(self = [super init]){
        [self initItemView];
    }
    return self;
}

-(void) initItemView{
    
    self.icon = [[UIImageView alloc] init];
    self.icon.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.icon];
    

    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70.0, 70.0));
        make.center.equalTo(self);
    }];
    
    self.title = [[UILabel alloc] init];
    self.title.textColor = [UIColor whiteColor];
    self.title.textAlignment = NSTextAlignmentCenter;
    self.title.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.title];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60.0, 30.0));
        make.top.equalTo(self.icon).offset(70);
        make.centerX.equalTo(self);
    }];
    
}

-(void)bindData:(HomeSceneEntity *)data{
    
    NSString* iconName = nil;
    switch (data.type) {
        case 0:{
            iconName = @"scene_gethome";
        }
            break;
            
        case 1:{
            iconName = @"scene_getup";
        }
            break;
            
        case 2:{
            iconName = @"scene_leave";
        }
            break;
            
        case 3:{
            iconName = @"scene_sleep";
        }
            break;
            
        default:
            iconName = @"scene_sleep";
            break;
    }
    self.icon.image = [UIImage imageNamed:iconName];
    self.title.text = data.sceneName;
    
    NSLog(@"51-----------:%@",data.sceneName);
}

-(void) recycRes{
    
}

@end
