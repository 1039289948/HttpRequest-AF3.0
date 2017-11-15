//
//  MobiReqApiTagList.m
//  TestProjectDome
//
//  Created by Mobiyun on 2017/7/3.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import "MobiReqApiTagList.h"
#import "ApiHostManager.h"

@implementation MobiReqApiTagList


+(NSString *)createRequestUrl_Tag:(MobiReqApiTag)tag typeDic:(NSDictionary *)typeDic urlType:(URL_TYPE)urlType{
   
    switch (tag) {
            
        case MobiReqApiTag_login_Normal:
            return [NSString stringWithFormat:@"%@/%@",API_HOST,[self creatnewOpenUrl:typeDic type:urlType url:@""]];
            
        case MobiReqApiTag_login_QQ:
            return [NSString stringWithFormat:@"%@%@",API_HOST,[self creatnewOpenUrl:typeDic type:urlType url:@"/qq/login"]];
            
        case MobiReqApiTag_login_WeChat:
            return [NSString stringWithFormat:@"%@%@",API_HOST,[self creatnewOpenUrl:typeDic type:urlType url:@"/wx/:auth_code"]];
            
            
        default:
            return @"";
    }

    
}


+(NSString *)creatnewOpenUrl:(NSDictionary *)dic type:(URL_TYPE)type url:(NSString *)url{

    __block NSString *returnUrl = [self asTrim:url];
    
    /**
     *  网络请求URL不带任何参数
     */
    if (type == URL_TYPE_NORMAL) {
        url = @"";
    }
    /**
     *  网络请求带拼接参数（/:key<value>）
     */
    if (type == URL_TYPE_PARAMETER_CODE) {
        
        if (dic != nil && [dic count] != 0) {
            
            NSArray <NSString *> *allKeys = dic.allKeys;
            
            [allKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                returnUrl = [returnUrl stringByReplacingOccurrencesOfString:[self asTrim:obj] withString:[self asTrim:dic[obj]]];
                
            }];
        }
    }
    
    /**
     *  网络请求带拼接参数普通（?key=value&key=value）
     */

    if (type == URL_TYPE_PARAMETER_NORMAL) {
        
        if (dic != nil && [dic count] != 0) {
            
            NSArray <NSString *> *allKeys = dic.allKeys;
            
            
            [allKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if (idx == 0) {
                    returnUrl = [NSString stringWithFormat:@"?%@=%@", [self asTrim:obj], [self asTrim:dic[obj]]];
                }else{
                    returnUrl = [NSString stringWithFormat:@"%@&%@=%@", returnUrl, [self asTrim:obj], [self asTrim:dic[obj]]];
                }
                
            }];
        }
    }
    
    return [returnUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
}



+ (NSString *) asTrim:(id)obj{

    NSString *value = @"";
    
    if ([obj isEqual:[NSNull null]] || obj == nil) {
     
        value = @"";
    }else{
        if (![obj isKindOfClass:[NSString class]]) {
            
            value = [NSString stringWithFormat:@"%@",obj];
            
        }
    }
    
    value = [obj stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    return value;
}



@end
