//
//  GoFlexCollectionViewCell.h
//  Objective-c-Go
//
//  Created by le tong on 2019/4/8.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "BaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface GoFlexCollectionViewCell : BaseCollectionViewCell
+ (CGFloat)cellWidthFromCurrentCellTitle:(NSString *)title;
- (void)updateCurrentUI:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
