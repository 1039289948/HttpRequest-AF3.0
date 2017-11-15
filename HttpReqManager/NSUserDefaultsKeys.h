//
//  NSUserDefaultsKeys.h
//  TestProjectDome
//
//  Created by Mobiyun on 2017/7/3.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#ifndef NSUserDefaultsKeys_h
#define NSUserDefaultsKeys_h


/******************QQ第三方登录********************/

#define __TencentDemoAppid__ @"1106519140"

/************************************************/



/** userDefaults */
#define M_USERDEFAULTS                 ([NSUserDefaults standardUserDefaults])
#define M_USERDEFAULTS_GET(key)        ([[NSUserDefaults standardUserDefaults] objectForKey:key])
#define M_USERDEFAULTS_DEL(key)        ([[NSUserDefaults standardUserDefaults] removeObjectForKey:key])
#define M_USERDEFAULTS_SET(value, key) [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];\
[M_USERDEFAULTS synchronize];



/**
 网络请求 设置cookie

 @return Set-Cookie
 */
#define HTTP_SET_COOKIE @"Set-Cookie"



/**
 网页URL地址
 
 @return WebUrl
 */
#define WEB_VIEW_URL @"WebUrl"

/**
 是否第一次使用

 @return first_launch
 */
#define FIRST_LAUNCH @"first_launch"

/**
 本地HTML版本

 @return html_ver
 */
#define HTML_VER_CODE @"html_ver"

/**
 ios版本信息

 @return NSDictionary
 */
#define IOS_DIC @"ios"

/**
 HTML版本信息

 @return NSDictionary
 */
#define HTML_DIC @"html"

/**
 活动

 @return 活动信息
 */
#define ACTIVITY_LIST @"activity_list"

/**
 网络状态
 
 @return netWorkStatus
 */
#define NET_WORK_STATUS @"netWorkStatus"

/**
 网络类型
 
 @return netWorkType
 */
#define NET_WORK_TYPE @"netWorkType"

/**
 探索页面
 
 @return tag
 */
#define EXPLORE_TABLE_TAG 2000

/**
 车主服务页面
 
 @return tag
 */
#define USER_SERVICE_TABLE_TAG 1000

/**
 第一次手势密码

 @return PASS_WORD_ONE
 */
#define PASS_WORD_ONE @"PASS_WORD_ONE" 

/**
 第二次手势密码

 @return PASS_WORD_TWO
 */
#define PASS_WORD_TWO @"PASS_WORD_TWO"




#endif /* NSUserDefaultsKeys_h */
