//
//  HomePageViewModel.h
//  news_learning
//
//  Created by admin on 2017/8/30.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "BaseViewModel.h"
#import "HomePageNetManager.h"


@interface HomePageViewModel : BaseViewModel


@property (nonatomic, strong) NSArray *cycleImageArr;
@property (nonatomic, assign) NSInteger page;

- (void)homePageLoadDataWith:(NewsListType)type Page:(NSInteger)page LastTime:(NSString *)lastTime completionHandler:(void(^)(NSError *error))completionHandler;

- (NSString *)titleForRow:(NSInteger)row;

- (NSString *)imageUrlForRow:(NSInteger)row;

- (NSString *)dataStringForRow:(NSInteger)row;

@end
