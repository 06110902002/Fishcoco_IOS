//
//  FileUtils.m
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/20.
//  Copyright © 2018 administrator. All rights reserved.
//

#import "FileUtils.h"

@implementation FileUtils



+(NSString*) getSandBoxHomeDir{
    
    NSString *homePath = NSHomeDirectory();
    return homePath;
}

+(NSString *)getDocumentDir{
    
    NSString * documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)  firstObject];
    return documentsPath;
}

+(NSString *)getTmpDir{
    
    NSString * tmpPath = NSTemporaryDirectory();
    return tmpPath;
}

+(NSString*) getCacheDir{
    //NSString *homePath = NSHomeDirectory();
    //方法1
    NSString * cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    //方法2
    //NSString * cachesPath1 = [homePath stringByAppendingString:@"/Library/Caches"];
    //方法3 此api会自动补一个/
    //NSString * cachesPath3 = [homePath stringByAppendingPathComponent:@"Library/Caches"];

    return cachesPath;
}

+(BOOL) isExistFile:(NSString*) fileName{
    NSString * documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)  firstObject];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSString * filePath = [documentsPath stringByAppendingPathComponent:fileName];
    return [fileManager fileExistsAtPath:filePath];
}

+(BOOL) deleteFile:(NSString*) fileName{
    
    NSString * documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)  firstObject];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSString * filePath = [documentsPath stringByAppendingPathComponent:fileName];
    return [fileManager removeItemAtPath:filePath error:nil];
}

+(BOOL) writeString2File:(NSString*) content fileName:(NSString*) fileName{
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)  firstObject];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    NSLog(@"64------write file path is :%@",filePath);
    NSError *error = nil;
    BOOL result = [content writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"error:%@",error);
    }
    
    return result;
    //数组写入磁盘
//    NSArray * array = @[@"我是",@"好看的",@"数组"];
//    [array writeToFile:[self filePath] atomically:YES];

}

+(NSString*) readFile:(NSString*) fileName{
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)  firstObject];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    NSLog(@"82------read file path is :%@",filePath);
    //从磁盘读出字符串
    NSString * string = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    //读出数组
    //NSArray * array = [NSArray arrayWithContentsOfFile:[self filePath]];

    return string;
}


@end
