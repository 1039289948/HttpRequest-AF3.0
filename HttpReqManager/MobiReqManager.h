//
//  MobiReqManager.h
//  TestProjectDome
//
//  Created by Mobiyun on 2017/7/3.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MobiReqApiTagList.h"
#import <MBProgressHUD.h>
#import "ApiHostManager.h"

/**
 *  封装的网络请求管理类库
 */
@interface MobiReqManager : NSObject


/**
 网络请求单例实例化

 @return MobiReqManager
 */
+(MobiReqManager *)sharedInstance;

/**
 get请求（没有任何参数的 get 请求

 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param success 成功返回数据
 @param failure 失败返回数据
 */
-(void)get_Normal_RequestApi:(MobiReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text success:(void(^)(NSDictionary *result, MBProgressHUD *hud))success failed:(void (^) (NSError *error, MBProgressHUD *hud))failure;


/**
 get请求（带有参数的 get 请求 < ?key=value&key=value >）

 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param parameter URL拼接参数
 @param success 成功返回数据
 @param failure 失败返回数据
 */
-(void)get_Key_Value_RequestApi:(MobiReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text parameter:(NSDictionary *)parameter success:(void(^)(NSDictionary *result, MBProgressHUD *hud))success failed:(void (^) (NSError *error, MBProgressHUD *hud))failure;


/**
 get请求（带有参数的 get 请求  /:key<value> ）

 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param parameter 拼接参数
 @param success 成功返回数据
 @param failure 失败返回数据
 */
-(void)get_Value_RequestApi:(MobiReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text parameter:(NSDictionary *)parameter success:(void(^)(NSDictionary *result, MBProgressHUD *hud))success failed:(void (^) (NSError *error, MBProgressHUD *hud))failure;


/**
 post请求（没有任何拼接参数的post请求）

 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param body post请求参数
 @param success 成功返回数据
 @param failure 失败返回数据
 */
-(void)post_Normal_RequestApi:(MobiReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body success:(void(^)(NSDictionary *result, MBProgressHUD *hud))success failed:(void (^) (NSError *error, MBProgressHUD *hud))failure;


/**
 post请求（带有拼接参数的post请求<?key=value&key=value>）

 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param body post请求参数
 @param parameters URL拼接参数
 @param success 成功返回数据
 @param failure 失败返回数据
 */
-(void)post_key_Value_RequestApi:(MobiReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body parameters:(NSDictionary *)parameters success:(void(^)(NSDictionary *result, MBProgressHUD *hud))success failed:(void (^) (NSError *error, MBProgressHUD *hud))failure;


/**
 post请求（带有拼接参数的post请求 /:key<value>/:key<value> ）

 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param body post请求参数
 @param parameters URL拼接参数
 @param success 成功返回数据
 @param failure 失败返回数据
 */
-(void)post_Value_RequestApi:(MobiReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body parameters:(NSDictionary *)parameters success:(void(^)(NSDictionary *result, MBProgressHUD *hud))success failed:(void (^) (NSError *error, MBProgressHUD *hud))failure;










@end
