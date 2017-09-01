//
//  wordNetManager.h
//  news_learning
//
//  Created by admin on 2017/8/31.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "BaseNetManager.h"
#import "wordModel.h"

@interface wordNetManager : BaseNetManager

+ (id)getWordDataWithPage:(NSInteger)page completionHandler:(void(^)(id model, NSError *error))completionHandler;
+ (id)getPicDataWithSetID:(NSInteger)setID completionHandler:(void(^)(id model, NSError *error))completionHandler;

@end
