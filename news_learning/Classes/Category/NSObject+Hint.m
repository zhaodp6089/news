//
//  NSObject+Hint.m
//  PartyWork
//
//  Created by admin on 2017/8/27.
//  Copyright © 2017年 ech. All rights reserved.
//

#import "NSObject+Hint.h"

#define kToastDuration 1

@implementation NSObject (Hint)

- (void)showLoad {
    [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
}
- (void)hideLoad {
    [MBProgressHUD hideAllHUDsForView:[self currentView] animated:YES];
}

- (void)showSuccessWithMsg:(NSObject *)msg {
    [self hideLoad];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeText;
    progressHUD.labelText = msg.description;
    [progressHUD hide:YES afterDelay:kToastDuration];
}
- (void)showErrorWithMsg:(NSObject *)msg {
    [self hideLoad];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeText;
    progressHUD.labelText = msg.description;
    [progressHUD hide:YES afterDelay:kToastDuration];
}

- (UIView *)currentView{
    UIViewController *controller = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    if ([controller isKindOfClass:[UITabBarController class]]) {
        controller = [(UITabBarController *)controller selectedViewController];
    }
    if([controller isKindOfClass:[UINavigationController class]]) {
        controller = [(UINavigationController *)controller visibleViewController];
    }
    if (!controller) {
        return [UIApplication sharedApplication].keyWindow;
    }
    return controller.view;
}

- (void)showSystemAlertWithMsg:(NSObject *)msg {
    
}

@end

