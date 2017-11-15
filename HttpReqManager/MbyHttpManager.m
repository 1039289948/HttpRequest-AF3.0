//
//  MbyHttpManager.m
//  LRoverObject
//
//  Created by lms on 2017/11/7.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import "MbyHttpManager.h"
#import "AppDelegate.h"

static MbyHttpManager *sharedInstance = nil;

@implementation MbyHttpManager

+ (instancetype)sharedHttpManager{
    static dispatch_once_t _once;
    dispatch_once(&_once, ^{ sharedInstance = [[MbyHttpManager alloc] init]; });
    return sharedInstance;
}

#pragma mark - 检测网络连接
+ (void)reach{
    //AFNetworkReachabilityStatusUnknown = -1 未知, NotReachable = 0 无连接, ReachableViaWWAN = 1 4G, ReachableViaWiFi = 2 wifi
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];//检测管理器的单例
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kHDNetStatusChanged object:[NSNumber numberWithLong:status]];
    }];
}

- (id)init {
    if (self = [super init]) {
        manager = [AFHTTPSessionManager manager];//超时默认60秒
        manager.requestSerializer = [AFJSONRequestSerializer serializer];//发送json
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];//返回二进制  默认返回json
        manager.requestSerializer.timeoutInterval = 60.0;
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
        manager.securityPolicy.allowInvalidCertificates = YES;
        [manager.securityPolicy setValidatesDomainName:NO];
        NSString *Cookies = [[NSUserDefaults standardUserDefaults] objectForKey:@"Cookie"];
        [manager.requestSerializer setValue:Cookies forHTTPHeaderField:@"Set-Cookie"];
    }
    return self;
}

- (void)request:(NSString *)url
         method:(HttpRequestMethod)method
     parameters:(id)parameters
            hud:(MBProgressHUD *)hud
        success:(void (^)(NSDictionary *, MBProgressHUD *))success
         failed:(void (^)(NSError *, MBProgressHUD *))failure{

    NSURLSessionTask *task;
    if (method == HttpRequestMethodGET){
        task = [manager GET:url
                 parameters:parameters progress:nil
                    success:^(NSURLSessionDataTask *task, id responseObject){
                        success(responseObject, hud);
                    }
                    failure:^(NSURLSessionDataTask *task, NSError *error){
                        failure(error, hud);
                    }];
    }
    if (method == HttpRequestMethodPOST) {
        task = [manager POST:url
                  parameters:parameters
                    progress:nil
                     success:^(NSURLSessionDataTask *task, id responseObject){
                         success(responseObject, hud);
                     }
                     failure:^(NSURLSessionDataTask *task, NSError *error){
                         failure(error, hud);
                     }];
    }
    if (method == HttpRequestMethodPUT) {
        task = [manager PUT:url
                 parameters:parameters
                    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        success(responseObject, hud);
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        failure(error, hud);
                    }];
    }
    
    if (method == HttpRequestMethodDELETE) {
        task = [manager DELETE:url
                    parameters:parameters
                       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                           success(responseObject, hud);
                       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                           failure(error, hud);
                       }];
        
    }
    
    
    if (task)  [task resume];// 启动任务
    
}


@end
