//
//  WordViewModel.h
//  news_learning
//
//  Created by admin on 2017/8/31.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "BaseViewModel.h"
#import "wordNetManager.h"

@interface WordViewModel : BaseViewModel

@property (nonatomic, assign) NSInteger page;

- (NSString *)contentText:(NSInteger)row;

@end
