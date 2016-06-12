//
//  BasicViewController.h
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/12.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicViewController : UIViewController

//  添加NavigationItem
- (void)addNavigationItemWithTitle:(NSString *)title
                      isBackButton:(BOOL)isBackButton
                           isRight:(BOOL)isRight
                            target:(id)target
                            action:(SEL)action;
//  创建界面
- (void)creatUI;

//  返回上一页
- (void)backButtonClick:(UIBarButtonItem *)barButton;


@end
