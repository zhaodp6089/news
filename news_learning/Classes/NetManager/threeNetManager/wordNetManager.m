//
//  wordNetManager.m
//  news_learning
//
//  Created by admin on 2017/8/31.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "wordNetManager.h"

@implementation wordNetManager

+ (id)getWordDataWithPage:(NSInteger)page completionHandler:(void(^)(id model, NSError *error))completionHandler {
    NSString *path = [NSString stringWithFormat:@"http://joke.luckyamy.com/api/?cat=dz&p=%ld&ap=ymds&ver=1.6", page];
    return [self get:path params:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([wordModel mj_objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getPicDataWithSetID:(NSInteger)setID completionHandler:(void(^)(id model, NSError *error))completionHandler {
    
    NSString *path = [NSString stringWithFormat:@"http://c.3g.163.com/photo/api/morelist/0096/4GJ60096/%ld.json", setID];
    return [self get:path params:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([PicModel mj_objectArrayWithKeyValuesArray:responseObj], error);
    }];
}



@end
