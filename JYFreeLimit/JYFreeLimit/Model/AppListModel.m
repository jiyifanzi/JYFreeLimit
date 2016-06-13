//
//  AppListModel.m
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/13.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import "AppListModel.h"

@implementation AppListModel

+(NSDictionary *)modelCustomPropertyMapper {
    //  让属性my_description和字典里面的键description对应(字典中出现关键字的情况)
    return @{@"my_description":@"description"};
}

- (NSString *)description {
    return _my_description;
}

@end
