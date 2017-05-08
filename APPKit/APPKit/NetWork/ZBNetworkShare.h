//
//  ZBNetworkShare.h
//  APPKit
//
//  Created by 瞄财网 on 2017/5/8.
//  Copyright © 2017年 kdong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZBNetworkShare : NSObject


- (void)startMonitoring;

+ (instancetype)sessionShare;
/**
 
 请求成功block
 */
typedef void(^zb_successBlock)(id responseObject);
/**
 
 请求失败block
 */

typedef void(^zb_failureBlock)(NSError *error);


/**
 进度block
 
 */
typedef void(^zb_progressBlock)(NSProgress *progress);

/**
 请求响应block
 
 */
typedef void(^zb_responseBlock)(NSURLResponse *response, NSError *error);


/**
 *  请求超时时间
 */
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

/**
 reachable
 */
@property (readonly, nonatomic, assign, getter = isReachable) BOOL reachable;

/**
 reachableViaWWAN
 */
@property (readonly, nonatomic, assign, getter = isReachableViaWWAN) BOOL reachableViaWWAN;

/**
 reachableViaWiFi
 */
@property (readonly, nonatomic, assign, getter = isReachableViaWiFi) BOOL reachableViaWiFi;


@property (nonatomic, copy, readonly) NSString *baseUrl;

/**
 *  取消所有操作
 */
- (void)cancelAllOperations;




/**
 发送请求

 */
- (NSURLSessionTask *)sendRequestWithRequestModle:(NSObject *)requestModel  progress:(zb_progressBlock)progress success:(zb_successBlock)success failure:(zb_failureBlock)failure;


@end
