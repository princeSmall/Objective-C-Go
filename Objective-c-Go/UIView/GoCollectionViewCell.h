//
//  GoCollectionViewCell.h
//  Objective-c-Go
//
//  Created by le tong on 2019/4/3.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "BaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface GoCollectionViewCell : BaseCollectionViewCell
- (void)updateCurrentUI:(NSString *)title;
+ (CGFloat)cellWidthFromCurrentCellTitle:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
