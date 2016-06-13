//
//  JYStarView.m
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/13.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import "JYStarView.h"

@interface JYStarView()

//  背景的星星
@property (nonatomic, strong) UIImageView * starBackground;
//  显示的星星
@property (nonatomic, strong) UIImageView * starFront;

@end

@implementation JYStarView

//  通过stroyBoard或者xib去创建视图的时候，会调用这个方法
//  在这个方法中可以拿到当前视图的frame
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        //  实例化子视图
        _starBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarsBackground"]];
        
        [self addSubview:_starBackground];
        
        _starFront = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarsForeground"]];
        //  设置显示模式，是将图片的左边显示全
        _starFront.contentMode = UIViewContentModeLeft;
        //  允许切割
        _starFront.clipsToBounds = YES;
        
        [self addSubview:_starFront];
    }
    return self;
}

#pragma mark - 根据传入的星级，改变front的宽度
- (void)setStarValue:(NSString *)starValue {
    _starValue = starValue;
    //  获取原来的位置信息
    CGRect frame = _starBackground.frame;
    //  更改新的宽度
    frame.size.width = (starValue.floatValue / 5) * frame.size.width;
    //  更新starFront的frame
    _starFront.frame = frame;
}

@end
