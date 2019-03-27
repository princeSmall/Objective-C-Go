//
//  GoNavigationChildViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/3/27.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoNavigationChildViewController.h"
#import "GoNavigationViewController.h"
#import "GoNavigationMainViewController.h"
@interface GoNavigationChildViewController ()

@end

@implementation GoNavigationChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"NavigationChild";
   
//    [self showNavigationMainViewController];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithTitle:@"显示Main" style:UIBarButtonItemStyleDone target:self action:@selector(touchRightBarItem)];
    
    self.navigationItem.rightBarButtonItem = rightBarItem;
//    navigationBar去除虚线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
//    设置背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"icon_searchBarBack"] forBarMetrics:UIBarMetricsDefault];
//    调节标题位置
    [self.navigationController.navigationBar setTitleVerticalPositionAdjustment:5.0 forBarMetrics:UIBarMetricsDefault];
//    返回按钮图片，必须同时设置
    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"icon_set"];
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"icon_set_S"];
    // Do any additional setup after loading the view.
}
/**
 自定义返回图片和文字
 */
- (void)backItem{
    
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"icon_back"]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"icon_back"]];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    
}
- (void)touchRightBarItem{
    [self showNavigationMainViewController];
}
- (void)showNavigationMainViewController{
    GoNavigationMainViewController *goNavigationMain = [[GoNavigationMainViewController alloc]init];
    GoNavigationViewController *goNavigation = [[GoNavigationViewController alloc]initWithRootViewController:goNavigationMain];
    [self presentViewController:goNavigation animated:YES completion:nil];
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
