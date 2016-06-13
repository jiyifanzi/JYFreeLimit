//
//  AppListModel.h
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/13.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@interface AppListModel : NSObject <YYModel>

//  头像
@property (nonatomic, strong) NSString * iconUrl;
//  名字
@property (nonatomic, strong) NSString * name;
//  时间
@property (nonatomic, strong) NSString * releaseDate;
//  价格
@property (nonatomic, strong) NSString * lastPrice;
//  星级
@property (nonatomic, strong) NSString * starCurrent;
//  类型
@property (nonatomic, strong) NSString * categoryName;
//  分享
@property (nonatomic, strong) NSString * shares;
//  收藏
@property (nonatomic, strong) NSString * favorites;
//  下载
@property (nonatomic, strong) NSString * downloads;
//  描述
@property (nonatomic, strong) NSString * my_description;


@end
