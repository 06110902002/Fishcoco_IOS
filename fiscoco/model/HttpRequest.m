//
//  HttpRequest.m
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/4.
//  Copyright © 2018 administrator. All rights reserved.
//  

#import "HttpRequest.h"

@implementation HttpRequest

- (AFHTTPSessionManager*)sessionManager{
    
    if (!self.manager) {
        self.manager = [AFHTTPSessionManager manager];
        self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    }

    return self.manager;
}

- (void)SingleRequest:(HttpRequest* _Nullable)request{
    
    
    [[self sessionManager] POST:request.URLString parameters:request.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        request.dataHandler ? request.dataHandler(responseObject) : nil;
        NSLog(@"31--------------:%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        request.dataHandler ? request.dataHandler(nil) : nil;
         NSLog(@"35--------------:%@",error);
    }];
    
}

@end
