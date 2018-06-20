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
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, (self.frame.size.height - 40) / 2, self.frame.size.width, 40)];
    self.nameLabel.text = @"test";
    self.nameLabel.textColor = [UIColor blueColor];
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview: self.nameLabel];
    
    self.linkIcon = [[UIImageView alloc] initWithFrame:CGRectMake(5, (self.frame.size.height - 35) / 2, 35, 35)];
    self.linkIcon.contentMode = UIViewContentModeRedraw;
    self.linkIcon.image = [UIImage imageNamed:@"space_equipment_normal"];
    self.linkIcon.userInteractionEnabled = true;
    self.linkIcon.tag = 23;
    [self addSubview:self.linkIcon];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgActionDown:)];
    [self.linkIcon addGestureRecognizer:singleTap];
    
}


//ovride super class method
-(void) bindData:(BaseModel*_Nonnull) data{
    
    if(self.data != (DevicesEntity*) data){
        
        self.nameLabel.text = data.name;
        self.data = (DevicesEntity*) data;
        
        
    }
    
   
}


-(void)imgActionDown:(UITapGestureRecognizer*) gestureRecognizer{
    
    UIView* viewClicked=[gestureRecognizer view];
    if (viewClicked.tag == 23 && self.clickListener) {
        [self.clickListener onClick:viewClicked data:self.data];
    }

}


@end
