//
//  HomePageNetManager.m
//  news_learning
//
//  Created by admin on 2017/8/28.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "HomePageNetManager.h"


@implementation HomePageNetManager

+ (id)getNewsListType:(NewsListType)type lastTime:(NSString *)lastTime page:(NSInteger)page completionHandler:(void(^)(id model, NSError *error))completionHandler {
    NSString *path = nil;
    switch (type) {
        case NewsListTypeZuiXin: {
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt0-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        case NewsListTypeXinWen: {
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt1-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        case NewsListTypePingCe: {
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt3-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        case NewsListTypeDaoGou: {
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt60-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        case NewsListTypeYongChe: {
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt82-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        case NewsListTypeJiShu: {
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt102-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        case NewsListTypeWenHua: {
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt97-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        case NewsListTypeGaiZhuang: {
            path = [NSString stringWithFormat: @"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt107-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        case NewsListTypeYouJi: {
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt100-p%ld-s30-l%@.json", page, lastTime];
            break;
        }
        default: {
            break;
        }
    }
    
    return [self get:path params:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([HomePageModel mj_objectWithKeyValues:responseObj], error);
    }];
}

@end
