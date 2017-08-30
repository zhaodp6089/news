//
//  HomePageViewModel.m
//  news_learning
//
//  Created by admin on 2017/8/30.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "HomePageViewModel.h"


@implementation HomePageViewModel

- (void)homePageLoadDataWith:(NewsListType)type Page:(NSInteger)page LastTime:(NSString *)lastTime completionHandler:(void(^)(NSError *error))completionHandler {
    self.dataTask = [HomePageNetManager getNewsListType:type lastTime:lastTime page:page completionHandler:^(id model, NSError *error) {
        
        if (error) return;
        
        self.page = page;
        HomePageModel *aModel = (HomePageModel *)model;
        if (1 == page) {
            [self.dataMArr removeAllObjects];
            self.dataMArr = [aModel.result.newslist mutableCopy];
        } else  {
            [self.dataMArr addObjectsFromArray:aModel.result.newslist];
        }
        completionHandler(error);
        
    }];
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
    
}
- (void)getMoreDataCompletionHandler:(completionHandler)completionHandler {
    
}
- (void)refreshDataCompletionHandler:(completionHandler)completionHandler {
    
}


@end
