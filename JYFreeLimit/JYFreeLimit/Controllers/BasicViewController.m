//
//  BasicViewController.m
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/12.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  设置默认的背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatUI];
}

#pragma mark - 懒加载
//  实例化网络请求管理者
- (AFHTTPSessionManager *)requestManager {
    if (!_requestManager) {
        _requestManager = [AFHTTPSessionManager manager];
        //self.requestManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"charset=UTF-8", nil];
        //  更改json解析器的解析支持文件格式
        _requestManager.responseSerializer = [AFJSONResponseSerializer serializer];
        _requestManager.responseSerializer.acceptableContentTypes = [_requestManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    }
    return _requestManager;
}


#pragma mark - 创建界面
- (void)creatUI {
    
}

#pragma mark - 返回按钮的点击事件
- (void)backButtonClick:(UIBarButtonItem *)barButton {
    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark - 添加NavigationItem - 按钮
- (void)addNavigationItemWithTitle:(NSString *)title isBackButton:(BOOL)isBackButton isRight:(BOOL)isRight target:(id)target action:(SEL)action{
    
    //  使用自定制的按钮取去创建UIBarButtonItem
    UIButton * button = [[UIButton alloc] init];
    
    //  根据是否是返回按钮设置不同的frame和背景图片
    if (isBackButton) {
        button.frame = CGRectMake(0, 0, 44, 30);
        [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_back"] forState:UIControlStateNormal];
    
    }else {
        button.frame = CGRectMake(0, 0, 44, 30);
        [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    }
    
    //  设置文字
    [button setTitle:title forState:UIControlStateNormal];
    
    //  设置文字颜色
    //[button setTitleColor:[UIColor colorWithRed:61/255.0 green:40/255.0 blue:60/255.0 alpha:1.0] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithR:61 G:40 B:60] forState:UIControlStateNormal];
    
    //  设置字体大小
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    
    //  添加button的按钮点击事件
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    //  创建BarButtonItem
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    //  根据是否是右按钮来设置左右
    if (isRight) {
        self.navigationItem.rightBarButtonItem = barButtonItem;
    }else {
        self.navigationItem.leftBarButtonItem = barButtonItem;
    }
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
