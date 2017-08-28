//
//  HomePageNetManager.h
//  news_learning
//
//  Created by admin on 2017/8/28.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "BaseNetManager.h"

typedef NS_ENUM(NSUInteger, NewsListType) {
    NewsListTypeZuiXin,  //最新
    NewsListTypeXinWen,     //新闻
    NewsListTypePingCe,     //评测
    NewsListTypeDaoGou,     //导购
    NewsListTypeYongChe,    //用车
    NewsListTypeJiShu,      //技术
    NewsListTypeWenHua,     //文化
    NewsListTypeGaiZhuang,  //改装
    NewsListTypeYouJi,      //游记
};

@interface HomePageNetManager : BaseNetManager

+ (id)getNewsListType:(NewsListType)type lastTime:(NSString *)lastTime page:(NSInteger)page kCompletionHandler;

@end
