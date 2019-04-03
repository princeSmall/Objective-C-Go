//
//  GoCollectionViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/4/2.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoCollectionViewController.h"
#import "GoCollectionViewCell.h"

@interface GoCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *goCollectionView;
@property (nonatomic, strong) NSArray *goArray;
@property (nonatomic, strong) UICollectionViewFlowLayout *flow;
@end

@implementation GoCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    // Do any additional setup after loading the view.
}
- (void)pushToNewsCenterPage{
    self.itemButton.selected = !self.itemButton.selected;
    self.flow.scrollDirection = self.itemButton.selected ? UICollectionViewScrollDirectionVertical : UICollectionViewScrollDirectionHorizontal;
    [self.goCollectionView reloadData];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.goArray.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GoCollectionViewCell *cell = [GoCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    NSInteger r = indexPath.row;
    [cell updateCurrentUI:self.goArray[r]];
    return cell;
}
- (UICollectionView *)goCollectionView{
    if (!_goCollectionView) {
        self.flow = [[UICollectionViewFlowLayout alloc]init];
        self.flow.itemSize = CGSizeMake(105.f, 60.f);
        self.flow.minimumLineSpacing = 10.f;
        self.flow.minimumInteritemSpacing = 10.f;
        self.flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _goCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:self.flow];
        _goCollectionView.delegate = self;
        _goCollectionView.dataSource = self;
        _goCollectionView.backgroundColor = [UIColor whiteColor];
        [_goCollectionView registerClass:[GoCollectionViewCell class] forCellWithReuseIdentifier:[GoCollectionViewCell reuseIdentifier]];
    }
    return _goCollectionView;
}
- (NSArray *)goArray{
    if (!_goArray) {
        _goArray = @[@"Red",@"Green",@"Blue",@"Orange",@"Black",@"Gray",@"alpha"];
    }
    return _goArray;
}

@end
