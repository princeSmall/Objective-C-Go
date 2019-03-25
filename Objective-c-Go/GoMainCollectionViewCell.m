//
//  GoMainCollectionViewCell.m
//  Objective-c-Go
//
//  Created by le tong on 2019/3/22.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoMainCollectionViewCell.h"
@interface GoMainCollectionViewCell()
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation GoMainCollectionViewCell


- (void)updateCurrentUI:(NSString *)title{
    self.titleLabel.text = title;
}
- (void)layoutCurrentUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = RGB(220, 220, 220).CGColor;
    self.layer.borderWidth = 0.5;
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
