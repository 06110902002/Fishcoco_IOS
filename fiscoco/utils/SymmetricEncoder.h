//
//  SymmetricEncoder.h
//  fiscoco
//
//  Created by 刘小兵 on 2018/6/4.
//  Copyright © 2018 administrator. All rights reserved.
//  AES加密解密工具类

#import <Foundation/Foundation.h>

@interface SymmetricEncoder : NSObject

+(NSData *)AES256ParmEncryptWithKey:(NSString *)key Encrypttext:(NSData *)text;   //加密
+(NSData *)AES256ParmDecryptWithKey:(NSString *)key Decrypttext:(NSData *)text;   //解密
+(NSString *) aes256_encrypt:(NSString *)key Encrypttext:(NSString *)text;
+(NSString *) aes256_decrypt:(NSString *)key Decrypttext:(NSString *)text;


@end
