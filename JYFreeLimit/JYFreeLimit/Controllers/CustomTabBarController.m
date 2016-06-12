//
//  CustomTabBarController.m
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/12.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import "CustomTabBarController.h"

#import "HotViewController.h"
#import "SubjectViewController.h"
#import "FreeViewController.h"
#import "ReductionViewController.h"
#import "LimitViewController.h"

#import "CustomNavigationController.h"

@interface CustomTabBarController ()

@end

@implementation CustomTabBarController


#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatControllers];
    
    [self creatUI];
    
    
}

#pragma mark - 创建界面
- (void)creatUI {
    
    //  设置tabBar的背景
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
    
    //  设置navigationBar的文字颜色
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:60/255.0 green:130/255.0 blue:200/255.0 alpha:1.0]}];
    
    //  设置tabBar上面的文字选中颜色
    //[self.tabBar setTintColor:[UIColor colorWithRed:60/255.0 green:130/255.0 blue:200/255.0 alpha:1.0]];
    [self.tabBar setTintColor:[UIColor whiteColor]];
    
}

#pragma mark - 创建视图控制器
- (void)creatControllers {
    //  1.拿到plist文件
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"Controllers.plist" ofType:nil];
    
    //  2.根据plist获取数组
    NSArray * plistArray = [NSArray arrayWithContentsOfFile:filePath];
    
    //  3.遍历数组(通过枚举的方式遍历数组)
    [plistArray enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL *stop) {

        NSString * className = obj[@"className"];
        NSString * imageName = obj[@"imageName"];
        NSString * title = obj[@"title"];
        //  将类名转换成类(runTime的方法 NSClassFromString)
        Class classTemp =  NSClassFromString(className);
        //  创建视图控制器
        UIViewController * controller = [[classTemp alloc] init];
        //  设置tabBarItem的相关属性
        controller.title = title;
        controller.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        controller.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_press",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        CustomNavigationController * navTemp = [[CustomNavigationController alloc] initWithRootViewController:controller];
        
        //  添加到tabBarController中
        [self addChildViewController:navTemp];
    }];
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
