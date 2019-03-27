//
//  GoTabBarMainViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/3/27.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoTabBarMainViewController.h"
#import "GoTabbarChildOneViewController.h"
#import "GoTabbarChildTwoViewController.h"

@interface GoTabBarMainViewController ()

@end

@implementation GoTabBarMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setChildViewController];
    // Do any additional setup after loading the view.
}
- (void)setChildViewController{
    GoTabbarChildOneViewController *one = [GoTabbarChildOneViewController new];
    GoTabbarChildTwoViewController *two = [GoTabbarChildTwoViewController new];
    GoTabbarChildOneViewController *three = [GoTabbarChildOneViewController new];
    GoTabbarChildOneViewController *four = [GoTabbarChildOneViewController new];
    GoTabbarChildOneViewController *five = [GoTabbarChildOneViewController new];
    GoTabbarChildOneViewController *six = [GoTabbarChildOneViewController new];
    UITabBarItem *tabbarItemOne = [[UITabBarItem alloc]initWithTitle:@"ONE" image:[UIImage imageNamed:@"icon_message"] selectedImage:[UIImage imageNamed:@"icon_message_S"]];
    UITabBarItem *tabbarItemTwo = [[UITabBarItem alloc]initWithTitle:@"TWO" image:[UIImage imageNamed:@"icon_set"] selectedImage:[UIImage imageNamed:@"icon_set_S"]];
    UITabBarItem *tabbarItemThree = [[UITabBarItem alloc]initWithTitle:@"THREE" image:[UIImage imageNamed:@"icon_message"] selectedImage:[UIImage imageNamed:@"icon_message_S"]];
    UITabBarItem *tabbarItemFour = [[UITabBarItem alloc]initWithTitle:@"FOUR" image:[UIImage imageNamed:@"icon_message"] selectedImage:[UIImage imageNamed:@"icon_message_S"]];
    UITabBarItem *tabbarItemFive = [[UITabBarItem alloc]initWithTitle:@"FIVE" image:[UIImage imageNamed:@"icon_message"] selectedImage:[UIImage imageNamed:@"icon_message_S"]];
    UITabBarItem *tabbarItemSix = [[UITabBarItem alloc]initWithTitle:@"SIX" image:[UIImage imageNamed:@"icon_message"] selectedImage:[UIImage imageNamed:@"icon_message_S"]];
    NSArray *item = [NSArray arrayWithObjects:one,two,three,four,five,six, nil];
    two.tabBarItem = tabbarItemTwo;
    one.tabBarItem = tabbarItemOne;
    three.tabBarItem = tabbarItemThree;
    four.tabBarItem = tabbarItemFour;
    five.tabBarItem = tabbarItemFive;
    six.tabBarItem = tabbarItemSix;
    self.viewControllers = item;
//    self.tabBar.backgroundColor = [UIColor blueColor];
    self.tabBar.tintColor = [UIColor orangeColor];
    self.tabBar.barTintColor = [UIColor darkGrayColor];
//    修改文字和图片的位置
    for (UITabBarItem * item in self.tabBar.items) {
        item.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    }
    [[UITabBarItem appearance]setTitlePositionAdjustment:UIOffsetMake(0, -8)];
    
//  添加一个有颜色的View
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    view.frame = self.tabBar.bounds;
    [[UITabBar appearance] insertSubview:view atIndex:0];
    
}

/**
 修改tabbar的高度
 */
- (void)viewWillLayoutSubviews {
//    CGRect tabFrame = self.tabBar.frame;
//    tabFrame.size.height = 59;
//    tabFrame.origin.y = self.view.bounds.size.height - 59;
//    self.tabBar.frame = tabFrame;
}

//是否允许选择不同item触发后续操作，YES  允许，NO不允许
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    return YES;
}

//每次点击tabBarItem后触发这个方法(只有点击标签栏中的五个按钮才会触发，MORE里边的不会触发)
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
}

//当点击moreNaviegationController中的编辑按钮时触发的方法
- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray *)viewControllers{
}

//当点击完成按钮的时候，触发此方法
//changed :   标记viewController的顺序是否改变
//ViewControllers 返回最新的tabBarController中viewControllers
- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed NS_AVAILABLE_IOS(3_0){

}

@end
