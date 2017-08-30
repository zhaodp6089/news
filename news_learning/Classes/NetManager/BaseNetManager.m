//
//  BaseNetManager.m
//  news_learning
//
//  Created by admin on 2017/8/28.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "BaseNetManager.h"

@implementation BaseNetManager

+ (AFHTTPSessionManager *)defaultAFManager {
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    return manager;
}

+ (id)get:(NSString *)path params:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))completionHandler {
    NSLog(@"path: %@, params: %@", path, params);
    return [[self defaultAFManager] GET:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self handleError:@"网络错误!"];
        completionHandler(nil, error);
    }];
}
/// 没有”网络错误“提示 和上边的方法就这一个区别
+ (id)getNotNetAlert:(NSString *)path params:(NSDictionary *)params completionHandler:(void (^)(id responseObject, NSError *error))completionHandler {
    NSLog(@"path: %@, params: %@", path, params);
    return [[self defaultAFManager] GET:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandler(nil, error);
    }];
}

+ (void)handleError:(NSError *)error  {
    //弹出错误信息
    [[self new] showErrorWithMsg:error];
}

+ (NSString *)percentPathWithPath:(NSString *)path params:(NSDictionary *)params {
    NSMutableString *percentPath = [NSMutableString stringWithString:path];
    NSArray *keys = params.allKeys;
    NSInteger count = keys.count;
    for (int i = 0; i < count; i++) {
        if (i == 0) {
            [percentPath appendFormat:@"?%@=%@", keys[i], params[keys[i]]];
        }else {
            [percentPath appendFormat:@"&%@=%@", keys[i], params[keys[i]]];
        }
    }
    return [percentPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
/*
+ (NSString *)normalUrl:(NSString *)str {
    return [NORMAL_ADDRESS stringByAppendingString:str];
}
*/
@end
