//
//  GoPopView.m
//  Objective-c-Go
//
//  Created by le tong on 2019/6/6.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoPopView.h"

@interface GoPopView()
@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UIView *leftLineView;
@property (nonatomic, strong) UIView *rightLineView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *couponsTypeLabel;
@property (nonatomic, strong) UIButton *receiveButton;
@property (nonatomic, strong) UIButton *cancelButton;


@end
@implementation GoPopView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self layoutUIFrame];
        self.backgroundColor = [UIColor blackColor];
        self.userInteractionEnabled = YES;
        [self exmaple];
    }
    return self;
}
- (void)exmaple{
    NSInteger newCid = 102003003003;
    
    BOOL isShowPop = [[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"%ld",newCid]];
    BOOL  isCancel = YES;
    if (isShowPop) {
        NSLog(@"11");
    }else{
        NSLog(@"00");
    }
    if (isCancel) {
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:newCid] forKey:[NSString stringWithFormat:@"%ld",(long)newCid]];
    }
}
+ (instancetype)showPopViewWithCouponsModel
{
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    GoPopView *popV = [[GoPopView alloc]initWithFrame:keyWindow.bounds];
    [keyWindow addSubview:popV];
    popV.center = keyWindow.center;
    
    // 第一步：将view宽高缩至无限小（点）
    popV.transform = CGAffineTransformScale(CGAffineTransformIdentity,
                                            CGFLOAT_MIN, CGFLOAT_MIN);
    [UIView animateWithDuration:0.3
                     animations:^{
                         // 第二步： 以动画的形式将view慢慢放大至原始大小的1.2倍
                         popV.alpha = 0.7;
                         popV.backImageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.2
                                          animations:^{
                                              // 第三步： 以动画的形式将view恢复至原始大小
                                              popV.transform = CGAffineTransformIdentity;
                                          }];
                     }];
    
    return popV;
}



- (void)hidePopView
{
   
    self.cancelButton.hidden = YES;
    [UIView animateWithDuration:0.5f animations:^{
        self.backImageView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        self.alpha = 0;
        CGRect redViewRect = self.backImageView.frame;
        CGFloat xmargin = (M_WIDTH / 12) * 10;
        CGFloat ymargin = M_HEIGHT - 30.f;
        redViewRect.origin.y = ymargin;
        redViewRect.origin.x = xmargin ;
        [self.backImageView setFrame:redViewRect];
        
        
    } completion:^(BOOL finished) {
        [self.backImageView removeFromSuperview];
        [self removeFromSuperview];
    }];
}

- (void)receiveButtonAction
{
  [self hidePopView];
}

- (void)cancelButtonAction
{
    [self hidePopView];
}


#pragma mark --------layoutUIFrame
- (void)layoutUIFrame
{
    [self addSubview:self.backImageView];
    [self.backImageView addSubview:self.leftLineView];
    [self.backImageView addSubview:self.rightLineView];
    [self.backImageView addSubview:self.titleLabel];
    
    [self.backImageView addSubview:self.priceLabel];
    
    [self.backImageView addSubview:self.couponsTypeLabel];
    
    [self.backImageView addSubview:self.receiveButton];
    
    [self addSubview:self.cancelButton];
    
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(240, 280));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(37);
        make.height.mas_equalTo(16);
    }];
    
    [self.leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(36);
        make.height.mas_equalTo(1);
        make.centerY.mas_equalTo(self.titleLabel.mas_centerY);
        make.right.mas_equalTo(self.titleLabel.mas_left).offset(-10);
    }];
    
    [self.rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-36);
        make.height.mas_equalTo(1);
        make.centerY.mas_equalTo(self.titleLabel.mas_centerY);
        make.left.mas_equalTo(self.titleLabel.mas_right).offset(10);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(11);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(-10);
    }];
    
   
    [self.couponsTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(self.priceLabel.mas_bottom).offset(11);
        make.height.mas_equalTo(14);
    }];
    
    [self.receiveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-20);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(192);
    }];

    
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.backImageView.mas_bottom).offset(30);
        make.centerX.mas_equalTo(0);
        make.width.height.mas_equalTo(40);
    }];
}


#pragma mark --------lazy

- (UIImageView *)backImageView
{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc]init];
        _backImageView.contentMode = UIViewContentModeScaleAspectFit;
        _backImageView.image = [UIImage imageNamed:@"popup_coupon"];
        _backImageView.backgroundColor = [UIColor whiteColor];
        _backImageView.userInteractionEnabled = YES;
    }
    return _backImageView;
}

- (UIView *)leftLineView
{
    if (!_leftLineView) {
        _leftLineView = [[UIView alloc]init];
        _leftLineView.backgroundColor = [UIColor blackColor];
    }
    return _leftLineView;
}

- (UIView *)rightLineView
{
    if (!_rightLineView) {
        _rightLineView = [[UIView alloc]init];
        _rightLineView.backgroundColor = [UIColor blackColor];
    }
    return _rightLineView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.text = @"新人专享红包";
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.textColor = [UIColor blackColor];
        _priceLabel.text = @"30";
        _priceLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:64];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _priceLabel;
}

- (UILabel *)couponsTypeLabel
{
    if (!_couponsTypeLabel) {
        _couponsTypeLabel = [[UILabel alloc]init];
        _couponsTypeLabel.textColor = [UIColor blackColor];
        _couponsTypeLabel.text = @"全品类通用";
        _couponsTypeLabel.font = [UIFont systemFontOfSize:14];
        _couponsTypeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _couponsTypeLabel;
}

- (UIButton *)receiveButton
{
    if (!_receiveButton) {
        _receiveButton = [UIButton new];
        [_receiveButton setTitle:@"立即领取" forState:UIControlStateNormal];
        [_receiveButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_receiveButton addTarget:self action:@selector(receiveButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _receiveButton;
}
- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc]init];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(hidePopView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

@end
