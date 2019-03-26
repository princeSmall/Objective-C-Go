//
//  GoSearchBarViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/3/26.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoSearchBarViewController.h"
#import <QuickLook/QuickLook.h>
#import <WebKit/WebKit.h>

@interface GoSearchBarViewController ()<UISearchBarDelegate>
@property (nonatomic, strong) UISearchBar *defaultSearchBar;
@property (nonatomic, strong) UISearchBar *changeSearchBar;
@property (nonatomic, strong) WKWebView *webView;
@end

@implementation GoSearchBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self layoutCurrentUI];
    
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"searchBar" ofType:@"pdf"];
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];

    // Do any additional setup after loading the view.
}
- (void)layoutCurrentUI{
    [self.view addSubview:self.defaultSearchBar];
    [self.view addSubview:self.changeSearchBar];
    [self.view addSubview:self.webView];
    [self.defaultSearchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    [self.changeSearchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.defaultSearchBar.mas_bottom).offset(20);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(90);
    }];
    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(self.changeSearchBar.mas_bottom).offset(20);
    }];
    
    
}
- (WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc]init];
        //获取bundlePath 路径
        NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
        //获取本地html目录 baseUrl
        NSURL *baseUrl = [NSURL fileURLWithPath: bundlePath isDirectory: YES];
        //html 路径
        NSString *indexPath = [NSString stringWithFormat: @"%@/searchbar.html", bundlePath];
        //html 文件中内容
        NSString *indexContent = [NSString stringWithContentsOfFile: indexPath encoding: NSUTF8StringEncoding error:nil];
        //显示内容
        [_webView loadHTMLString: indexContent baseURL: baseUrl];
    }
    return _webView;
}
- (UISearchBar *)defaultSearchBar{
    if (!_defaultSearchBar) {
        _defaultSearchBar = [UISearchBar new];
        
        /**
         UIBarStyleDefault          = 0, //默认风格 白色搜索框，多出的背景为灰色
         UIBarStyleBlack            = 1, //黑色风格，黑色的搜索框
         //下面两个枚举已经被禁用，作用和黑色风格一样
         UIBarStyleBlackOpaque      = 1, // Deprecated. Use UIBarStyleBlack
         UIBarStyleBlackTranslucent = 2, // Deprecated. Use UIBarStyleBlack and set the translucent
         **/
        _defaultSearchBar.barStyle = UIBarStyleBlack;
        _defaultSearchBar.delegate = self;
        _defaultSearchBar.showsCancelButton = YES;
        _defaultSearchBar.barTintColor = [UIColor orangeColor];
        _defaultSearchBar.tintColor = [UIColor greenColor];
        _defaultSearchBar.showsBookmarkButton = YES;
        /***
         UISearchBarIconSearch, 更改搜索的图标
         UISearchBarIconClear __TVOS_PROHIBITED, 更改清除的图标
         UISearchBarIconBookmark __TVOS_PROHIBITED, 更改书本的图标
         UISearchBarIconResultsList __TVOS_PROHIBITED, // The list lozenge icon
         ***/
        [_defaultSearchBar setImage:[UIImage imageNamed:@"icon_message"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
    }
    return _defaultSearchBar;
}
- (UISearchBar *)changeSearchBar{
    if (!_changeSearchBar) {
        _changeSearchBar = [UISearchBar new];
        _changeSearchBar.delegate = self;
        _changeSearchBar.showsCancelButton = YES;
        _changeSearchBar.showsScopeBar = YES;
        _changeSearchBar.placeholder = @"搜一搜";
        _changeSearchBar.scopeButtonTitles = @[@"one",@"two",@"three"];
        _changeSearchBar.selectedScopeButtonIndex = 2;
        [_changeSearchBar setBackgroundImage:[UIImage imageNamed:@"icon_searchBarBack"] forBarPosition:UIBarPositionTop barMetrics:UIBarMetricsDefault];
        [_changeSearchBar setScopeBarButtonBackgroundImage:[UIImage imageNamed:@"icon_searchBarBack"] forState:UIControlStateNormal];
        [_changeSearchBar setScopeBarBackgroundImage:[UIImage imageNamed:@"icon_searchBarBack"]];
    }
    return _changeSearchBar;
}

// return NO to not become first responder
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    return YES;
}
// called when text starts editing
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
}
// return NO to not resign first responder
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    return YES;
}
// called when text ends editing
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    
}
// called when text changes (including clear)
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

}
// called before text changes
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text NS_AVAILABLE_IOS(3_0){
    return YES;
}

/**
 软键盘的search按钮

 @param searchBar 软键盘
 */
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}

/**
 searchBar的bookMark按钮

 @param searchBar searchBar
 */
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED{
    [searchBar resignFirstResponder];
}

/**
 searchBar的取消按钮

 @param searchBar searchBar
 */
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED{
    [searchBar resignFirstResponder];
}
// called when search results button pressed
- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar NS_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED;{
    
}

/**
 Scope按钮事件

 @param searchBar searchBar
 @param selectedScope 当前选择的Scope按钮
 */
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope NS_AVAILABLE_IOS(3_0){
    
}

@end
