//
//  BaseCollectionViewCell.h
//  Objective-c-Go
//
//  Created by le tong on 2019/3/22.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionViewCell : UICollectionViewCell
- (void)layoutCurrentUI;
+ (NSString *)reuseIdentifier;
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
