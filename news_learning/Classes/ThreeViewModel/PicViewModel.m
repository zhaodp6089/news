//
//  PicViewModel.m
//  news_learning
//
//  Created by admin on 2017/9/1.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "PicViewModel.h"
#import "wordNetManager.h"

@implementation PicViewModel

- (void)getMoreDataCompletionHandler:(completionHandler)completionHandler {
    PicModel *aModel = self.dataMArr.lastObject;
    self.setID = aModel.setid.integerValue;
    [self getDataFromNetCompletionHandler:completionHandler];
}
- (void)refreshDataCompletionHandler:(completionHandler)completionHandler {
    self.setID = 82259;
    [self getDataFromNetCompletionHandler:completionHandler];
}
- (void)getDataFromNetCompletionHandler:(completionHandler)completionHandler {
    [wordNetManager getPicDataWithSetID:self.setID completionHandler:^(id model, NSError *error) {
        if (!error) {
            NSArray <PicModel *>*arr = (NSArray *)model;
            if (self.setID == 82259) {
                [self.dataMArr removeAllObjects];
                self.dataMArr = [arr mutableCopy];
            } else {
                [self.dataMArr addObjectsFromArray:arr];
            }
        }
        completionHandler(error);
    }];
}

- (PicModel *)modelForRow:(NSInteger)row {
    return self.dataMArr[row];
}

- (NSString *)titleForRow:(NSInteger)row {
    return [self modelForRow:row].setname;
}
- (NSString *)browseNumForRow:(NSInteger)row {
    return [NSString stringWithFormat:@"%@浏览", [self modelForRow:row].replynum];
}
- (NSArray *)iconURLsForRow:(NSInteger)row {
    return [self modelForRow:row].pics;
}

@end
