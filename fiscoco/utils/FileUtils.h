//
//  FileUtils.h
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/20.
//  Copyright © 2018 administrator. All rights reserved.
//  归档文件管理类：
/*
 一:a.Documents文件夹,主要用来存储一些重要的信息,比如用户资料,程序的配置文件,聊天记录等等
     .Documents中存储的信息会随着iTunes同步到电脑备份或者是iCould开发会同步到云端.该文件夹下不可存太大的内容,比如视频等.上传时会被拒掉.
    b.Caches主要存储一些缓存文件,比如视频缓存,音频缓存或者图片缓存等.
    c.tmp主要用于存储一些临时文件,比如做断点续传时的临时文件.
    这三个文件夹存储的内容都需要手动删除,极限情况下,磁盘空间不足的时候操作系统会清除tmp文件夹的内容.
 */

#import <Foundation/Foundation.h>

@interface FileUtils : NSObject


/**
 获取沙盒主目录
 @return 返回目录
 */
+(NSString*) getSandBoxHomeDir;

/**
 获取临时目录
 @return 临时目录
 */
+(NSString*) getTmpDir;


/**
 获取Document目录
 @return 返回目录
 */
+(NSString*) getDocumentDir;


/**
 获取缓存文件目录
 @return 返回缓存文件目录
 */
+(NSString*) getCacheDir;

/**
 判断指定文件是否存在

 @param fileName 文件名
 @return 检测结果
 */
+(BOOL) isExistFile:(NSString*) fileName;

/**
 删除指定文件

 @param fileName 文件名
 @return 返回删除结果
 */
+(BOOL) deleteFile:(NSString*) fileName;

/**
 将字符串写入沙盒

 @param content 待写入的内容
 @param fileName 文件名
 @return 返回写入结果
 */
+(BOOL) writeString2File:(NSString*) content fileName:(NSString*) fileName;

+(NSString*) readFile:(NSString*) fileName;


@end
