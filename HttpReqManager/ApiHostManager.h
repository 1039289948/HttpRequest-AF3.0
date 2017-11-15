//
//  ApiHostManager.h
//  TestProjectDome
//
//  Created by Mobiyun on 2017/7/3.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#ifndef ApiHostManager_h
#define ApiHostManager_h

// 网络请求方法
typedef enum {
    HttpRequestMethodPOST,  // 
    HttpRequestMethodGET,   //
    HttpRequestMethodPUT,   // 
    HttpRequestMethodDELETE // 删
} HttpRequestMethod;
/**
 *  测试环境
 */
#define API_HOST @""


/**
 *  翘板机
 */
//#define API_HOST @""


/**
 *  正式环境
 */
//#define API_HOST @""



#endif /* ApiHostManager_h */
