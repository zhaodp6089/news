//
//  PicViewController.m
//  news_learning
//
//  Created by admin on 2017/9/1.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "PicViewController.h"
#import "PicTableViewCell.h"
#import "PicViewModel.h"

@interface PicViewController ()<UITabBarDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) PicViewModel *viewModel;


@end

@implementation PicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView.mj_header beginRefreshing];
    
}

#pragma mark - tableview delegate
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataMArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"HomePageViewTableViewCell -------- ");
    PicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[PicTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cellID"];
    }
    [cell.iconIV sd_setImageWithURL:[NSURL URLWithString:[self.viewModel iconURLsForRow:indexPath.row][0]] placeholderImage:nil ];
    cell.titleLB.text = [self.viewModel titleForRow:indexPath.row];
    cell.browseNum.text = [self.viewModel browseNumForRow:indexPath.row];
    return cell;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
        // 用 sdLayout 第三页不显示 - 什么鬼！ 改成frame！！！
        _tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 49);
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.viewModel refreshDataCompletionHandler:^(NSError *error) {
                if (!error) {
                    [_tableView reloadData];
                }
                [_tableView.mj_header endRefreshing];
            }];
        }];
        _tableView.mj_footer = [MJRefreshBackNormalFooter  footerWithRefreshingBlock:^{
            [self.viewModel getMoreDataCompletionHandler:^(NSError *error) {
                if (!error) {
                    [_tableView reloadData];
                }
                [_tableView.mj_footer endRefreshing];
            }];
        }];
    }
    return _tableView;
}
- (PicViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [PicViewModel new];
    }
    return _viewModel;
}
@end
