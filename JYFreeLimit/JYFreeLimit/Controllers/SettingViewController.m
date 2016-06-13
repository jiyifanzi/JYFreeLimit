//
//  SettingViewController.m
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/12.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()<UIGestureRecognizerDelegate>

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建界面
- (void)creatUI {
    self.title = @"设置";
    
    //  添加自定义的返回按钮
    [self addNavigationItemWithTitle:@"返回" isBackButton:YES isRight:NO target:self action:@selector(backButtonClick)];
    //  设置手势代理(自带的滑动返回手势)
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
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
