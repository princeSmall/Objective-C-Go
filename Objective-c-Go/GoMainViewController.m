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

typedef NS_ENUM(NSInteger,goType) {
    GO_TOOLBAR = 0,
    GO_CONTROLS,
};
@interface GoMainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *goMainCollectionView;
@property (nonatomic, strong) NSArray *goArray;
@property (nonatomic, strong) NSArray *barArray;
@property (nonatomic, strong) NSArray *controlsArray;
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

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    CGSize size = CGSizeMake(M_WIDTH, 50);
    return size;
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
    NSString *countString = [self.dictionary objectForKey:[NSString stringWithFormat:@"%ld",section]];
    return countString.integerValue;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GoMainCollectionViewCell *cell = [GoMainCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    switch (indexPath.section) {
        case GO_TOOLBAR:{
            [cell updateCurrentUI:self.barArray[indexPath.row]];
        }
            break;
        case GO_CONTROLS:{
            [cell updateCurrentUI:self.controlsArray[indexPath.row]];
        }
            break;
       
            
        default:
            break;
    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case GO_TOOLBAR:{
            if (indexPath.row == self.barArray.count - 1) {
                [self.navigationController pushViewController:[GoSearchBarViewController new] animated:YES];
            }else if (indexPath.row == 1){
                GoToolBarViewController *goToolBar = [GoToolBarViewController new];
                [self.navigationController pushViewController:goToolBar animated:YES];
            }else if (indexPath.row == 2){
                
            }else if (indexPath.row == 4){
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
        _goArray = [NSArray arrayWithObjects:@"UIToolBar",@"控件",@"属性", nil];
    }
    return _goArray;
}
- (NSArray *)barArray{
    if (!_barArray) {
        
        _barArray = [NSArray arrayWithObjects:@"UINavigationBar",@"UINavigationController",@"UINavigationItem",@"UITabBar",@"UITabBarController",@"UITabBarItem",@"UIToolbar",@"UISearchBar", nil];
    }
    return _barArray;
}
- (NSArray *)controlsArray{
    if (!_controlsArray) {
        
        _controlsArray = [NSArray arrayWithObjects:@"UITableView",@"UICollectionView",@"UISplitViewController", nil];
    }
    return _controlsArray;
}
- (NSDictionary *)dictionary{
    if (!_dictionary) {
        _dictionary = @{
                        [NSString stringWithFormat:@"%ld",(long)GO_CONTROLS]:[NSString stringWithFormat:@"%ld",self.controlsArray.count],
                        [NSString stringWithFormat:@"%ld",(long)GO_TOOLBAR]:[NSString stringWithFormat:@"%ld",self.barArray.count]
                        };
    }
    return _dictionary;
}



@end
