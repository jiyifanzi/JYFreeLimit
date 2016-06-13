//
//  CategoryViewController.h
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/12.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import "BasicViewController.h"

@interface CategoryViewController : BasicViewController

//  使用block反向传值：在下一界面声明和调用block，在上一级界面实现block
@property (nonatomic, copy) void(^sendValue)(NSString * cateId);

@end
