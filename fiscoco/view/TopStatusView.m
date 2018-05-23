//
//  TopStatusView.m
//  fiscoco
//
//  Created by administrator on 2018/5/21.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "TopStatusView.h"
#import "UIImage+UIImageExtras.h"
#import "UILabel+LabelHeightAndWidth.h"
#import "Masonry.h"

@implementation TopStatusView

-(instancetype) initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        //[self initAttr];
        
    }
    return self;
    
}

-(void) initAttr: (NSString* ) backIconName
rightOptionsIcon:(NSString*) rightIcon
rightOptionIsVisiable:(BOOL) visiable{
    
    self.imgBack = [[UIImageView alloc] init];
    UIImage* back_img = [UIImage imageNamed:backIconName];
    self.imgBack.image = [back_img imageByScalingToSize:CGSizeMake(45, 45)];
    self.imgBack.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.imgBack addGestureRecognizer:singleTap];
    [self addSubview:self.imgBack];
    
    [self.imgBack mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(45.0, 45.0));
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(5);
    }];
    
    if(visiable){
        
        self.imgMore = [[UIImageView alloc] init];
        UIImage* more_img = [UIImage imageNamed:rightIcon];
        self.imgMore.image = [more_img imageByScalingToSize:CGSizeMake(45, 45)];
        self.imgMore.userInteractionEnabled = YES;
        UITapGestureRecognizer *moreTab = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [self.imgMore addGestureRecognizer:moreTab];
        [self addSubview:self.imgMore];
        
        [self.imgMore mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(45.0, 45.0));
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(-5);
        }];
    }
    
}

- (void)handleSingleTap:(UIGestureRecognizer *)gestureRecognizer {
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.imgBack];
    
    if (CGRectContainsPoint(self.imgBack.bounds, touchPoint)) {
        
        if(self.titleClickListenr){
            [self.titleClickListenr onBack];
        }
    }
    
    if (CGRectContainsPoint(self.imgMore.bounds, [gestureRecognizer locationInView:self.imgMore])) {
        if(self.titleClickListenr){
            [self.titleClickListenr onMore];
        }
        
    }
    
}

-(void) setTitle:(NSString *)title{
    
    UILabel* label = [[UILabel alloc] init];
    UIFont* font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor whiteColor];
    label.text = title;
    label.font = font;
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    CGFloat width = [UILabel getWidthWithTitle:title font:font];
    
    [self addSubview:label];
    
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(width, 45.0));
        make.centerY.equalTo(self);
        make.centerX.equalTo(self);
    }];
    
}

@end
