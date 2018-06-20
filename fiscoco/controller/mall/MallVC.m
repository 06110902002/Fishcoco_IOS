//
//  Mall.m
//  fiscoco
//
//  Created by administrator on 2018/5/21.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "MallVC.h"
#import "FileUtils.h"

@interface MallVC ()

@end

@implementation MallVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *homePathBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 100, 40)];
    homePathBtn.backgroundColor = [UIColor grayColor];
    [homePathBtn setTitle:@"homePath" forState:UIControlStateNormal];
    homePathBtn.tag = 23;
    [homePathBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:homePathBtn];
    
    UIButton *existFile = [[UIButton alloc] initWithFrame:CGRectMake(120, 20, 100, 40)];
    existFile.backgroundColor = [UIColor grayColor];
    [existFile setTitle:@"existFile" forState:UIControlStateNormal];
    existFile.tag = 24;
    [existFile addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:existFile];
    
    UIButton *write = [[UIButton alloc] initWithFrame:CGRectMake(230, 20, 100, 40)];
    write.backgroundColor = [UIColor grayColor];
    [write setTitle:@"writeFile" forState:UIControlStateNormal];
    write.tag = 25;
    [write addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:write];
    
    
    UIButton *read = [[UIButton alloc] initWithFrame:CGRectMake(10, 70, 100, 40)];
    read.backgroundColor = [UIColor grayColor];
    [read setTitle:@"read" forState:UIControlStateNormal];
    read.tag = 26;
    [read addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:read];
   
}

-(void) onClick:(UIButton*) button{
    
    switch (button.tag) {
        case 23:{
            NSString* homePath = [FileUtils getSandBoxHomeDir];
            NSLog(@"22-------------homePath:%@",homePath);
        }
            
            break;
            
        case 24:{
            
            NSLog(@"51-------------isExistFile:%d",[FileUtils isExistFile:@"test.txt"]);
        }
            
        case 25:{
            
            NSLog(@"63-------------write:%d",[FileUtils writeString2File:@"this is test content" fileName:@"test.txt"]);
        }
            break;
        case 26:
            NSLog(@"63-------------read:%@",[FileUtils readFile:@"test.txt"]);
            
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
