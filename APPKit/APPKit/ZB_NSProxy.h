//
//  ZB_NSProxy.h
//  APPKit
//
//  Created by 瞄财网 on 2017/7/6.
//  Copyright © 2017年 kdong. All rights reserved.
//

#import <Foundation/Foundation.h>
//nsproxy  ios 少有的不是继承自nsobject的类
@interface ZB_NSProxy : NSProxy

@property (nullable, nonatomic, weak, readonly) id target;

/**
 Creates a new weak proxy for target.
 
 @param target Target object.
 
 @return A new proxy object.
 */
- (instancetype _Nullable )initWithTarget:(id _Nullable )target;

/**
 Creates a new weak proxy for target.
 
 @param target Target object.
 
 @return A new proxy object.
 */
+ (instancetype _Nullable )proxyWithTarget:(id _Nullable )target;


@end
