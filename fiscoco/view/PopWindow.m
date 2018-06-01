//
//  PopWindow.m
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/1.
//  Copyright © 2018 administrator. All rights reserved.
//

#import "PopWindow.h"
#import "Constants.h"

@implementation PopWindow

-(instancetype) initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        //[self initAttr];
        
    }
    return self;
    
}


-(void) show:(UIView *)targetView withOptions:(NSDictionary *)titlesAndIcons isTouchOutSideClose:(BOOL)isClose{
    
    if(!targetView || !titlesAndIcons) return;
    self.mBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 20)];
    self.mBgView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    [self addSubview:self.mBgView];
    
    NSArray* titles = [titlesAndIcons allKeys];
    for(int i = 0; i < titlesAndIcons.count; i ++){
        
        UILabel* txtLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, i * 50, 100, 50)];
        
    }
}

@end
