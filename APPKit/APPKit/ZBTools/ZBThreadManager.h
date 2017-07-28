//
//  ZBThreadManager.h
//  APPKit
//
//  Created by 瞄财网 on 2017/7/5.
//  Copyright © 2017年 kdong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZBThreadManager : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

/**
 Creates and returns a dispatch queue pool.
 @param name       The name of the pool.
 @param queueCount Maxmium queue count, should in range (1, 32).
 @param qos        Queue quality of service (QOS).
 @return A new pool, or nil if an error occurs.
 */
- (instancetype)initWithName:(nullable NSString *)name queueCount:(NSUInteger)queueCount qos:(NSQualityOfService)qos;

/// Pool's name.
@property (nullable, nonatomic, readonly) NSString *name;

/// Get a serial queue from pool.
- (dispatch_queue_t)queue;

+ (instancetype)defaultPoolForQOS:(NSQualityOfService)qos;


@end

extern dispatch_queue_t ZBDispatchQueueGetForQOS(NSQualityOfService qos);
