//
//  DevicesEntity.h
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/5.
//  Copyright © 2018 administrator. All rights reserved.
//  设备信息实体

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface DevicesEntity : BaseModel


@property(nonatomic,strong) NSMutableArray* condList;
@property(nonatomic,strong) NSMutableArray* actList;
@property(nonatomic,assign) BOOL open;

@end
