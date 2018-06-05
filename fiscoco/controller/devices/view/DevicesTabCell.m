//
//  DevicesTabCell.m
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/5.
//  Copyright © 2018 administrator. All rights reserved.
//

#import "DevicesTabCell.h"
#import "Masonry.h"

@implementation DevicesTabCell


//ovride
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        [self initItemView];
    }
    return self;
}

//ovride super class method for initView
-(void) initItemView{
    
    self.selectionStyle = UITableViewCellSelectionStyleNone; //取消点击时背景色
    
   
    
    
}


//ovride super class method
-(void) bindData:(BaseModel*_Nonnull) data{
    
    if(self.data != (DevicesEntity*) data){
        
        self.data = (DevicesEntity*) data;
        
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, self.frame.size.width, 40)];
        self.nameLabel.text = self.data.name;
        self.nameLabel.textColor = [UIColor blueColor];
        self.nameLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview: self.nameLabel];
        
    }
    
}

-(void)imgActionDown:(UITapGestureRecognizer*) gestureRecognizer{
    
    UIView* viewClicked=[gestureRecognizer view];
//    if (viewClicked == self.imgModify) {
//
//        NSLog(@"90---------self.imgModify");
//    }
//    else if(viewClicked==self.imgDelete)
//    {
//        NSLog(@"94---------self.imgDelete");
//    }
    
    
    
}


@end
