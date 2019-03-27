### UITabBarController
* UITabBarController为具有多个顶级模式的应用程序管理按钮栏和转换视图。
* 要在应用程序中使用，请将其视图添加到视图层次结构中，然后按顺序添加顶级视图控制器。
* 大多数客户端不需要子类化UITabBarController。
* 如果将五个以上的视图控制器添加到选项卡栏控制器中，则只显示前四个视图控制器。
* 其余的将在自动生成的更多项目下访问。
* UITabBarController是可旋转的，如果它的所有视图控制器都是可旋转的。

<pre>
//是否允许选择不同item触发后续操作，YES  允许，NO不允许
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    return YES;
}

//每次点击tabBarItem后触发这个方法(只有点击标签栏中的五个按钮才会触发，MORE里边的不会触发)
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
}

//当点击moreNaviegationController中的编辑按钮时触发的方法
- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray *)viewControllers{
}

//当点击完成按钮的时候，触发此方法
//changed :   标记viewController的顺序是否改变
//ViewControllers 返回最新的tabBarController中viewControllers
- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed NS_AVAILABLE_IOS(3_0){

}
</pre>

### UITabBar

<pre>
//    self.tabBar.backgroundColor = [UIColor blueColor];
    self.tabBar.tintColor = [UIColor orangeColor];
    self.tabBar.barTintColor = [UIColor darkGrayColor];
//  添加一个有颜色的View
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    view.frame = self.tabBar.bounds;
    [[UITabBar appearance] insertSubview:view atIndex:0];
    /**
 修改tabbar的高度
 */
- (void)viewWillLayoutSubviews {
    CGRect tabFrame = self.tabBar.frame;
    tabFrame.size.height = 59;
    tabFrame.origin.y = self.view.bounds.size.height - 59;
    self.tabBar.frame = tabFrame;
}   
</pre>

### UITabBarItem
<pre>
//  设置名称、图片和选择图片
UITabBarItem *tabbarItemOne = [[UITabBarItem alloc]initWithTitle:@"ONE" image:[UIImage imageNamed:@"icon_message"] selectedImage:[UIImage imageNamed:@"icon_message_S"]];
//    修改文字和图片的位置
for (UITabBarItem * item in self.tabBar.items) {
      item.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
   }
[[UITabBarItem appearance]setTitlePositionAdjustment:UIOffsetMake(0, -8)];

</pre>