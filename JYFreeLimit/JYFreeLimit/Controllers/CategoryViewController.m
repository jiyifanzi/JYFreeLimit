//
//  CategoryViewController.m
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/12.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import "CategoryViewController.h"
#import <UIImageView+AFNetworking.h>

@interface CategoryViewController ()<UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate>

//  分类自己的tableView
@property (nonatomic, strong) UITableView * categoryTableView;

//  数据源
@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation CategoryViewController

#pragma mark - 懒加载
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestData];
}

#pragma mark - 网络请求
- (void)requestData{
    [self.requestManager GET:kCateUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        //  将字典数组转换成模型数组
        NSArray * modelArray = [NSArray yy_modelArrayWithClass:[CategoryModel class] json:responseObject];
        [self.dataSource addObjectsFromArray:modelArray];
        
        [self.categoryTableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"请求失败%@",error);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建界面
- (void)creatUI {
    self.title = @"分类";
    
    //  添加自定义的返回按钮
    [self addNavigationItemWithTitle:@"返回" isBackButton:YES isRight:NO target:self action:@selector(backButtonClick)];
    //  设置手势代理(自带的滑动返回手势)
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    //  创建tableView
    self.categoryTableView = [[UITableView alloc] init];
    self.categoryTableView.translatesAutoresizingMaskIntoConstraints = NO;
    //  设置代理
    self.categoryTableView.delegate = self;
    self.categoryTableView.dataSource = self;
    //  设置行高
    self.categoryTableView.rowHeight = 100;
    [self.view addSubview:self.categoryTableView];
    [self.categoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self addMJRefresh];
}

#pragma mark - UITableView的协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cateCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cateCell"];
    }
    //  获取数组中的model
    CategoryModel * model = self.dataSource[indexPath.row];
    //  为cell的属性赋值 刷新数组
    cell.textLabel.text = model.categoryCname;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"共%@款应用，其中限免%@款",model.categoryCount, model.limited];
    [cell.imageView setImageWithURL:[NSURL URLWithString:model.picUrl] placeholderImage:[UIImage imageNamed:@"appproduct_appdefault"]];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //  返回
    return cell;
}
//  点击cell时的处理事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //  获取数组中的model
    CategoryModel * model = self.dataSource[indexPath.row];
    
    self.sendValue(model.categoryId);
    
    //  返回上一个界面
    [self backButtonClick];
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
