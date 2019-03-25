


//
//  GoToolBarViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/3/25.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoToolBarViewController.h"
@interface GoToolBarViewController ()<UITabBarDelegate,UINavigationBarDelegate,UISearchBarDelegate>

@end

@implementation GoToolBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.title = @"NavigationBar";
    self.navigationItem.title = @"NavigationBar";
//    [self toolBarItem];
    [self searchBar];
    // Do any additional setup after loading the view.
}
- (void)searchBar{
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 300, M_WIDTH, 50)];
    searchBar.delegate = self;
    searchBar.showsCancelButton = YES;
    searchBar.showsSearchResultsButton = YES;
    searchBar.showsBookmarkButton = YES;
    searchBar.placeholder = @"搜一搜";
//    searchBar.barTintColor = [UIColor whiteColor];
//    searchBar.searchBarStyle = UISearchBarStyleProminent;
//    searchBar.tintColor = [UIColor whiteColor];
    [self.view addSubview:searchBar];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
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

/**
 自定义返回图片和文字
 */
- (void)backItem{
    
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"icon_back"]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"icon_back"]];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    
}

/**
 自定义左右按钮和图片
 */
- (void)leftRightItem{
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_back"] style:UIBarButtonItemStyleDone target:self action:@selector(touchLeftBarItem)];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithTitle:@"right" style:UIBarButtonItemStyleDone target:self action:@selector(touchRightBarItem)];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    self.navigationItem.rightBarButtonItem = rightBarItem;
    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
}

/**
 自定义TabBarItem
 */
- (void)tabbarItem{
    UITabBar *bar = [[UITabBar alloc]initWithFrame:CGRectMake(0, M_HEIGHT - 49, M_WIDTH, 49)];
    UITabBarItem *itemOne = [[UITabBarItem alloc]initWithTitle:@"消息" image:[UIImage imageNamed:@"icon_message"] selectedImage:[UIImage imageNamed:@"icon_message_S"]];
    UITabBarItem *itemTwo = [[UITabBarItem alloc]initWithTitle:@"设置" image:[UIImage imageNamed:@"icon_set"] selectedImage:[UIImage imageNamed:@"icon_set_S"]];
    bar.items = @[itemOne,itemTwo];
    bar.delegate = self;
    [self.view addSubview:bar];
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
- (void)touchLeftBarItem{
    
}
- (void)touchRightBarItem{
    
}
- (void)navigationBar:(UINavigationBar *)navigationBar didPushItem:(UINavigationItem *)item{
    NSLog(@"1");
}
- (void)navigationBar:(UINavigationBar *)navigationBar didPopItem:(UINavigationItem *)item{
    NSLog(@"2");
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
}


@end
