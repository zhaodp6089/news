//
//  OneViewController.m
//  news_learning
//
//  Created by admin on 2017/8/25.
//  Copyright © 2017年 com.taihe. All rights reserved.
//

#import "OneViewController.h"
#import "HomePageListViewController.h"

@interface OneViewController ()

@property (nonatomic, strong) NSArray *titleData;

@end

@implementation OneViewController

+ (UINavigationController *)defultNavi {
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        OneViewController *vc = [[OneViewController alloc] init];

        navi = [[BaseNavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}



#pragma mark 标题数组
- (NSArray *)titleData {
    if (!_titleData) {
        _titleData = @[@"最新",@"新闻",@"评测",@"导购",@"用车",@"技术",@"文化",@"改装",@"游记"];
    }
    return _titleData;
}
#pragma mark 初始化代码
- (instancetype)init {
    if (self = [super init]) {
        
        
        self.titleSizeNormal = 17;
        self.titleSizeSelected = 18;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuItemWidth = 55;
        self.automaticallyCalculatesItemWidths = YES;
        
    }
    return self;
}


#pragma mark - Datasource & Delegate

#pragma mark 返回子页面的个数
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleData.count;
}

#pragma mark 返回某个index对应的页面
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    
    HomePageListViewController   *vcClass = [[HomePageListViewController alloc] init];
    vcClass.typeValue = index;
    vcClass.title = @"1";
    vcClass.view.backgroundColor = [UIColor greenColor];
    return vcClass;
    
}

#pragma mark 返回index对应的标题
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    
    return self.titleData[index];
}
- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index {
    CGFloat width = [super menuView:menu widthForItemAtIndex:index];
    return width + 15;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"首页";
}


@end
