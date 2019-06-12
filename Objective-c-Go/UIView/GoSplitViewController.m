//
//  GoSplitViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/4/9.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoSplitViewController.h"
#import "GoSplitDetailViewController.h"
#import "GoSplitMasterViewController.h"
#import "GoNavigationViewController.h"

@interface GoSplitViewController ()

@end

@implementation GoSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
}
- (instancetype)init{
    if (self = [super init]) {
        GoSplitDetailViewController *detail = [[GoSplitDetailViewController alloc]init];
        GoSplitMasterViewController *master = [[GoSplitMasterViewController alloc]init];
        GoNavigationViewController *detailNav = [[GoNavigationViewController alloc]initWithRootViewController:detail];
        GoNavigationViewController *masterNav = [[GoNavigationViewController alloc]initWithRootViewController:master];
        self.viewControllers = @[detailNav,masterNav];
        self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
        self.preferredPrimaryColumnWidthFraction = 100.f;
    }
    return self;
}





@end
