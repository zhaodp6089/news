//
//  HomePageModel.m
//  news_learning
//
//  Created by admin on 2017/8/28.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "HomePageModel.h"


@implementation HomeResultModel
/** 属性为数组 对应相应的解析类 */
+ (NSDictionary *)objectClassInArray{
    return @{@"newslist" : [HomeResultNewslistModel class], @"focusimg" : [HomeResultFocusimgModel class]};
}
@end



@implementation HomeResultHeadlineinfoModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}
@end


@implementation HomeResultTopnewsinfoModel

@end



@implementation HomeResultFocusimgModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID":@"id", @"anewstype":@"newstype"};
}
@end



@implementation HomeResultNewslistModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}
@end



