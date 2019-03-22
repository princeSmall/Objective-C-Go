//
//  ViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/3/22.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoMainViewController.h"
#import "GoMainCollectionViewCell.h"

typedef NS_ENUM(NSInteger,goType) {
    GO_CONTROLS = 0
};
@interface GoMainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *goMainCollectionView;
@property (nonatomic, strong) NSArray *goArray;
@property (nonatomic, strong) NSArray *controlsArray;
@property (nonatomic, strong) NSDictionary *dictionary;
@end

static NSString *const headReusableIndetifier = @"headReusableIndetifier";
@implementation GoMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.goMainCollectionView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    CGSize size = CGSizeMake(M_WIDTH, 50);
    return size;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headReusableIndetifier forIndexPath:indexPath];
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, M_WIDTH - 40, 50)];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:18.f];
        titleLabel.text = self.goArray[indexPath.row];
        [view addSubview:titleLabel];
        view.backgroundColor = RGB(238, 240, 245);
        return view;
    }else
        return nil;
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.goArray.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSString *countString = [self.dictionary objectForKey:[NSString stringWithFormat:@"%ld",section]];
    return countString.integerValue;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GoMainCollectionViewCell *cell = [GoMainCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    switch (indexPath.section) {
        case GO_CONTROLS:{
            [cell updateCurrentUI:self.controlsArray[indexPath.row]];
        }
            break;
            
        default:
            break;
    }
    return cell;
}
- (UICollectionView *)goMainCollectionView{
    if (!_goMainCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 0;
        _goMainCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _goMainCollectionView.delegate = self;
        _goMainCollectionView.dataSource = self;
        _goMainCollectionView.backgroundColor = [UIColor whiteColor];
        [_goMainCollectionView registerClass:[GoMainCollectionViewCell class] forCellWithReuseIdentifier:[GoMainCollectionViewCell reuseIdentifier]];
        [_goMainCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headReusableIndetifier];
    }
    return _goMainCollectionView;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(M_WIDTH / 4.0 , M_WIDTH / 4.0);
}
- (NSArray *)goArray{
    if (!_goArray) {
        _goArray = [NSArray arrayWithObjects:@"控件", nil];
    }
    return _goArray;
}
- (NSArray *)controlsArray{
    if (!_controlsArray) {
        _controlsArray = [NSArray arrayWithObjects:@"UITableView",@"UICollectionView", nil];
    }
    return _controlsArray;
}
- (NSDictionary *)dictionary{
    if (!_dictionary) {
        _dictionary = @{
                        [NSString stringWithFormat:@"%ld",(long)GO_CONTROLS]:[NSString stringWithFormat:@"%ld",self.controlsArray.count]
                        };
    }
    return _dictionary;
}



@end
