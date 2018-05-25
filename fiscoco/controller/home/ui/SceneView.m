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
        make.size.mas_equalTo(CGSizeMake(60.0, 60.0));
        make.center.equalTo(self);
    }];
    
    self.title = [[UILabel alloc] init];
    self.title.textColor = [UIColor whiteColor];
    self.title.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.title];
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60.0, 30.0));
        make.center.equalTo(self);
    }];
    
}

-(void)bindData:(HomeSceneEntity *)data{
    
    self.icon.image = [UIImage imageNamed:data.iconName];
    self.title.text = data.sceneName;
}

-(void) recycRes{
    
}

@end
