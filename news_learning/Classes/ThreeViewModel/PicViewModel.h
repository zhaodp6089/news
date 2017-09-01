//
//  PicViewModel.h
//  news_learning
//
//  Created by admin on 2017/9/1.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "BaseViewModel.h"

@interface PicViewModel : BaseViewModel

@property (nonatomic, assign) NSInteger setID;

- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)browseNumForRow:(NSInteger)row;
- (NSArray *)iconURLsForRow:(NSInteger)row;

@end
