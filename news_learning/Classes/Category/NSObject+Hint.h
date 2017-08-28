//
//  NSObject+Hint.h
//  PartyWork
//
//  Created by admin on 2017/8/27.
//  Copyright © 2017年 ech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Hint)

/** 显示加载 */
- (void)showLoad;
/** 加载完毕 */
- (void)hideLoad;

/** 显示成功（及提示文字） */
- (void)showSuccessWithMsg:(NSObject *)msg;
/** 显示错误（及提示文字） */
- (void)showErrorWithMsg:(NSObject *)msg;

/** 显示系统alert（及提示文字） */
- (void)showSystemAlertWithMsg:(NSObject *)msg;

@end
