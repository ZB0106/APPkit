//
//  NSObject+zb_request.h
//  APPKit
//
//  Created by 瞄财网 on 2017/5/8.
//  Copyright © 2017年 kdong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZBUploadRequest.h"

typedef enum : NSUInteger {
    /** GET */
    ZB_RequestMethodGET,
    /** POST */
    ZB_RequestMethodPOST,
    /** UPLOAD */
    ZB_RequestMethodUPLOAD,
    /** DOWNLOAD */
    ZB_RequestMethodDOWNLOAD
    
} ZB_RequestMethod;


@interface NSObject (zb_request)

/**
 *  scheme (eg: http, https, ftp)
 */
@property (nonatomic, copy, nonnull) NSString *zb_scheme;

/**
 *  host
 */
@property (nonatomic, copy, nonnull) NSString *zb_host;

/**
 *  path
 */
@property (nonatomic, copy, nonnull) NSString *zb_path;

/**
 *  method
 */
@property (nonatomic, assign) ZB_RequestMethod zb_method;

/**
 *  baseurl
 */
@property (nonatomic, copy, nonnull) NSString *zb_baseUrl;

/**
 *  发起请求时使用的url
 */
@property (nonatomic, copy, nonnull) NSString *zb_requestUrl;


/**
 *  parameters
 */
@property (nonatomic, strong, nonnull) NSDictionary *zb_parameters;

@property (nonatomic, strong) ZBUploadRequest *uploadRequest;

@end
