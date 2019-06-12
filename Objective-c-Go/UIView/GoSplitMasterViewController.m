//
//  GoSplitMasterViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/4/9.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoSplitMasterViewController.h"

@interface GoSplitMasterViewController ()

@end

@implementation GoSplitMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}

//- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc{
//    barButtonItem.title = @"Master";
//    //master将要隐藏时，给detail设置一个返回按钮
//    GoNavigationViewController *Nav = [self.splitViewController.viewControllers lastObject];
//    GoSplitDetailViewController *Detail = (GoSplitDetailViewController *)[Nav topViewController];
//    
//    Detail.navigationItem.leftBarButtonItem = barButtonItem;
//}
//- (void)splitViewController:(UISplitViewController *)sender willShowViewController:(UIViewController *)master invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
//    //master将要显示时,取消detail的返回按钮
//    UINavigationController *Nav = [self.splitViewController.viewControllers lastObject];
//    GoSplitDetailViewController *Detail = (GoSplitDetailViewController *)[Nav topViewController];
//    Detail.navigationItem.leftBarButtonItem = nil;
//}
//- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController{
//    return YES;
//}

@end
