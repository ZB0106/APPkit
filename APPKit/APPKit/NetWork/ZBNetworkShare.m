//
//  ZBNetworkShare.m
//  APPKit
//
//  Created by 瞄财网 on 2017/5/8.
//  Copyright © 2017年 kdong. All rights reserved.
//

#import "ZBNetworkShare.h"
#import "AFNetworking.h"
#import "AFNetworkReachabilityManager.h"
#import "NSObject+zb_request.h"

@interface ZBNetworkShare ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@property (nonatomic, strong) AFHTTPSessionManager *backSessionManager;
@property (nonatomic, strong) AFNetworkReachabilityManager *reachManager;

@property (nonatomic, copy) NSString *baseUrl;

@end

@implementation ZBNetworkShare


static ZBNetworkShare *_instance;

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}


+ (instancetype)sessionShare
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[ZBNetworkShare alloc] init];
        
    });
    return _instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        //普通session
        _sessionManager = [AFHTTPSessionManager manager];
        
        NSString *identifier = @"com.yourcompany.appId.BackgroundSession";
        //session在每次重建时，会检查有没有没做完的任务，如果有session就会继续未完成的任务，这样很可能导致程序崩溃（在这个后台session里，每次意外退出app以后，再次重新创建后台session，都会默认开启上次崩溃前未执行完的任务，所以需要一个第三方的中介来对应一个任务
        NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:identifier];
        //后台任务session
        _backSessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:sessionConfig];
        
        
        //网络监听
        _reachManager = [AFNetworkReachabilityManager manager];
        
        //设置全局的baseUrl
        _baseUrl = @"";

    }
    return self;
}

- (void)startMonitoring
{
    
    [_reachManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"%zd",status);
    }];
    
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [_reachManager startMonitoring];
    });
}

- (NSURLSessionTask *)sendRequestBlock:(id (^)(NSObject *))requestBlock progress:(zb_progressBlock)progress success:(zb_successBlock)success failure:(zb_failureBlock)failure {
    
    if (requestBlock) {
        NSObject *requestObj = [[NSObject alloc]init];
        return [self sendRequestWithRequestModle:requestBlock(requestObj) progress:progress success:success failure:failure];
        
    }else {
        return nil;
    }
}


- (NSURLSessionTask *)sendRequestWithRequestModle:(NSObject *)requestModel progress:(zb_progressBlock)progress success:(zb_successBlock)success failure:(zb_failureBlock)failure
{
    
    NSURLSessionTask *task = nil;
    if (!self.reachManager.isReachable) {
        NSLog(@"请检查网络");
        return task;
    }
    
    switch (requestModel.zb_method) {
        case ZB_RequestMethodGET:
            {
               task = [self get:requestModel success:success failure:failure];
            }
            break;
        case ZB_RequestMethodPOST:
            {
                task = [self post:requestModel success:success failure:failure];
            }
            break;
        case ZB_RequestMethodUPLOAD:
            {
               task = [self upload:requestModel progress:progress success:success failure:failure];
            }
            break;
        case ZB_RequestMethodDOWNLOAD:
            {
               task = [self download:requestModel progress:progress success:success failure:failure];
            }
            break;
        default:
            break;
    }
    return task;
}


- (NSURLSessionDataTask *)get:(id)request success:(zb_successBlock)success failure:(zb_failureBlock)failure {
    
    NSObject *requestModel = [self handelRequestModel:request];
    
    
    return [self.sessionManager GET:requestModel.zb_requestUrl parameters:requestModel.zb_parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            if (responseObject) success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            if (error) failure(error);
        }
    }];
}

- (NSURLSessionDataTask *)post:(id)request success:(zb_successBlock)success failure:(zb_failureBlock)failure {
    
   NSObject *requestObject = [self handelRequestModel:request];
    
    return [self.sessionManager POST:requestObject.zb_requestUrl parameters:requestObject.zb_parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            if (responseObject) success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            if (error) failure(error);
        }
    }];
}
#warning resumeData 未实现
- (NSURLSessionDownloadTask *)download:(id)request progress:(zb_progressBlock)progress success:(zb_successBlock)success failure:(zb_failureBlock)failure {
    
   NSObject *requestObject = [self handelRequestModel:request];
    
    NSURLRequest *req = [self.backSessionManager.requestSerializer requestWithMethod:@"GET" URLString:requestObject.zb_requestUrl parameters:requestObject.zb_parameters error:nil];
    
    NSURLSessionDownloadTask *downloadTask = [self.backSessionManager downloadTaskWithRequest:req progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            if (downloadProgress) progress(downloadProgress);
        }
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSURL *documentUrl = [[NSFileManager defaultManager] URLForDirectory :NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        
        return [documentUrl URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (failure) {
            if (error) failure(error);
        }
        if (success) {
            if (response) success(response);
        }
    }];
    
    [downloadTask resume];
    return downloadTask;
}

- (NSURLSessionDataTask *)upload:(id)request progress:(zb_progressBlock)progress success:(zb_successBlock)success failure:(zb_failureBlock)failure {
    
    NSObject *requestObject = [self handelRequestModel:request];
    
    return [self.backSessionManager POST:requestObject.zb_requestUrl parameters:requestObject.zb_parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:requestObject.uploadRequest.fileData name:requestObject.uploadRequest.name fileName:requestObject.uploadRequest.fileName mimeType:requestObject.uploadRequest.mimeType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            if (uploadProgress) progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            if (responseObject) success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            if (error) failure(error);
        }
    }];
    
}


- (NSObject *)handelRequestModel:(NSObject *)request
{
    
//    NSString *host = request.zb_host;
    NSString *path = request.zb_path ?: @"";
//    NSString *scheme = request.zb_scheme;
    
    
    if (self.baseUrl) {
        request.zb_requestUrl = [NSString stringWithFormat:@"%@%@",self.baseUrl,path];
        return request;
    }
    if (request.zb_baseUrl) {
        request.zb_requestUrl = [NSString stringWithFormat:@"%@%@",request.zb_baseUrl,path];
        return request;
    }
    if (request.zb_scheme && request.zb_host) {
        request.zb_requestUrl = [NSString stringWithFormat:@"%@://%@%@",request.zb_scheme, request.zb_host, path];
        return request;
    }
    return request;
}
@end
