//
//  MbyHttpManager.h
//  LRoverObject
//
//  Created by lms on 2017/11/7.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "ApiHostManager.h"
#import <MBProgressHUD.h>

@interface MbyHttpManager : NSObject{
    AFHTTPSessionManager *manager;
}
@property (strong, nonatomic) MBProgressHUD *HUD;

+ (void)reach;
+ (instancetype)sharedHttpManager;

/**获取网络请求方法
 * url   接口方法
 * method       请求方法 get/post/put/delete
 * parameters   参数对象
 * hud   弹框提示
 **/

- (void)request:(NSString *)url
         method:(HttpRequestMethod)method
     parameters:(id)parameters
            hud:(MBProgressHUD *)hud
        success:(void (^)(NSDictionary *result, MBProgressHUD *hud))success
         failed:(void (^)(NSError* error, MBProgressHUD *hud))failure;
@end
