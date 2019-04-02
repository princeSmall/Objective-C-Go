//
//  BaseViewController.h
//  Objective-c-Go
//
//  Created by le tong on 2019/3/27.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuickLook/QuickLook.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) NSString *pdfPath;
@property (nonatomic, strong) UIButton *itemButton;
- (void)pushToNewsCenterPage;
@end

NS_ASSUME_NONNULL_END
