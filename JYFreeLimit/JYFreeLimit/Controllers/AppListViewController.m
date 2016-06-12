//
//  AppListViewController.m
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/12.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import "AppListViewController.h"
#import "SettingViewController.h"
#import "CategoryViewController.h"


@interface AppListViewController ()<UISearchBarDelegate>

//  整体展示数据的表格视图
@property (nonatomic, strong) UITableView * appTableView;

@end

@implementation AppListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建界面 - 添加navigationItem
- (void)creatUI {
    //  1.设置navigationBarItem
    //  分类
    [self addNavigationItemWithTitle:@"分类" isBackButton:NO isRight:NO target:self action:@selector(categoryButton:)];
    
    //  设置
    [self addNavigationItemWithTitle:@"设置" isBackButton:NO isRight:YES target:self action:@selector(settingButton:)];
    
    //  2.创建tableView
    self.appTableView = [[UITableView alloc] init];
    self.appTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.appTableView];

    //  添加约束
    __weak typeof(self) weakself = self;
    [self.appTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        //  同时添加上下左右的边距
        //make.edges.mas_equalTo(weakself.view);
        make.edges.equalTo(weakself.view);
    }];
    
    //  3.添加搜索框
    UISearchBar * searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 0, 40)];
    searchBar.showsCancelButton = YES;
    searchBar.placeholder = @"百万应用等你来搜";
    searchBar.delegate = self;
    self.appTableView.tableHeaderView = searchBar;
    
    //  4.添加下拉刷新，上拉加载界面
    [self addMJRefresh];
    
}

#pragma mark - 添加刷新控件
- (void)addMJRefresh {
    //  下拉
    self.appTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [self.appTableView.mj_header endRefreshing];
    }];
    
    
    //  上拉
    self.appTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [self.appTableView.mj_footer endRefreshing];
    }];
}


#pragma mark - 搜索框的协议
//  点击取消按钮的点击事件
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    //  让键盘收回
    [searchBar resignFirstResponder];
    //  清空文字
    searchBar.text = nil;
}

//  点击搜索按钮的点击事件
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    //  让键盘收回
    [searchBar resignFirstResponder];
}

#pragma mark - 分类按钮的点击事件
- (void)categoryButton:(UIBarButtonItem *)barButton {
    CategoryViewController * category = [[CategoryViewController alloc] init];
    category.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:category animated:YES];
}

#pragma mark - 设置按钮的点击事件
- (void)settingButton:(UIBarButtonItem *)barButton {
    SettingViewController * setting = [[SettingViewController alloc] init];
    setting.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setting animated:YES];
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
