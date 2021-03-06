//
//  BasicViewController.h
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/12.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicViewController : UIViewController

//  请求路径
@property (nonatomic, copy) NSString * requestURL;
//  网络请求管理者
@property (nonatomic, strong) AFHTTPSessionManager * requestManager;



//  添加NavigationItem
- (void)addNavigationItemWithTitle:(NSString *)title
                      isBackButton:(BOOL)isBackButton
                           isRight:(BOOL)isRight
                            target:(id)target
                            action:(SEL)action;
//  创建界面
- (void)creatUI;

//  返回上一页
- (void)backButtonClick;


@end
