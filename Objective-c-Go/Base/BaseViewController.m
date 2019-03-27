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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
