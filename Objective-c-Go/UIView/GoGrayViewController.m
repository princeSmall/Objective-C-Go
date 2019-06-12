//
//  GoGrayViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/4/15.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoGrayViewController.h"

@interface GoGrayViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *grayTableView;

@end

@implementation GoGrayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.grayTableView];
    
    
    NSMutableIndexSet *set = [[NSMutableIndexSet alloc]initWithIndexesInRange:NSMakeRange(0, 2)];
    // Do any additional setup after loading the view.
}
- (UIImage *)tintedImageWithColor:(UIColor *)color originalityImage:(UIImage *)image{
    CGRect rect = CGRectMake(0.0, 0.0, image.size.width, image.size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, false, image.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [image drawInRect:rect];
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetAlpha(context, 0.5);
    CGContextSetBlendMode(context, kCGBlendModeSourceAtop);
    CGContextFillRect(context, rect);
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    UIImage *uiimage = [UIImage imageWithCGImage:imageRef scale:image.scale orientation:image.imageOrientation];
    UIGraphicsEndImageContext();
    return uiimage;
}
- (UITableView *)grayTableView{
    if (!_grayTableView) {
        _grayTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _grayTableView.delegate = self;
        _grayTableView.dataSource = self;
        [_grayTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"grayCell"];
    }
    return _grayTableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"grayCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"grayCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"城会玩%ld",(long)indexPath.row];
    if (indexPath.section == 1) {
        cell.backgroundColor = [UIColor darkGrayColor];
    }else{
        cell.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}

@end
