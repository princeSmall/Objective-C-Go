//
//  GoNavigationViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/3/27.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoNavigationViewController.h"

@interface GoNavigationViewController ()

@end

@implementation GoNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setTintColor:[UIColor redColor]];
    self.navigationBar.barTintColor = [UIColor orangeColor];
    
    // Do any additional setup after loading the view.
}


- (void)navigationBar:(UINavigationBar *)navigationBar didPushItem:(UINavigationItem *)item{
    NSLog(@"1");
}
- (void)navigationBar:(UINavigationBar *)navigationBar didPopItem:(UINavigationItem *)item{
    NSLog(@"2");
}


@end
