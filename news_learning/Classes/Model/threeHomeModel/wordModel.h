//
//  wordModel.h
//  news_learning
//
//  Created by admin on 2017/8/31.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "BaseModel.h"

@interface wordModel : BaseModel

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *thumbnail;

@property (nonatomic, copy) NSString *height;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *created_at;

@property (nonatomic, copy) NSString *width;

@property (nonatomic, copy) NSString *original;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *screen_name;

@property (nonatomic, assign) NSInteger zan;

@property (nonatomic, assign) NSInteger reposts;

@end



@interface PicModel : BaseModel


@property (nonatomic, copy) NSString *clientcover1;

@property (nonatomic, copy) NSString *datetime;

@property (nonatomic, copy) NSString *setname;

@property (nonatomic, copy) NSString *setid;

@property (nonatomic, copy) NSString *topicname;

@property (nonatomic, copy) NSString *pvnum;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *imgsum;

@property (nonatomic, copy) NSString *clientcover;

@property (nonatomic, copy) NSString *tcover;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *scover;

@property (nonatomic, copy) NSString *seturl;

@property (nonatomic, copy) NSString *createdate;

@property (nonatomic, strong) NSArray<NSString *> *pics;

@property (nonatomic, copy) NSString *replynum;

@end

