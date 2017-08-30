//
//  HomePageViewTableViewCell.m
//  news_learning
//
//  Created by admin on 2017/8/30.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "HomePageViewTableViewCell.h"

@implementation HomePageViewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"HomePageViewTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    return self;
}





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
