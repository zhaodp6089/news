//
//  HomePageViewModel.m
//  news_learning
//
//  Created by admin on 2017/8/30.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "HomePageViewModel.h"

@interface HomePageViewModel ()



@end

@implementation HomePageViewModel

- (instancetype)initWithType:(NewsListType)type {
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSAssert1(NO, @"%s 必须使用initWithType方法初始化", __func__);
    }
    return self;
}


- (NSString *)titleForRow:(NSInteger)row {
    return [[self modelForRow:row] title];
}
- (NSString *)imageUrlForRow:(NSInteger)row {
    return [[self modelForRow:row] smallpic];
}
- (NSString *)dataStringForRow:(NSInteger)row {
    return [[self modelForRow:row] time];
}
- (HomeResultNewslistModel *)modelForRow:(NSInteger)row {
    return self.dataMArr[row];
}

- (void)getDataFromNetCompletionHandler:(completionHandler)completionHandler {
    self.lastTime == nil ? self.lastTime = @"0" : self.lastTime;
    self.page == 0 ? self.page = 1 : self.page;
    self.dataTask = [HomePageNetManager getNewsListType:self.type lastTime:self.lastTime page:self.page completionHandler:^(id model, NSError *error) {
        
        if (!error) {
            HomePageModel *aModel = (HomePageModel *)model;
            if (1 == self.page) {
                [self.dataMArr removeAllObjects];
                self.dataMArr = [aModel.result.newslist mutableCopy];
            } else  {
                [self.dataMArr addObjectsFromArray:aModel.result.newslist];
            }
        }
        
        completionHandler(error);
        
    }];
}
- (void)getMoreDataCompletionHandler:(completionHandler)completionHandler {
    self.page += 1;
    HomeResultNewslistModel *amodel = [self.dataMArr lastObject];
    self.lastTime = amodel.lasttime;
    [self getDataFromNetCompletionHandler:completionHandler];
}
- (void)refreshDataCompletionHandler:(completionHandler)completionHandler {
    self.page = 1;
    self.lastTime = @"0";
    [self getDataFromNetCompletionHandler:completionHandler];
}


@end
