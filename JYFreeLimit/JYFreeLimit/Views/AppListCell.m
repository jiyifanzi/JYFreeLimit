//
//  AppListCell.m
//  JYFreeLimit
//
//  Created by qianfeng on 16/6/13.
//  Copyright (c) 2016年 JiYi. All rights reserved.
//

#import "AppListCell.h"
#import <UIImageView+AFNetworking.h>
#import "JYStarView.h"

@interface AppListCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property (weak, nonatomic) IBOutlet JYStarView *starLevel;

@end

@implementation AppListCell

//  通过xib的方式，创建cell，当界面将要显示出来的时候，会自动调用这个方法
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //  切圆角
    _iconImageView.clipsToBounds = YES;
    _iconImageView.layer.cornerRadius = 10;
    
    //  使用自己的字体来设置nameLabel
    //  参数1：字体名字
    //  参数2：字体大小
    _nameLabel.font = [UIFont fontWithName:@"HYZhuanShuF" size:15.0];
    
    NSLog(@"%@",[UIFont familyNames]);
    
}

#pragma mark - 通过模型给属性赋值
- (void)setModel:(AppListModel *)model {
    _model = model;
    //  图片
    [_iconImageView setImageWithURL:[NSURL URLWithString:model.iconUrl] placeholderImage:[UIImage imageNamed:@"appproduct_appdefault"]];
    //  名字
    _nameLabel.text = model.name;
    //  时间
    _timeLabel.text = model.releaseDate;
    //  价格
//    _priceLabel.text = [NSString stringWithFormat:@"￥%@",model.lastPrice];
    
    //  富文本，添加删除线 NSStrikethroughStyleAttributeName 
    //  参数1：一般的字符串
    //  参数2：属性
    NSAttributedString * stringPrice = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"￥%@",model.lastPrice] attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle|NSUnderlinePatternSolid), NSStrikethroughColorAttributeName:[UIColor redColor]}];
    //  在label上显示富文本 attributedText
    _priceLabel.attributedText = stringPrice;
    
    //  类型
    _typeLabel.text = model.categoryName;
    //  星级
    _starLevel.starValue = model.starCurrent;
    //  次数
    _countLabel.text = [NSString stringWithFormat:@"分享：%@次 收藏：%@次 下载：%@次",model.shares, model.favorites, model.downloads];    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
