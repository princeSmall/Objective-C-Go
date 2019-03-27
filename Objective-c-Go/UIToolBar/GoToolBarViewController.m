


//
//  GoToolBarViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/3/25.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoToolBarViewController.h"
@interface GoToolBarViewController ()

@end

@implementation GoToolBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.title = @"NavigationBar";
    self.navigationItem.title = @"NavigationBar";
    [self toolBarItem];
    
    // Do any additional setup after loading the view.
}

- (void)toolBarItem{
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:3];
    UIBarButtonItem *confirmBtn = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(sure)];
    UIBarButtonItem *flexibleSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *titleItem = [[UIBarButtonItem alloc] initWithTitle:@"用户类型" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //titleItem.tintColor = [UIColor blackColor];
    //titleItem.appearance.tintColor = [UIColor redColor];
    
    [titleItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],UITextAttributeTextColor,[UIColor clearColor],UITextAttributeTextShadowColor, nil] forState:UIControlStateNormal];
    titleItem.enabled = NO;
    titleItem.tag = 1;
    
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    [items addObject:cancelBtn];
    [items addObject:flexibleSpaceItem];
    [items addObject:titleItem];
    [items addObject:flexibleSpaceItem];
    [items addObject:confirmBtn];
    
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 200, M_WIDTH, 44)];
//    [toolBar setBackgroundImage:[UIImage imageNamed:@"icon_search"] forToolbarPosition:0 barMetrics:0];
    toolBar.backgroundColor = [UIColor orangeColor];
    
//    toolBar.barStyle = UIBarStyleBlackTranslucent;
    toolBar.items = items;
    [self.view addSubview:toolBar];
}
- (void)sure{
    
}
- (void)cancel{
    
}



@end
