//
//  CategoryModel.h
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/13.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryModel : NSObject<YYModel>

//  名字
@property (nonatomic, strong) NSString * categoryCname;
//  图片
@property (nonatomic, strong) NSString * picUrl;
//  总数
@property (nonatomic, strong) NSString * categoryCount;
//  限免数
@property (nonatomic, strong) NSString * limited;
//  类型id
@property (nonatomic, strong) NSString * categoryId;


@end
