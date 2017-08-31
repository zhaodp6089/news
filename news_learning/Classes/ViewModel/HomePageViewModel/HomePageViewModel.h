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

- (instancetype)initWithType:(NewsListType)type;

@property (nonatomic, strong) NSArray *cycleImageArr;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NewsListType type;
@property (nonatomic, strong) NSString *lastTime;


- (NSString *)titleForRow:(NSInteger)row;

- (NSString *)imageUrlForRow:(NSInteger)row;

- (NSString *)dataStringForRow:(NSInteger)row;

@end
