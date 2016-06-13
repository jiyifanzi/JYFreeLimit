//
//  SubjectViewController.m
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/12.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import "SubjectViewController.h"

@interface SubjectViewController ()

//  专题专有的TableView
@property (nonatomic, strong) UITableView * subjectTableView;

@end

@implementation SubjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)init {
    if (self = [super init]) {
        //  为限免的请求路径赋值
        self.requestURL = kSubjectUrl;
    }
    return self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 创建界面
- (void)creatUI {
    //  创建tableView
    self.subjectTableView = [[UITableView alloc] init];
    self.subjectTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.subjectTableView];
    
    //  添加约束
    __weak typeof(self) weakself = self;
    [self.subjectTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself.view);
        //make.size.equalTo(weakself.view);
    }];
    
    //  添加刷新控件
    [self addMJRefresh];
}

#pragma mark - 添加刷新控件
- (void)addMJRefresh {
    //  下拉
    // 设置文字
    
    MJRefreshGifHeader * header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDataHeader)];
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"可以了" forState:MJRefreshStatePulling];
    [header setTitle:@"我回去了" forState:MJRefreshStateRefreshing];
    
    // 设置字体
    header.stateLabel.font = [UIFont systemFontOfSize:15];
    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
    
    // 设置颜色
//    header.stateLabel.textColor = [UIColor redColor];
//    header.lastUpdatedTimeLabel.textColor = [UIColor blueColor];
    self.subjectTableView.mj_header = header;

    
    //  上拉
    MJRefreshBackGifFooter * footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadNewDataFooter)];
    [footer setTitle:@"点击开始刷新" forState:MJRefreshStateIdle];
    [footer setTitle:@"正在加载更多" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"已经没有数据" forState:MJRefreshStateNoMoreData];
    
    // 设置字体
    footer.stateLabel.font = [UIFont systemFontOfSize:17];
    
    // 设置颜色
    footer.stateLabel.textColor = [UIColor blueColor];
    
    self.subjectTableView.mj_footer = footer;
    
}



- (void)loadNewDataHeader {
    [self.subjectTableView.mj_header endRefreshing];
}
- (void)loadNewDataFooter {
    [self.subjectTableView.mj_footer endRefreshing];
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
