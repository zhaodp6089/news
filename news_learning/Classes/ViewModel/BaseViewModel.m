//
//  BaseViewModel.m
//  news_learning
//
//  Created by admin on 2017/8/30.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

- (void)cacelTask {
    [self.dataTask cancel];
}
- (void)suspendTask {
    [self.dataTask suspend];
}
- (void)resumeTask {
    [self.dataTask resume];
}
- (NSMutableArray *)dataMArr {
    if (!_dataMArr) {
        _dataMArr = [NSMutableArray new];
    }
    return _dataMArr;
}

@end
