//
//  MobiQiniuManager.m
//  TestProjectDome
//
//  Created by Mobiyun on 2017/7/3.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import "MobiQiniuManager.h"

@implementation MobiQiniuManager

+(MobiQiniuManager *)sharedInstance{
    
    static MobiQiniuManager *sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MobiQiniuManager alloc] init];
    });
    
    return sharedInstance;
}



@end
