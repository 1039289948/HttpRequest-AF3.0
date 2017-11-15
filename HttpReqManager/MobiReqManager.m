//
//  MobiReqManager.m
//  TestProjectDome
//
//  Created by Mobiyun on 2017/7/3.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import "MobiReqManager.h"

#import "NSUserDefaultsKeys.h"
#import "MobiReqApiTagList.h"
#import "MbyHttpManager.h"


@interface MobiReqManager ()

@property (strong, nonatomic) UIWindow *windows;
@property (strong, nonatomic) MBProgressHUD *HUD;


@end

@implementation MobiReqManager


+(MobiReqManager *)sharedInstance{
    
    static MobiReqManager *sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MobiReqManager alloc] init];
    });
    
    return sharedInstance;
}

-(instancetype)init{

    if (self = [super init]) {

    }
    return self;
}
- (UIWindow *)windows{
    
    if (_windows == nil) {
        UIApplication *app = [UIApplication sharedApplication];
        if ([app.delegate respondsToSelector:@selector(window)]){
            _windows = [app.delegate window];
        }else{
            _windows = [app keyWindow];
        }
    }
    return _windows;
}


//-(AFHTTPSessionManager *)manager{
//
//    AFHTTPSessionManager *_manager = [AFHTTPSessionManager manager];
//    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    [_manager.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Accept"];
//    [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//
//    NSString *Cookies = [[NSUserDefaults standardUserDefaults] objectForKey:@"Cookie"];
//    [_manager.requestSerializer setValue:Cookies forHTTPHeaderField:@"Set-Cookie"];
//
//    _manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    _manager.securityPolicy.allowInvalidCertificates = true;
//    _manager.securityPolicy.validatesDomainName = false;
//
//
//    return _manager;
//}
//

-(void)get_Normal_RequestApi:(MobiReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text success:(void (^)(NSDictionary *, MBProgressHUD *))success failed:(void (^)(NSError *, MBProgressHUD *))failure{
   
    [self creatWaitIngView:view text:text animated:true];
    NSString *URL = [MobiReqApiTagList createRequestUrl_Tag:tag typeDic:nil urlType:URL_TYPE_NORMAL];
    [self creatWaitIngView:view text:text animated:true];

    NSLog(@"打印URL%@",URL);
    
   [[MbyHttpManager sharedHttpManager] request:URL
                                        method:HttpRequestMethodGET
                                    parameters:nil
                                           hud:self.HUD
                                       success:^(NSDictionary *result, MBProgressHUD *hud) {
                                           success(result, hud);
                                       } failed:^(NSError *error, MBProgressHUD *hud) {
                                           hud.mode = MBProgressHUDModeText;
                                           hud.label.text = @"网络连接失败！请检查网络设置";
                                           [hud hideAnimated:true afterDelay:2];
                                           failure(error,nil);
                                       }];
    
}



-(void)get_Key_Value_RequestApi:(MobiReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text parameter:(NSDictionary *)parameter success:(void (^)(NSDictionary *, MBProgressHUD *))success failed:(void (^)(NSError *, MBProgressHUD *))failure{

    [self creatWaitIngView:view text:text animated:true];
    NSString *URL = [MobiReqApiTagList createRequestUrl_Tag:tag typeDic:parameter urlType:URL_TYPE_PARAMETER_NORMAL];
    NSLog(@"打印URL%@",URL);
    
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodGET
                                     parameters:nil
                                            hud:self.HUD
                                        success:^(NSDictionary *result, MBProgressHUD *hud) {
                                            success(result, hud);
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            hud.mode = MBProgressHUDModeText;
                                            hud.label.text = @"网络连接失败！请检查网络设置";
                                            [hud hideAnimated:true afterDelay:2];
                                            failure(error,nil);
                                        }];

}


-(void)get_Value_RequestApi:(MobiReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text parameter:(NSDictionary *)parameter success:(void (^)(NSDictionary *, MBProgressHUD *))success failed:(void (^)(NSError *, MBProgressHUD *))failure{

    [self creatWaitIngView:view text:text animated:true];
    NSString *URL = [MobiReqApiTagList createRequestUrl_Tag:tag typeDic:parameter urlType:URL_TYPE_PARAMETER_CODE];
    NSLog(@"打印URL%@",URL);
    
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodGET
                                     parameters:nil
                                            hud:self.HUD
                                        success:^(NSDictionary *result, MBProgressHUD *hud) {
                                            success(result, hud);
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            hud.mode = MBProgressHUDModeText;
                                            hud.label.text = @"网络连接失败！请检查网络设置";
                                            [hud hideAnimated:true afterDelay:2];
                                            failure(error,nil);
                                        }];

}


-(void)post_Normal_RequestApi:(MobiReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body success:(void (^)(NSDictionary *, MBProgressHUD *))success failed:(void (^)(NSError *, MBProgressHUD *))failure{

    [self creatWaitIngView:view text:text animated:true];
    NSString *URL = [MobiReqApiTagList createRequestUrl_Tag:tag typeDic:nil urlType:URL_TYPE_NORMAL];
    NSLog(@"打印URL%@",URL);

    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodPOST
                                     parameters:body
                                            hud:self.HUD
                                        success:^(NSDictionary *result, MBProgressHUD *hud) {
                                            success(result, hud);
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            hud.mode = MBProgressHUDModeText;
                                            hud.label.text = @"网络连接失败！请检查网络设置";
                                            [hud hideAnimated:true afterDelay:2];
                                            failure(error,nil);
                                        }];

    
}


-(void)post_key_Value_RequestApi:(MobiReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary *, MBProgressHUD *))success failed:(void (^)(NSError *, MBProgressHUD *))failure{

    [self creatWaitIngView:view text:text animated:true];

    NSString *URL = [MobiReqApiTagList createRequestUrl_Tag:tag typeDic:parameters urlType:URL_TYPE_PARAMETER_NORMAL];
    NSLog(@"打印URL%@",URL);
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodPOST
                                     parameters:body
                                            hud:self.HUD
                                        success:^(NSDictionary *result, MBProgressHUD *hud) {
                                            success(result, hud);
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            hud.mode = MBProgressHUDModeText;
                                            hud.label.text = @"网络连接失败！请检查网络设置";
                                            [hud hideAnimated:true afterDelay:2];
                                            failure(error,nil);
                                        }];
}

-(void)post_Value_RequestApi:(MobiReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary *, MBProgressHUD *))success failed:(void (^)(NSError *, MBProgressHUD *))failure{

    [self creatWaitIngView:view text:text animated:true];
    
    NSString *URL = [MobiReqApiTagList createRequestUrl_Tag:tag typeDic:parameters urlType:URL_TYPE_PARAMETER_CODE];
    NSLog(@"打印URL%@",URL);
    
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodPOST
                                     parameters:body
                                            hud:self.HUD
                                        success:^(NSDictionary *result, MBProgressHUD *hud) {
                                            success(result, hud);
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            hud.mode = MBProgressHUDModeText;
                                            hud.label.text = @"网络连接失败！请检查网络设置";
                                            [hud hideAnimated:true afterDelay:2];
                                            failure(error,nil);
                                        }];
    
}


/**
 *  网络请求的HUD显示
 */
- (void)creatWaitIngView:(UIView *)view text:(NSString *)text animated:(BOOL)animated{

    if (self.HUD) {
        [self.HUD removeFromSuperview];
        self.HUD = nil;
    }
    self.HUD = [[MBProgressHUD alloc]initWithView:view];
    [view addSubview:self.HUD];
    self.HUD.label.text = text;
    self.HUD.mode = MBProgressHUDModeIndeterminate;
    self.HUD.contentColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.f];
    self.HUD.bezelView.color = [UIColor colorWithWhite:0.f alpha:1];
    self.HUD.bezelView.layer.cornerRadius = 15;
    
    if (![view isKindOfClass:[UIView class]]) {
        self.HUD.backgroundView.color = [UIColor colorWithWhite:0.f alpha:0.2f];
    }
    
    [self.HUD showAnimated:animated];
}




























@end
