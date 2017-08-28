//
//  twoViewController.m
//  news_learning
//
//  Created by admin on 2017/8/25.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "twoViewController.h"

@interface twoViewController ()

@end

@implementation twoViewController

+ (UINavigationController *)defultNavi {
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        navi = [[BaseNavigationController alloc] initWithRootViewController:[[self class] new]];
    });
    return navi;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
