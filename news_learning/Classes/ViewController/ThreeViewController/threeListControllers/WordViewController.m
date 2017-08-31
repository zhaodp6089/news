//
//  WordViewController.m
//  news_learning
//
//  Created by admin on 2017/8/31.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "WordViewController.h"
#import "WordTableViewCell.h"
#import "WordViewModel.h"

@interface WordViewController ()<UITabBarDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) WordViewModel *viewModel;

@end

@implementation WordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    WordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[WordTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cellID"];
    }
    cell.contentLB.text = [self.viewModel contentText:indexPath.row];
    [cell.zanBtn bk_addEventHandler:^(id sender) {
        
    } forControlEvents:(UIControlEventTouchUpInside)];
    cell.dateLB.text = @"没有加文字！";
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
                    [_tableView.mj_header endRefreshing];
                    [_tableView reloadData];
                }
            }];
        }];
        _tableView.mj_footer = [MJRefreshBackNormalFooter  footerWithRefreshingBlock:^{
            [self.viewModel getMoreDataCompletionHandler:^(NSError *error) {
                if (!error) {
                    [_tableView.mj_footer endRefreshing];
                    [_tableView reloadData];
                }
            }];
        }];
    }
    return _tableView;
}
- (WordViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[WordViewModel alloc] init];
    }
    return _viewModel;
}

@end
