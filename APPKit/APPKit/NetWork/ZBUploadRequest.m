//
//  ZBUploadRequest.m
//  APPKit
//
//  Created by 瞄财网 on 2017/5/8.
//  Copyright © 2017年 kdong. All rights reserved.
//

#import "ZBUploadRequest.h"

@implementation ZBUploadRequest

- (instancetype)initWithfileData:(NSData *)fileData name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType
{
    if (self = [super init]) {
        _fileData = fileData;
        _name = name;
        _fileName = fileName;
        _mimeType = mimeType;
    }
    return self;
}

+ (instancetype)upLoadWithfileData:(NSData *)fileData name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType
{
    return [[self alloc] initWithfileData:fileData name:name fileName:fileName mimeType:mimeType];
}
@end
