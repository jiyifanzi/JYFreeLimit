//
//  AppListViewController.h
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/12.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import "BasicViewController.h"

@interface AppListViewController : BasicViewController

- (void)requestDataWithPage:(NSInteger)page
                     search:(NSString *)search
                     cateId:(NSString *)cateId;

@end
