//
//  GoCollectionViewCell.m
//  Objective-c-Go
//
//  Created by le tong on 2019/4/3.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoCollectionViewCell.h"
@interface GoCollectionViewCell()
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation GoCollectionViewCell

+ (CGFloat)cellWidthFromCurrentCellTitle:(NSString *)title{
    /*计算宽度时要确定高度*/
    CGRect rect = [title boundingRectWithSize:CGSizeMake(MAXFLOAT,15.f) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.f]} context:nil];
    return rect.size.width + 5.f;
}

- (void)updateCurrentUI:(NSString *)title{
    self.titleLabel.text = title;
}
- (void)layoutCurrentUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.cornerRadius = 4.f;
    self.contentView.layer.borderColor = [UIColor blackColor].CGColor;
    self.contentView.layer.borderWidth = 1.0f;
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _titleLabel;
}
@end
