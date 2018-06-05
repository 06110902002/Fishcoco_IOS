//
//  BaseModel.m
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/5.
//  Copyright © 2018 administrator. All rights reserved.
//

#import "BaseModel.h"

@interface BaseModel ()

@end

@implementation BaseModel


-(instancetype) init{
    
    if(self = [super init]){
        
        self.delegate = self;
    }
    return self;
}

//override 协议接口
-(CellItemType) getItemType{
    
    return CellItemDefaultType;
}

@end
