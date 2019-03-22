//
//  BaseTableViewCell.m
//  Objective-c-Go
//
//  Created by le tong on 2019/3/22.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)layoutCurrentUI{
    //    子类重写
}
+ (NSString *)reuseIdentifier{
    return NSStringFromClass([self class]);
}
+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style{
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self reuseIdentifier]];
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:style reuseIdentifier:[self reuseIdentifier]];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self layoutCurrentUI];
    }
    return self;
}

@end
