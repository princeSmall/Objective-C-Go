//
//  ViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/3/22.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoMainViewController.h"
#import "GoMainCollectionViewCell.h"
#import "GoToolBarViewController.h"
#import "GoSearchBarViewController.h"
#import "GoTabBarMainViewController.h"
#import "GoNavigationViewController.h"
#import "GoNavigationChildViewController.h"

typedef NS_ENUM(NSInteger,goType) {
    GO_UIToolbar = 0,
    GO_UIView,
    GO_UIControl,
    GO_Function
};
@interface GoMainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *goMainCollectionView;
@property (nonatomic, strong) NSArray *goArray;
@property (nonatomic, strong) NSArray *barArray;
@property (nonatomic, strong) NSArray *viewArray;
@property (nonatomic, strong) NSArray *controlsArray;
@property (nonatomic, strong) NSArray *functionArray;
@property (nonatomic, strong) NSDictionary *dictionary;

@end

static NSString *const headReusableIndetifier = @"headReusableIndetifier";
@implementation GoMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Objective-C-Go";
    [self.view addSubview:self.goMainCollectionView];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(M_WIDTH, 50);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headReusableIndetifier forIndexPath:indexPath];
        UILabel *titleLabel = [UILabel new];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:18.f];
        titleLabel.text = self.goArray[indexPath.section];
        [view addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 20, 0, 20));
        }];
        view.backgroundColor = RGB(238, 240, 245);
        return view;
    }else
        return nil;
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.goArray.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [self arrayFromDictionaryKey:section].count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GoMainCollectionViewCell *cell = [GoMainCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    NSInteger sec = indexPath.section;
    NSInteger r = indexPath.row;
    [cell updateCurrentUI:[self arrayFromDictionaryKey:sec][r]];
   
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case GO_UIToolbar:{
            if (indexPath.row == 3) {
                [self.navigationController pushViewController:[GoSearchBarViewController new] animated:YES];
            }else if (indexPath.row == 2){
                GoToolBarViewController *goToolBar = [GoToolBarViewController new];
                [self.navigationController pushViewController:goToolBar animated:YES];
            }else if (indexPath.row == 0){
                GoNavigationChildViewController *goNavigationChild = [GoNavigationChildViewController new];
                 [self.navigationController pushViewController:goNavigationChild animated:YES];
            }else if (indexPath.row == 1){
                GoTabBarMainViewController *tabBar = [GoTabBarMainViewController new];
                [self.navigationController pushViewController:tabBar animated:YES];
            }
            
        }
            break;
            
        default:
            break;
    }
}
- (UICollectionView *)goMainCollectionView{
    if (!_goMainCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 0;
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
        _goArray = @[@"UIToolBar",@"UIView",@"UIControl",@"Function"];
    }
    return _goArray;
}
- (NSArray *)barArray{
    if (!_barArray) {
        
        _barArray = @[@"UINavigationController",@"UITabBarController",@"UIToolbar",@"UISearchBar",];
    }
    return _barArray;
}
- (NSArray *)controlsArray{
    if (!_controlsArray) {
        
        _controlsArray = @[@"UIButton",@"UILabel",@"UITextField"];
    }
    return _controlsArray;
}
- (NSArray *)viewArray{
    if (!_viewArray) {
        
        _viewArray = @[@"UITableView",@"UICollectionView",@"UISplitViewController"];
    }
    return _viewArray;
}
- (NSArray *)functionArray{
    if (!_functionArray) {
        _functionArray = @[@"Share",@"Chat"];
    }
    return _functionArray;
}
- (NSDictionary *)dictionary{
    if (!_dictionary) {
        _dictionary = @{
                        [self stringFromInter:GO_UIControl]:self.controlsArray,
                        [self stringFromInter:GO_UIToolbar]:self.barArray,
                        [self stringFromInter:GO_UIView]:self.viewArray,
                        [self stringFromInter:GO_Function]:self.functionArray,
                        };
    }
    return _dictionary;
}

- (NSArray *)arrayFromDictionaryKey:(NSInteger)key{
    NSArray *array = [self.dictionary objectForKey:[self stringFromInter:key]];
    return [array copy];
}

- (NSString *)stringFromInter:(NSInteger)inter{
    return [NSString stringWithFormat:@"%ld",inter];
}



@end
