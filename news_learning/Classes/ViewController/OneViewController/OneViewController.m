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

+ (NSArray *)itemNames {
    return @[@"最新",@"新闻",@"评测",@"导购",@"用车",@"技术",@"文化",@"改装",@"游记",];
}

#pragma mark 标题数组
- (NSArray *)titleData {
    if (!_titleData) {
        _titleData = @[@"最新",@"新闻新闻新闻",@"评测",@"导购",@"用车",@"技术",@"文化",@"改装",@"游记"];
    }
    return _titleData;
}
#pragma mark 初始化代码
- (instancetype)init {
    if (self = [super init]) {
        
        
        self.titleSizeNormal = 16;
        self.titleSizeSelected = 18;
        self.menuViewStyle = WMMenuViewStyleFloodHollow;
        self.menuItemWidth = 55;
        self.automaticallyCalculatesItemWidths = YES;
        
    }
    return self;
}


#pragma mark - Datasource & Delegate

#pragma mark 返回子页面的个数
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleData.count;
}

#pragma mark 返回某个index对应的页面
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    
    switch (index) {
        case 0:{
            
            HomePageListViewController   *vcClass = [[HomePageListViewController alloc] init];
            vcClass.title = @"1";
            vcClass.view.backgroundColor = [UIColor greenColor];
            
            return vcClass;
        }
            
            break;
        case 1:{
            
            HomePageListViewController *vcClass = [HomePageListViewController new];
            vcClass.title = @"2";
            vcClass.view.backgroundColor = [UIColor grayColor];
            return vcClass;
            
        }
            break;
        case 2:{
            
            HomePageListViewController *vcClass = [HomePageListViewController new];
            vcClass.title = @"3";
            return vcClass;
            
        }
            break;
            
        default:{
            
            HomePageListViewController *vcClass = [HomePageListViewController new];
            vcClass.title = @"4";
            return vcClass;
            
        }
            
            break;
    }
    
    
}

#pragma mark 返回index对应的标题
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    
    return self.titleData[index];
}




+ (NSArray *)viewControllerClasses {
    NSMutableArray *mArr = [NSMutableArray new];
    for (int i = 0; i < [self itemNames].count; i++) {
        [mArr addObject:[OneViewController class]];
    }
    return [mArr copy];
}

+ (NSArray *)vcKeys {
    NSMutableArray *mArr = [NSMutableArray new];
    for (int i = 0; i < [self itemNames].count; i++) {
        [mArr addObject:@"infoType"];
    }
    return [mArr copy];
}

+ (NSArray *)vcValues {
    NSMutableArray *mArr = [NSMutableArray new];
    for (int i = 0; i < [self itemNames].count; i++) {
        [mArr addObject:@(i)];
    }
    return [mArr copy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"one";
    self.view.backgroundColor = [UIColor orangeColor];
    
    
}


@end
