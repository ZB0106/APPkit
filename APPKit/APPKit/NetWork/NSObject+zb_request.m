//
//  NSObject+zb_request.m
//  APPKit
//
//  Created by 瞄财网 on 2017/5/8.
//  Copyright © 2017年 kdong. All rights reserved.
//

#import "NSObject+zb_request.h"
#import <objc/runtime.h>

@implementation NSObject (zb_request)

- (void)setZb_host:(NSString *)zb_host
{
    objc_setAssociatedObject(self, @selector(zb_host), zb_host, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)zb_host
{
    return objc_getAssociatedObject(self, @selector(zb_host));
}
- (void)setZb_scheme:(NSString *)zb_scheme
{
    objc_setAssociatedObject(self, @selector(zb_scheme), zb_scheme, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)zb_scheme
{
    return objc_getAssociatedObject(self, @selector(zb_scheme));
}

- (NSString *)zb_path
{
    return objc_getAssociatedObject(self, @selector(zb_path));
}

- (void)setZb_path:(NSString *)zb_path
{
    objc_setAssociatedObject(self, @selector(zb_path), zb_path, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)zb_baseUrl
{
    return objc_getAssociatedObject(self, @selector(zb_baseUrl));
}
- (void)setZb_baseUrl:(NSString *)zb_baseUrl
{
    objc_setAssociatedObject(self, @selector(zb_baseUrl), zb_baseUrl, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (ZB_RequestMethod)zb_method
{
    return [(NSNumber *)objc_getAssociatedObject(self, @selector(zb_method)) integerValue];
}
- (void)setZb_method:(ZB_RequestMethod)zb_method
{
    objc_setAssociatedObject(self, @selector(zb_method), [NSNumber numberWithInteger:zb_method], OBJC_ASSOCIATION_ASSIGN);
}
- (NSDictionary *)zb_parameters
{
   return objc_getAssociatedObject(self, @selector(zb_parameters));
}
- (void)setZb_parameters:(NSDictionary *)zb_parameters
{
    objc_setAssociatedObject(self, @selector(zb_parameters), zb_parameters, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ZBUploadRequest *)uploadRequest
{
    return objc_getAssociatedObject(self, @selector(uploadRequest));
}

- (void)setUploadRequest:(ZBUploadRequest *)uploadRequest
{
    objc_setAssociatedObject(self, @selector(uploadRequest), uploadRequest, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (NSString *)zb_requestUrl
{
    return objc_getAssociatedObject(self, @selector(zb_requestUrl));
}
- (void)setZb_requestUrl:(NSString *)zb_requestUrl
{
    objc_setAssociatedObject(self, @selector(zb_requestUrl), zb_requestUrl, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end
