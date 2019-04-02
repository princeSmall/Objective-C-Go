//
//  BaseViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/3/27.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.itemButton];
    // Do any additional setup after loading the view.
}

- (WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc]init];
        //获取bundlePath 路径
        NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
        //获取本地html目录 baseUrl
        NSURL *baseUrl = [NSURL fileURLWithPath: bundlePath isDirectory: YES];
        //html 路径
        NSString *indexPath = [NSString stringWithFormat: @"%@/%@", bundlePath,self.pdfPath];
        //html 文件中内容
        NSString *indexContent = [NSString stringWithContentsOfFile: indexPath encoding: NSUTF8StringEncoding error:nil];
        //显示内容
        [_webView loadHTMLString: indexContent baseURL: baseUrl];
    }
    return _webView;
}
- (UIButton *)itemButton{
    if (!_itemButton) {
        _itemButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        _itemButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_itemButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _itemButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_itemButton addTarget:self action:@selector(pushToNewsCenterPage) forControlEvents:UIControlEventTouchUpInside];
        _itemButton.hidden = YES;
    }
    return _itemButton;
}
- (void)pushToNewsCenterPage{
    
}
@end
