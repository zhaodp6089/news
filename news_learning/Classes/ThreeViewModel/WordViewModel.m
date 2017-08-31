//
//  WordViewModel.m
//  news_learning
//
//  Created by admin on 2017/8/31.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "WordViewModel.h"

@implementation WordViewModel

- (void)refreshDataCompletionHandler:(completionHandler)completionHandler {
    self.page = 1;
    [self getDataFromNetCompletionHandler:completionHandler];
}
- (void)getMoreDataCompletionHandler:(completionHandler)completionHandler {
    self.page += 1;
    [self getDataFromNetCompletionHandler:completionHandler];
}
- (void)getDataFromNetCompletionHandler:(completionHandler)completionHandler {
    [wordNetManager getWordDataWithPage:self.page completionHandler:^(id model, NSError *error) {
        
        if (!error) {
            NSArray *arr = (NSArray *)model;
            if (self.page == 1) {
                [self.dataMArr removeAllObjects];
                self.dataMArr = [arr mutableCopy];
            } else {
                [self.dataMArr addObjectsFromArray:arr];
            }
        }
        completionHandler(error);
    }];
}

- (NSString *)contentText:(NSInteger)row {
    wordModel *aModel = [self.dataMArr objectAtIndex:row];
    return aModel.text;
}

@end
