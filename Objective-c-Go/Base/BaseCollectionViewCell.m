//
//  BaseCollectionViewCell.m
//  Objective-c-Go
//
//  Created by le tong on 2019/3/22.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell

- (void)layoutCurrentUI{
//    子类重写
}
+ (NSString *)reuseIdentifier{
    return NSStringFromClass([self class]);
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath{
    BaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[self reuseIdentifier] forIndexPath:indexPath];
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
        [self layoutCurrentUI];
    }
    return self;
}
@end
