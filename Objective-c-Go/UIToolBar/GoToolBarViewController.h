//
//  GoToolBarViewController.h
//  Objective-c-Go
//
//  Created by le tong on 2019/3/25.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger ,toolBarType) {
    UISearchBarType = 0,
    UIToolbarType,
    UITabBarType,
};
@interface GoToolBarViewController : UIViewController
@property (nonatomic, assign) toolBarType type;
@end

NS_ASSUME_NONNULL_END
