//
//  ZBUploadRequest.h
//  APPKit
//
//  Created by 瞄财网 on 2017/5/8.
//  Copyright © 2017年 kdong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZBUploadRequest : NSObject

/**
 *  文件数据
 */
@property (nonatomic, strong) NSData *fileData;

/**
 *  服务器接收参数名
 */
@property (nonatomic, copy) NSString *name;

/**
 *  文件名
 */
@property (nonatomic, copy) NSString *fileName;

/**
 *  文件类型
 */
@property (nonatomic, copy) NSString *mimeType;


+ (instancetype)upLoadWithfileData:(NSData *)fileData name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType;

- (instancetype)initWithfileData:(NSData *)fileData name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType;

@end
