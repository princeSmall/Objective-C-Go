
//
//  GoNavigationMainViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/3/27.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoNavigationMainViewController.h"

@interface GoNavigationMainViewController ()<UINavigationBarDelegate>
@property (nonatomic, strong) UIButton *newsButton;
@end

@implementation GoNavigationMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //设置navigation上的titleview
    NSArray *arr = [NSArray arrayWithObjects:@"1",@"2",nil];
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:arr];
    self.navigationItem.titleView = segment;
    [self leftRightItem];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:self.newsButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    // Do any additional setup after loading the view.
}
/**
 自定义NavigationBarItem
 */
- (void)navigationBarItem{
    UINavigationBar *navBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, M_WIDTH, 84)];
    UINavigationItem *itemRight = [[UINavigationItem alloc]initWithTitle:@"Right"];
    UINavigationItem *itemCenter = [[UINavigationItem alloc]initWithTitle:@"Center"];
    UINavigationItem *itemLeft = [[UINavigationItem alloc]initWithTitle:@"Left"];
    
    navBar.items = @[itemRight,itemCenter,itemLeft];
    navBar.delegate = self;
    [self.view addSubview:navBar];
}
/**
 自定义左右按钮和图片
 */
- (void)leftRightItem{
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_back"] style:UIBarButtonItemStyleDone target:self action:@selector(touchLeftBarItem)];
    self.navigationItem.leftBarButtonItem = leftBarItem;

}
- (void)touchLeftBarItem{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIButton *)newsButton
{
    if (!_newsButton) {
        _newsButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        _newsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_newsButton setTitleEdgeInsets:UIEdgeInsetsMake(18 ,-8, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
        [_newsButton setImageEdgeInsets:UIEdgeInsetsMake(-15, 0.0,0.0, -36)];//图片距离右边框距离减少图片的宽度，其它不变
        
        [_newsButton setTitle:@"消息" forState:UIControlStateNormal];
        [_newsButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _newsButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_newsButton setImage:[UIImage imageNamed:@"messageItem"] forState:UIControlStateNormal];
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(30, 20, 5, 5)];
        view.backgroundColor = [UIColor redColor];
        [_newsButton addSubview:view];
        //        [_newsButton addTarget:self action:@selector(pushToNewsCenterPage) forControlEvents:UIControlEventTouchUpInside];
    }
    return _newsButton;
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
