//
//  PicTableViewCell.m
//  news_learning
//
//  Created by admin on 2017/9/1.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "PicTableViewCell.h"

@implementation PicTableViewCell


- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(2);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(200);
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = kTitleFont;
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.width.mas_equalTo(kWindowW/3*2);
            make.top.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(15);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _titleLB;
}

- (UILabel *)browseNum {
    if(_browseNum == nil) {
        _browseNum = [[UILabel alloc] init];
        _browseNum.textColor = [UIColor lightGrayColor];
        _browseNum.textAlignment = NSTextAlignmentRight;
        _browseNum.font = kSubtitleFont;
        [self.contentView addSubview:_browseNum];
        [_browseNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.titleLB);
            make.right.mas_equalTo(-10);
            make.width.mas_equalTo(65);
        }];
    }
    return _browseNum;
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
