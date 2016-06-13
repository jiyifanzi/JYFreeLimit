//
//  HotViewController.m
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/12.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import "HotViewController.h"

@interface HotViewController ()

@end

@implementation HotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)init {
    if (self = [super init]) {
        //  为限免的请求路径赋值
        self.requestURL = kHotUrl;
    }
    return self;
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
