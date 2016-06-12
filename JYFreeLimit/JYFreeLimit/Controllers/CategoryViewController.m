//
//  CategoryViewController.m
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/12.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import "CategoryViewController.h"

@interface CategoryViewController ()<UIGestureRecognizerDelegate>

//  分类自己的tableView
@property (nonatomic, strong) UITableView * categoryTableView;

@end

@implementation CategoryViewController

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
    self.title = @"分类";
    
    //  添加自定义的返回按钮
    [self addNavigationItemWithTitle:@"返回" isBackButton:YES isRight:NO target:self action:@selector(backButtonClick:)];
    //  设置手势代理(自带的滑动返回手势)
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    //  创建tableView
    self.categoryTableView = [[UITableView alloc] init];
    self.categoryTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.categoryTableView];
    [self.categoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self addMJRefresh];
    
}
#pragma mark - 添加刷新控件
- (void)addMJRefresh {
    //  下拉
    self.categoryTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [self.categoryTableView.mj_header endRefreshing];
    }];
    
    //  上拉
    self.categoryTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [self.categoryTableView.mj_footer endRefreshing];
    }];
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
