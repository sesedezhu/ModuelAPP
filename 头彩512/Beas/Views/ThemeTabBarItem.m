//
//  ThemeTabBarItem.m
//  ThemeSkinSetupExample
//
//  Created by Macmini on 16/1/28.
//
//

#import "ThemeTabBarItem.h"
#import "ThemeManager.h"
#import "BaseHeader.h"

@implementation ThemeTabBarItem

// 初始化时注册观察者
- (id) init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChangedNotification:) name:kThemeChangedNotification object:nil];
        //改变图片位置
//        UIEdgeInsets insets = UIEdgeInsetsMake(3, 0, -3, 0);
//        self.imageInsets = insets;
        //改变文字位置
        self.titlePositionAdjustment = UIOffsetMake(0, -4);
    }
    
    return self;
}

- (id) initWithTitle:(NSString *)title imageName:(NSString *)imageName selectedImage:(NSString *)selectedImageName {
    if (self = [self init]) {
        
        self.titles = title;
        self.imageName = imageName;         // 此时会调用[self setImageName:imageName] ---> [self reloadThemeImage] --->[self setImage:image]
        self.selectedImageName = selectedImageName;// 此时会调用[self setSelectedImageName:selectedImageName];
        
        
    }
    
    return self;
}

#pragma mark - Override Setter
- (void) setTitles:(NSString *)titles{
    if (_titles != titles) {
        _titles = titles;
    }
    self.title = _titles;
}
- (void) setImageName:(NSString *)imageName {
    if (_imageName != imageName) {
        _imageName = imageName;
    }
    
    [self reloadThemeImage];
}

- (void) setSelectedImageName:(NSString *)selectedImageName {
    if (_selectedImageName != selectedImageName) {
        _selectedImageName = selectedImageName;
    }
    
    [self reloadThemeImage];
}



// 主题改变之后重新加载图片
- (void)themeChangedNotification:(NSNotification *)notification {
    [self reloadThemeImage];
}

- (void)reloadThemeImage {
    ThemeManager * themeManager = [ThemeManager sharedThemeManager];
    
    if (self.imageName != nil) {
        UIImage * image = [themeManager themeImageWithName:self.imageName];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self setImage:image];
        
    }
    
    if (self.selectedImageName != nil) {
        UIImage * selectedImage = [themeManager themeImageWithName:self.selectedImageName];
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self setSelectedImage:selectedImage];
    }
}

/*
 PS:重要-----------------------------------------
 着色（Tint Color）是iOS7界面中的一个重大改变，你可以设置一个UIImage在渲染时是否使用当前视图的Tint Color。UIImage新增了一个只读属性：renderingMode，对应的还有一个新增方法：imageWithRenderingMode:，它使用UIImageRenderingMode枚举值来设置图片的renderingMode属性。该枚举中包含下列值：
 1.UIImageRenderingModeAutomatic       根据图片使用环境和所处的绘图上下自动调整
 2.UIImageRenderingModeAlwaysOriginal  始终保持图片的原始状态
 3.UIImageRenderingModeAlwaysTemplate  根据tint color 绘制图片，忽略图片的颜色信息
 
 renderingMode属性的默认值是UIImageRenderingModeAutomatic，即UIImage是否使用Tint Color取决于它显示的位置。其他情况可以看下面的图例
 
 UIImage * selectedImage = [themeManager themeImageWithName:self.selectedImageName];
 selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
 */



- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
