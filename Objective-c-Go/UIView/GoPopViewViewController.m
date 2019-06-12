//
//  GoPopViewViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/6/6.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoPopViewViewController.h"
#import "GoPopView.h"

@interface GoPopViewViewController ()

@end

@implementation GoPopViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [GoPopView showPopViewWithCouponsModel];
    // Do any additional setup after loading the view.
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
