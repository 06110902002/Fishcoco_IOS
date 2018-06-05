//
//  BaseModel.h
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/5.
//  Copyright © 2018 administrator. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 构建UItableView cell的类型枚举
 - QuickWordsType: 快捷消息类型
 - QuickWordsType: 快捷消息增加类型
 */
typedef NS_ENUM(NSInteger, CellItemType) {
    
    CellItemDefaultType = 1,
    QuickWordsType,
    QuickWordsAddType,
    
    
};

/**
 *数据类型协议接口，通常用于同一个tableView中展示不同的item类型
 */
@protocol ItemType <NSObject>

@optional
-(CellItemType) getItemType;

@end


/**
 列表中的基类接口
 */
@interface BaseModel : NSObject<ItemType>

@property(nonatomic,weak) id<ItemType> delegate;

@property(nonatomic,copy) NSString* name;

@end
