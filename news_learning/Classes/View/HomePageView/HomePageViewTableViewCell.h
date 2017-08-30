//
//  HomePageViewTableViewCell.h
//  news_learning
//
//  Created by admin on 2017/8/30.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageViewTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UILabel *review;


@end
