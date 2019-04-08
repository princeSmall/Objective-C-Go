//
//  GoCollectionViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/4/2.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoCollectionViewController.h"
#import "GoCollectionViewCell.h"
#import "GoFlexCollectionViewCell.h"
#import "GoFlexFlowLayout.h"

@interface GoCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    NSInteger currentI;
    NSInteger currentPageControl;
}
@property (nonatomic, strong) UICollectionView *goCollectionView;
@property (nonatomic, strong) UICollectionView *goFlexCollectionView;
@property (nonatomic, strong) UICollectionView *goScrollCollectionView;
@property (nonatomic, strong) NSArray *goArray;
@property (nonatomic, strong) NSMutableArray *goFlexArray;
@property (nonatomic, strong) NSArray *goScrollArray;
@property (nonatomic, strong) UIPageControl *goPageControl;
@property (nonatomic, strong) UICollectionViewFlowLayout *flow;
@property (nonatomic, strong) dispatch_source_t gcdTime;
@end

@implementation GoCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentI = 0;
    [self caculateGoFlexCollectionViewWidth];
    [self.view addSubview:self.goCollectionView];
    self.itemButton.hidden = NO;
    [self.itemButton setTitle:@"Horizontal" forState:UIControlStateNormal];
    [self.itemButton setTitle:@"Vertical" forState:UIControlStateSelected];
    [self.goCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(70.f);
        make.left.mas_equalTo(60.f);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(130.f);
    }];
    [self.view addSubview:self.goFlexCollectionView];
    [self.goFlexCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.goCollectionView.mas_bottom).offset(50);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(55);
    }];
    [self.view addSubview:self.goScrollCollectionView];
    [self.goScrollCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.goFlexCollectionView.mas_bottom).offset(50);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];
    [self.view addSubview:self.goPageControl];
    [self.goPageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.bottom.mas_equalTo(self.goScrollCollectionView.mas_bottom).offset(-10);
        make.size.mas_equalTo(CGSizeMake(50, 10));
    }];
    [self addGcdTime];
    // Do any additional setup after loading the view.
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self removeGcdTime];
}

/**
 计算换行：
 获取第二行最后一个item
 看是否可以放下@"..."，如果放不下取代前一位item，如果能放下，取代当前位item
 */
- (void)caculateGoFlexCollectionViewWidth{
    CGFloat currentWidth = 0.0;
    for (NSInteger i = 0; i < self.goFlexArray.count; i ++) {
        currentWidth = currentWidth + [self cellWidthFromCurrentCellTitle:self.goFlexArray[i]] + 10.f;
        if (currentI == 1) {
            if (currentWidth > M_WIDTH - 40) {
                if (currentWidth - [self cellWidthFromCurrentCellTitle:self.goFlexArray[i]] + [self cellWidthFromCurrentCellTitle:@"..."] > M_WIDTH - 40) {
                    currentI = i - 1;
                    [self.goFlexArray replaceObjectAtIndex:currentI withObject:@"..."];
                }else{
                    currentI = i ;
                    [self.goFlexArray replaceObjectAtIndex:currentI withObject:@"..."];
                }
                break;
            }
        }else{
            if (currentWidth > M_WIDTH - 40) {
                currentI = currentI + 1;
                currentWidth = [self cellWidthFromCurrentCellTitle:self.goFlexArray[i]] + 10.f;
            }
        }
    }
}

- (CGFloat)cellWidthFromCurrentCellTitle:(NSString *)title{
    /*计算宽度时要确定高度*/
    CGRect rect = [title boundingRectWithSize:CGSizeMake(MAXFLOAT,15.f) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.f]} context:nil];
    return rect.size.width + 5.f;
}
- (void)pushToNewsCenterPage{
    self.itemButton.selected = !self.itemButton.selected;
    self.flow.scrollDirection = self.itemButton.selected ? UICollectionViewScrollDirectionVertical : UICollectionViewScrollDirectionHorizontal;
    [self.goCollectionView reloadData];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if ([collectionView isEqual:self.goCollectionView]) {
         return self.goArray.count;
    }else if ([collectionView isEqual:self.goScrollCollectionView]){
        return self.goScrollArray.count;
    }else{
        return self.goFlexArray.count;
    }
   
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger r = indexPath.row;
    if ([collectionView isEqual:self.goCollectionView]) {
        GoCollectionViewCell *cell = [GoCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];
        [cell updateCurrentUI:self.goArray[r]];
        return cell;
    }else if ([collectionView isEqual:self.goScrollCollectionView]){
        GoFlexCollectionViewCell *cell = [GoFlexCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];
        [cell updateCurrentUI:self.goFlexArray[r]];
        return cell;
    } else{
        if ((currentI != 1 && currentI == r) || r == 0) {
            GoFlexCollectionViewCell *cell = [GoFlexCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];
            [cell updateCurrentUI:self.goFlexArray[r]];
            return cell;
        }else{
            GoCollectionViewCell *cell = [GoCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];
            [cell updateCurrentUI:self.goFlexArray[r]];
            return cell;
        }
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([collectionView isEqual:self.goFlexCollectionView]) {
        return CGSizeMake([GoCollectionViewCell cellWidthFromCurrentCellTitle:self.goFlexArray[indexPath.row]], 19);
    }else if ([collectionView isEqual:self.goScrollCollectionView]){
        return CGSizeMake(M_WIDTH, 100);
    }else
    return CGSizeMake(105.f, 60.f);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10.f;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10.f;
}
// 防止按住图片而没有停止定时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeGcdTime];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView.contentOffset.x < M_WIDTH *currentPageControl) {
        currentPageControl = currentPageControl - 1;
    }else if(scrollView.contentOffset.x > M_WIDTH *currentPageControl){
        currentPageControl = currentPageControl + 1;
    }
    [self.goScrollCollectionView setContentOffset:CGPointMake(currentPageControl * M_WIDTH, 0) animated:YES];
    self.goPageControl.currentPage = currentPageControl;
    [self addGcdTime];
}
#pragma mark -- 添加定时器
- (void)addGcdTime{
    // 这里需要强引用
    self.gcdTime = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    // 开始时间支持纳秒级别
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)2 * NSEC_PER_SEC);
    // 2秒执行一次
    uint64_t dur = (uint64_t)(3.0 * NSEC_PER_SEC);
    // 最后一个参数是允许的误差，即使设为零，系统也会有默认的误差
    dispatch_source_set_timer(self.gcdTime, start, dur, 0);
    // 设置回调
    dispatch_source_set_event_handler(self.gcdTime, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self goScrollCollectionViewFunction];
        });
    });
    dispatch_resume(self.gcdTime);
}
#pragma mark -- 删除定时器
- (void)removeGcdTime{
    // 取消定时器
    dispatch_cancel(self.gcdTime);
    self.gcdTime = nil;
}
#pragma mark -- 添加滚动方法
- (void)goScrollCollectionViewFunction{
    if (self.goScrollArray.count > 1) {
        if (currentPageControl == self.goScrollArray.count - 1) {
            currentPageControl = 0;
            [self.goScrollCollectionView setContentOffset:CGPointMake(currentPageControl * M_WIDTH, 0) animated:NO];
        }else{
            currentPageControl ++ ;
            [self.goScrollCollectionView setContentOffset:CGPointMake(currentPageControl * M_WIDTH, 0) animated:YES];
        }
        self.goPageControl.currentPage = currentPageControl;
    }
}

- (UICollectionView *)goCollectionView{
    if (!_goCollectionView) {
        self.flow = [[UICollectionViewFlowLayout alloc]init];
        self.flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _goCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:self.flow];
        _goCollectionView.delegate = self;
        _goCollectionView.dataSource = self;
        _goCollectionView.backgroundColor = [UIColor whiteColor];
        [_goCollectionView registerClass:[GoCollectionViewCell class] forCellWithReuseIdentifier:[GoCollectionViewCell reuseIdentifier]];
    }
    return _goCollectionView;
}
- (UICollectionView *)goFlexCollectionView{
    if (!_goFlexCollectionView) {
        GoFlexFlowLayout *f = [GoFlexFlowLayout new];
        _goFlexCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:f];
        _goFlexCollectionView.delegate = self;
        _goFlexCollectionView.dataSource = self;
        _goFlexCollectionView.scrollEnabled = NO;
        _goFlexCollectionView.backgroundColor = [UIColor whiteColor];
        [_goFlexCollectionView registerClass:[GoFlexCollectionViewCell class] forCellWithReuseIdentifier:[GoFlexCollectionViewCell reuseIdentifier]];
        [_goFlexCollectionView registerClass:[GoCollectionViewCell class] forCellWithReuseIdentifier:[GoCollectionViewCell reuseIdentifier]];
    }
    return _goFlexCollectionView;
}

- (UICollectionView *)goScrollCollectionView{
    if (!_goScrollCollectionView) {
        UICollectionViewFlowLayout *f = [UICollectionViewFlowLayout new];
        f.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _goScrollCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:f];
        _goScrollCollectionView.delegate = self;
        _goScrollCollectionView.dataSource = self;
        _goScrollCollectionView.backgroundColor = [UIColor whiteColor];
        [_goScrollCollectionView registerClass:[GoFlexCollectionViewCell class] forCellWithReuseIdentifier:[GoFlexCollectionViewCell reuseIdentifier]];
    }
    return _goScrollCollectionView;
}
- (UIPageControl *)goPageControl{
    if (!_goPageControl) {
        _goPageControl = [UIPageControl new];
        _goPageControl.numberOfPages = self.goScrollArray.count;
        _goPageControl.pageIndicatorTintColor = [UIColor redColor];
        _goPageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    }
    return _goPageControl;
}

- (NSArray *)goArray{
    if (!_goArray) {
        _goArray = @[@"Red",@"Green",@"Blue",@"Orange",@"Black",@"Gray",@"alpha"];
    }
    return _goArray;
}
- (NSArray *)goScrollArray{
    if (!_goScrollArray) {
        _goScrollArray = @[@"Red",@"Green",@"Blue",@"Orange",@"Black"];
    }
    return _goScrollArray;
}
- (NSMutableArray *)goFlexArray{
    if (!_goFlexArray) {
        _goFlexArray = [NSMutableArray arrayWithObjects:@"最新的资讯如下：",@"最新的资讯",@"最新资讯",@"最新的",@"最新的资",@"Black",@"Gray",@"alpha",@"Red",@"Green",@"BlueBlueBlue",@"Orange" ,nil];
    }
    return _goFlexArray;
}

@end
