//
//  HttpRequest.h
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/4.
//  Copyright © 2018 administrator. All rights reserved.
//  网络请求库

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void (^DatatHandler)(id _Nullable responseObject); //数据回调类型

@interface HttpRequest : NSObject

@property (nonatomic, strong, nullable) NSString *URLString;        //请求地址
@property (nonatomic, assign, nullable) id parameters;              //请求参数
@property (nonatomic, copy, nullable) DatatHandler dataHandler;     //请求完成后的回调
@property (nonatomic,strong)AFHTTPSessionManager* manager;

- (AFHTTPSessionManager*)sessionManager;

- (void)SingleRequest:(HttpRequest* _Nullable)request;


@end
