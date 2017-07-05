//
//  ZBThreadManager.m
//  APPKit
//
//  Created by 瞄财网 on 2017/7/5.
//  Copyright © 2017年 kdong. All rights reserved.
//

#import "ZBThreadManager.h"

#if defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
static inline qos_class_t NSQualityOfServiceToQOSClass(NSQualityOfService qos) {
    switch (qos) {
        case NSQualityOfServiceUserInteractive: return QOS_CLASS_USER_INTERACTIVE; break;
        case NSQualityOfServiceUserInitiated: return QOS_CLASS_USER_INITIATED; break;
        case NSQualityOfServiceUtility: return QOS_CLASS_UTILITY; break;
        case NSQualityOfServiceBackground: return QOS_CLASS_BACKGROUND; break;
        case NSQualityOfServiceDefault: return QOS_CLASS_DEFAULT; break;
        default: return QOS_CLASS_UNSPECIFIED;
    }
}
#else
static inline dispatch_queue_priority_t NSQualityOfServiceToDispatchPriority(NSQualityOfService qos) {
    switch (qos) {
        case NSQualityOfServiceUserInteractive: return DISPATCH_QUEUE_PRIORITY_HIGH; break;
        case NSQualityOfServiceUserInitiated: return DISPATCH_QUEUE_PRIORITY_HIGH; break;
        case NSQualityOfServiceUtility: return DISPATCH_QUEUE_PRIORITY_LOW; break;
        case NSQualityOfServiceBackground: return DISPATCH_QUEUE_PRIORITY_BACKGROUND; break;
        case NSQualityOfServiceDefault: return DISPATCH_QUEUE_PRIORITY_DEFAULT; break;
        default: return DISPATCH_QUEUE_PRIORITY_DEFAULT; break;
    }
}
#endif

typedef struct {
    const char *name;
    void **queues;
    uint32_t queueCount;
    int32_t counter;
} ZBDispatchContext;

static ZBDispatchContext *ZBDispatchContextCreate(const char *name, uint32_t queueCount, NSQualityOfService qos){
    ZBDispatchContext *context = calloc(1, sizeof(ZBDispatchContext));
    if (!context) return NULL;
    context ->queues = calloc(queueCount, sizeof(void *));
    if (!context->queues) {
        free(context);
        return NULL;
    }
#if defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    dispatch_qos_class_t qosClass = NSQualityOfServiceToQOSClass(qos);
    for (NSUInteger i = 0; i < queueCount; i ++) {
        dispatch_queue_attr_t attr = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, qosClass, 0);
        dispatch_queue_t queue = dispatch_queue_create(name, attr);
        context->queues[i] = (__bridge_retained void *)queue;
    }
#else 
    dispatch_queue_priority_t priority = NSQualityOfServiceToDispatchPriority(qos);
    for (NSUInteger i = 0; i < queueCount; i ++) {
        dispatch_queue_t queue = dispatch_queue_create(name, DISPATCH_QUEUE_SERIAL);
        //设置queue的优先级与目标queue的优先级一致，默认的与获取到的
        dispatch_set_target_queue(queue, dispatch_get_global_queue(priority, 0));
        context->queques[i] = (__bridge_retained void *)queue
        ;
    }
#endif
    context->queueCount = queueCount;
    if (name) {
        context->name = strdup(name);
    }
    return context;
}

static void ZBDispatchContextRelease(ZBDispatchContext *context) {
    if (!context) return;
    if (context->queues) {
        for (NSUInteger i = 0; i < context->queueCount; i++) {
            void *queuePointer = context->queues[i];
            dispatch_queue_t queue = (__bridge_transfer dispatch_queue_t)(queuePointer);
            const char *name = dispatch_queue_get_label(queue);
            if (name) strlen(name); // avoid compiler warning
            queue = nil;
        }
        free(context->queues);
        context->queues = NULL;
    }
    if (context->name) free((void *)context->name);
}


@implementation ZBThreadManager





@end
