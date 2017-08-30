//
//  BaseViewModel.h
//  news_learning
//
//  Created by admin on 2017/8/30.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^completionHandler)(NSError *error);

@protocol BaseViewModelDelegate <NSObject>

@optional
/** 获取数据 */
- (void)getDataFromNetCompletionHandler:(completionHandler)completionHandler;
/** 刷新 */
- (void)refreshDataCompletionHandler:(completionHandler)completionHandler;
/** 获取更多 */
- (void)getMoreDataCompletionHandler:(completionHandler)completionHandler;

@end


@interface BaseViewModel : NSObject<BaseViewModelDelegate>

@property (strong, nonatomic) NSMutableArray *dataMArr;
@property (strong, nonatomic) NSURLSessionDataTask *dataTask;

/** 取消任务 */
- (void)cacelTask;
/** 暂停任务 */
- (void)suspendTask;
/** 继续任务 */
- (void)resumeTask;

@end
