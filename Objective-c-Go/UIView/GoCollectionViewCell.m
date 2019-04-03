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
- (void)updateCurrentUI:(NSString *)title{
    self.titleLabel.text = title;
}
- (void)layoutCurrentUI{
    self.contentView.backgroundColor = [UIColor redColor];
    self.layer.cornerRadius = 4.f;
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 5, 0, 5));
    }];
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.numberOfLines = 0;
        _titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _titleLabel;
}
@end
