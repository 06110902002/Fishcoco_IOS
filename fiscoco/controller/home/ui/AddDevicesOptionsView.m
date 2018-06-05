//
//  AddDevicesOptionsView.m
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/4.
//  Copyright © 2018 administrator. All rights reserved.
//

#import "AddDevicesOptionsView.h"

@implementation AddDevicesOptionsView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void) initTitle:(NSMutableArray *)titles andIcon:(NSMutableArray *)icons{
    if(!titles || !icons) return;
    for(int i = 0; i < icons.count; i ++){
        
        NSString* icon = [icons objectAtIndex:i];
        UIButton* img = [[UIButton alloc] initWithFrame:CGRectMake(10, i * 45 + 7.5, 30, 30)];
        img.contentMode = UIViewContentModeScaleAspectFit;
        img.tag = i;
        [img setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
        [self addSubview:img];
        img.userInteractionEnabled = YES;
        [img addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if( i != 0){
            UIView* lineView = [[UIView alloc] initWithFrame:CGRectMake(5, i * 44, self.frame.size.width - 9, 1)];
            lineView.backgroundColor = [UIColor grayColor];
            [self addSubview:lineView];
        }
    }
    
    
   for(int i = 0; i < titles.count; i ++){
        
       UILabel* text = [[UILabel alloc] initWithFrame:CGRectMake(30 + 10 + 10, i * 45 + 7.5, 100, 30)];
       text.text = [titles objectAtIndex:i];
       text.textColor = [UIColor blackColor];
       text.font = [UIFont systemFontOfSize:14];
       text.tag = i;
       [self addSubview:text];
       text.userInteractionEnabled = YES;
       UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTap:)];
       [text addGestureRecognizer:labelTapGestureRecognizer];
        
    }
    
}

-(void)onClick:(UIButton *) button{
    if(self.onConfirm){
        self.onConfirm(button.tag);
    }
}

- (void)handleSingleTap:(UIGestureRecognizer *)recognizer {
    UILabel *label=(UILabel*)recognizer.view;
    if(self.onConfirm){
        self.onConfirm(label.tag);
    }
}

@end
