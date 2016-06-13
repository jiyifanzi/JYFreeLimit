//
//  AppListCell.m
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/13.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import "AppListCell.h"
#import <UIImageView+AFNetworking.h>

@interface AppListCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;


@end

@implementation AppListCell

- (void)awakeFromNib {
    // Initialization code
}

#pragma mark - 通过模型给属性赋值
- (void)setModel:(AppListModel *)model {
    _model = model;
    
    [_iconImageView setImageWithURL:[NSURL URLWithString:model.iconUrl] placeholderImage:[UIImage imageNamed:@"appproduct_appdefault"]];
    
    _nameLabel.text = model.name;
    
    _timeLabel.text = model.releaseDate;
    
    _priceLabel.text = model.lastPrice;
    
    _typeLabel.text = model.categoryName;
    
    _countLabel.text = [NSString stringWithFormat:@"分享：%@次 收藏：%@次 下载：%@次",model.shares, model.favorites, model.downloads];    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
