//
//  GoTabbarChildSetViewController.m
//  
//
//  Created by le tong on 2019/3/27.
//

#import "GoTabbarChildSetViewController.h"

@interface GoTabbarChildSetViewController ()
@property (strong, nonatomic) UIView *popView;
@property (strong, nonatomic) UIButton *redView;

@end

@implementation GoTabbarChildSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.popView];
    [self.popView addSubview:self.redView];
    [self.popView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.popView.mas_centerX);
        make.centerY.mas_equalTo(self.popView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 150));
    }];
    // Do any additional setup after loading the view.
}
- (void)hiddenPopView{
    [UIView animateWithDuration:0.5f animations:^{
//        这里是改变红色试图的大小，从100 - 无限小，150 - 无限小
        self.redView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        CGRect redViewRect = self.redView.frame;
//        这里是改变红色试图的位置，x，y。
//        1. 因为起始视图我给的是中心点，所以移动的位置是高度和宽度 / 2.0。
//        2. 减去40 是距下40，减去130 是距 右130；
        redViewRect.origin.y += (M_HEIGHT / 2.0 - 40);
        redViewRect.origin.x += (M_WIDTH / 2.0 - 130) ;
        [self.redView setFrame:redViewRect];
        
    } completion:^(BOOL finished) {
        [self.popView removeFromSuperview];
        [self.redView removeFromSuperview];
    }];
}
- (UIView *)popView{
    if (!_popView) {
        _popView = [UIView new];
        _popView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    }
    return _popView;
}
- (UIButton *)redView{
    if (!_redView) {
        _redView = [UIButton new];
        _redView.backgroundColor = [UIColor redColor];
        [_redView addTarget:self action:@selector(hiddenPopView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _redView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
