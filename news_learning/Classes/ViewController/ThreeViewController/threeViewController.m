//
//  threeViewController.m
//  news_learning
//
//  Created by admin on 2017/8/25.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "threeViewController.h"
#import "WordViewController.h"
#import "PicViewController.h"

@interface threeViewController ()

@property (nonatomic , strong) NSArray *titleData;

@end

@implementation threeViewController

+ (UINavigationController *)defultNavi {
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        threeViewController *rootvc = [[threeViewController alloc] init];
        navi = [[BaseNavigationController alloc] initWithRootViewController:rootvc];
    });
    return navi;
}

- (instancetype)init {
    if (self = [super init]) {
        
        self.titleSizeNormal = 17;
        self.titleSizeSelected = 18;
        self.menuViewStyle = WMMenuViewStyleFloodHollow;
        self.menuItemWidth = 55;
        self.automaticallyCalculatesItemWidths = YES;
        self.showOnNavigationBar = YES;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
#pragma mark 标题数组
- (NSArray *)titleData {
    if (!_titleData) {
        _titleData = @[@"段子",@"图片",@"视频"];
    }
    return _titleData;
}
#pragma mark - Datasource & Delegate

#pragma mark 返回子页面的个数
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleData.count;
}

#pragma mark 返回某个index对应的页面
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    switch (index) {
            case 0:
        {
            WordViewController *vcClass = [[WordViewController alloc] init];
            return vcClass;
        }
            break;
            
            case 1:
        {
            PicViewController *vcClass = [[PicViewController alloc] init];
            return vcClass;
        }
            break;
            
        default:
        {
            WordViewController *vcClass = [[WordViewController alloc] init];
            return vcClass;
        }
            break;
    }
    
}

#pragma mark 返回index对应的标题
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    
    return self.titleData[index];
}
- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index {
    CGFloat width = [super menuView:menu widthForItemAtIndex:index];
    return width + 15;
}



@end
