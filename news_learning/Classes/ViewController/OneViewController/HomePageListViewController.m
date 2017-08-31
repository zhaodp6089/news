//
//  HomePageListViewController.m
//  news_learning
//
//  Created by admin on 2017/8/25.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "HomePageListViewController.h"
#import "HomePageViewModel.h"
#import "HomePageViewTableViewCell.h"

static NSString *cellID = @"cell";

@interface HomePageListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) HomePageViewModel *viewModel;

@end

@implementation HomePageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView.mj_header beginRefreshing];
    
}

#pragma mark - tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%ld", self.viewModel.dataMArr.count);
    return self.viewModel.dataMArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"HomePageViewTableViewCell -------- ");
    HomePageViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[HomePageViewTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    cell.title.text = [self.viewModel titleForRow:indexPath.row];
    [cell.headImageView sd_setImageWithURL:[NSURL URLWithString:[self.viewModel imageUrlForRow:indexPath.row]] placeholderImage:nil ];
    cell.timeLable.text = [self.viewModel dataStringForRow:indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 99;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[HomePageViewTableViewCell class] forCellReuseIdentifier:cellID];
        [self.view addSubview:_tableView];
        // 用 sdLayout 第三页不显示 - 什么鬼！
        _tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 49 -  30);
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.viewModel refreshDataCompletionHandler:^(NSError *error) {
                if (!error) {
                    //_tableView.tableHeaderView = [self configHeadView];
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
- (HomePageViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[HomePageViewModel alloc] initWithType:self.typeValue];
    }
    return _viewModel;
}


@end
