//
//  GoControlViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/4/8.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoControlViewController.h"

@interface GoControlViewController ()
@property (nonatomic, strong) UIButton *goButton;
@property (nonatomic, strong) UIButton *goArrowButton;
@property (nonatomic, strong) UILabel *goLabel;
@property (nonatomic, strong) UITextField *goTextField;
@end

@implementation GoControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.goTextField];
    [self.view addSubview:self.goButton];
    [self.view addSubview:self.goLabel];
    [self.view addSubview:self.goArrowButton];
    [self.goButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    [self.goArrowButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.goButton.mas_bottom).offset(100);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    // Do any additional setup after loading the view.
}
- (void)selectedGoButton{
    self.goButton.selected = !self.goButton.selected;
}
- (void)selectdGoArrowButton{
    self.goArrowButton.selected = !self.goArrowButton.selected;
}
- (UIButton *)goButton{
    if (!_goButton) {
        _goButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        label所有的sttributes都能设置
        NSAttributedString *titleNormalString = [[NSAttributedString alloc]initWithString:@"正选" attributes:@{
                                                                                                       NSFontAttributeName:[UIFont systemFontOfSize:16.f],
                                                                                                       NSForegroundColorAttributeName:[UIColor redColor],
                                                                                                       NSBackgroundColorAttributeName:[UIColor blackColor],
                                                                                                       }];
        NSAttributedString *titleSelectedString = [[NSAttributedString alloc]initWithString:@"反选" attributes:@{
                                                                                                             NSFontAttributeName:[UIFont systemFontOfSize:20.f],
                                                                                                             NSForegroundColorAttributeName:[UIColor greenColor],
                                                                                                             NSBackgroundColorAttributeName:[UIColor grayColor],
                                                                                                             NSUnderlineStyleAttributeName:@1,
                                                                                                             }];
        [_goButton setAttributedTitle:titleNormalString forState:UIControlStateNormal];
        [_goButton setAttributedTitle:titleSelectedString forState:UIControlStateSelected];
        [_goButton addTarget:self action:@selector(selectedGoButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goButton;
}
- (UIButton *)goArrowButton{
    if (!_goArrowButton) {
        _goArrowButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _goArrowButton.titleLabel.font = [UIFont systemFontOfSize:12.f];
        [_goArrowButton setTitle:@"展开" forState:UIControlStateNormal];
        [_goArrowButton setTitle:@"收起" forState:UIControlStateSelected];
        [_goArrowButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_goArrowButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [_goArrowButton setImage:[UIImage imageNamed:@"icon_arrowBottom"] forState:UIControlStateNormal];
        [_goArrowButton setImage:[UIImage imageNamed:@"icon_arrowTop"] forState:UIControlStateSelected];
        /**
         1、正常情况是图片左，文字右，并且距离很近
         2、修改Image距离title的距离，也可以修改title距离image的距离
         3、也可以修改成上下排列
         **/
        [_goArrowButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
        [_goArrowButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        [_goArrowButton addTarget:self action:@selector(selectdGoArrowButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goArrowButton;
}
- (UILabel *)goLabel{
    if (!_goLabel) {
        _goLabel = [UILabel new];
    }
    return _goLabel;
}
- (UITextField *)goTextField{
    if (!_goTextField) {
        _goTextField = [UITextField new];
    }
    return _goTextField;
}

@end
