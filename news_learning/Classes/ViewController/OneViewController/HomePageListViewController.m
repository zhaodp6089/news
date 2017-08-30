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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataMArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomePageViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[HomePageViewTableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"cell"];
    }
    cell.title.text = [self.viewModel titleForRow:indexPath.row];
    [cell.headImageView sd_setImageWithURL:[NSURL URLWithString:[self.viewModel imageUrlForRow:indexPath.row]] placeholderImage:nil ];
    cell.timeLable.text = [self.viewModel dataStringForRow:indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 99;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        _tableView.sd_resetNewLayout.topEqualToView(self.view).bottomEqualToView(self.view).leftEqualToView(self.view).rightEqualToView(self.view);
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            
            [self.tableView.mj_footer endRefreshing];
            
        }];
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            [self.viewModel homePageLoadDataWith:(NewsListTypeZuiXin) Page:1 LastTime:@"0" completionHandler:^(NSError *error) {
                if (!error) {
                    [self.tableView.mj_header endRefreshing];
                    [self.tableView reloadData];
                }
            }];
            
        }];
    }
    return _tableView;
}
- (HomePageViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[HomePageViewModel alloc] init];
    }
    return _viewModel;
}


@end
