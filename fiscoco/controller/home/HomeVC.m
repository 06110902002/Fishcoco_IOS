//
//  HomeVC.m
//  fiscoco
//
//  Created by administrator on 2018/5/21.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "HomeVC.h"
#import "HomeView.h"
#import "Masonry.h"
#import "Constants.h"
#import "SymmetricEncoder.h"
#import "HttpRequest.h"



@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setStatusBarBackgroundColor:[UIColor colorWithWhite:1.0 alpha:1.0]];
    
    self.homeView = [[HomeView alloc] init];
    [self.homeView buildTopNavbarView];
    [self.view addSubview:self.homeView];
    [self.homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT));
    }];
    
    [self testDes];
    
    
}

-(void) testDes{
    
    NSString* str1 = [SymmetricEncoder aes256_encrypt:@"AES" Encrypttext:@"liuhulai"];
    NSString* test = [SymmetricEncoder aes256_decrypt:@"AES" Decrypttext:str1];
    NSLog(@"37---------:%@",test);
    
//    HttpRequest *request = [[HttpRequest alloc] init];
//    request.URLString = @"https://www.baidu.com"; //设置请求
//    request.parameters = nil; //设置请求参数
//    //实现回调方法，处理请求回来的数据
//    request.dataHandler = ^(id _Nullable responseObject) {
//        NSLog(@"151------request:%@",responseObject);
//    };
//
//    [request SingleRequest:request];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
