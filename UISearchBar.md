#### UISearchBar 的初始化方法
<pre>
- (instancetype)init 
- (instancetype)initWithFrame:(CGRect)frame 
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder 
</pre>

#### 搜索框风格

<pre>
@property(nonatomic) UIBarStyle barStyle;
typedef NS_ENUM(NSInteger, UIBarStyle) {
    UIBarStyleDefault         //白色搜索框，灰色背景
    UIBarStyleBlack           //黑色搜索框,
    
    UIBarStyleBlackOpaque      = 1, // 禁用. Use UIBarStyleBlack
    UIBarStyleBlackTranslucent = 2, // 禁用. Use UIBarStyleBlack and set the translucent property to YES
}
</pre>

#### 搜索文本、提示文字、占位符
<pre>
 // 搜索的文本
@property(nullable,nonatomic,copy)   NSString *text;  
 // 搜索框顶部的提示信息 
@property(nullable,nonatomic,copy)   NSString *prompt;    
// 占位符，默认nil, 若有值则在输入文本后消失
@property(nullable,nonatomic,copy)   NSString *placeholder;  
</pre>

#### 搜索框右侧的按钮
<pre>
// 搜索框右侧是否显示图书按钮 
@property(nonatomic)  BOOL showsBookmarkButton;   
//搜索框右侧是否显示取消按钮 
@property(nonatomic) BOOL showsCancelButton;  
//搜索框右侧是否显示搜索结果按钮   
@property(nonatomic) BOOL showsSearchResultsButton; 
// 搜索结果按钮为选中状态
@property(nonatomic, getter=isSearchResultsButtonSelected) BOOL searchResultsButtonSelected；
// 风格颜色，可用于修改输入框的光标颜色，取消按钮和选择栏被选中时候都会变成设置的颜色
@property(null_resettable, nonatomic,strong) UIColor *tintColor;
// 搜索框背景颜色
@property(nullable, nonatomic,strong) UIColor *barTintColor;
// 搜索框中文本框的背景偏移量
@property(nonatomic) UIOffset searchFieldBackgroundPositionAdjustment;
// 搜索框中文本框的文本偏移量
@property(nonatomic) UIOffset searchTextPositionAdjustment;
// 设置搜索框的图标
- (void)setImage:(nullable UIImage *)iconImage forSearchBarIcon:(UISearchBarIcon)icon state:(UIControlState)state;
// 获取搜索框的图标
- (nullable UIImage *)imageForSearchBarIcon:(UISearchBarIcon)icon state:(UIControlState)state;
typedef NS_ENUM(NSInteger, UISearchBarIcon) {
    UISearchBarIconSearch, // 搜索框放大镜图标
    UISearchBarIconClear , // 搜索框右侧可用于清除输入的文字的图标x
    UISearchBarIconBookmark , // 搜索框右侧的图书图标
    UISearchBarIconResultsList , // 搜索框右侧的搜索结果列表图标
};
</pre>

#### 搜索框样式
<pre>
// 搜索框样式
@property (nonatomic) UISearchBarStyle searchBarStyle
typedef NS_ENUM(NSUInteger, UISearchBarStyle) {
    UISearchBarStyleDefault,    // 默认样式，和UISearchBarStyleProminent 一样
    UISearchBarStyleProminent,  // 显示背景，常用在my Mail, Messages and Contacts
    UISearchBarStyleMinimal     // 不显示背景，系统自带的背景色无效，自定义的有效，常用在Calendar, Notes and Music
} 
</pre>

#### ScopeButton
<pre>
// 选择按钮试图的按钮标题    
@property(nullable, nonatomic,copy) NSArray<NSString *> *scopeButtonTitles ; 
// 选中的按钮下标值 ，默认 0. 如果超出范围则忽略
@property(nonatomic) NSInteger  selectedScopeButtonIndex ; 
// 是否显示搜索栏的附件选择按钮视图
@property(nonatomic) BOOL showsScopeBar;
// 搜索框背景图片
@property(nullable, nonatomic,strong) UIImage *backgroundImage;
// 搜索框附属分栏条的背景颜色
@property(nullable, nonatomic,strong) UIImage *scopeBarBackgroundImage;
// 设置选择按钮视图的分割线图片
- (void)setScopeBarButtonDividerImage:(nullable UIImage *)dividerImage forLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState;
// 获取选择按钮视图的分割线图片
- (nullable UIImage *)scopeBarButtonDividerImageForLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState;
// 设置选择按钮视图的标题样式
- (void)setScopeBarButtonTitleTextAttributes:(nullable NSDictionary<NSString *, id> *)attributes forState:(UIControlState)state;
// 获取选择按钮视图的标题样式
- (nullable NSDictionary<NSString *, id> *)scopeBarButtonTitleTextAttributesForState:(UIControlState)state
</pre>




