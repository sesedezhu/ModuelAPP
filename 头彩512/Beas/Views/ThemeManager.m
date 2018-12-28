//
//  ThemeManager.m
//  ThemeSkinSetupExample
//
//  Created by Macmini on 16/1/27.
//
//

#import "ThemeManager.h"


static ThemeManager * sharedThemeManager;

@implementation ThemeManager

- (id) init {
    if(self = [super init]) {
        NSString * themePath = [[NSBundle mainBundle] pathForResource:@"theme" ofType:@"plist"];
        self.themePlistDict = [NSDictionary dictionaryWithContentsOfFile:themePath];
        self.themeName = nil;
    }
    
    return self;
}

+ (ThemeManager *) sharedThemeManager {
    @synchronized(self) {
        if (nil == sharedThemeManager) {
            sharedThemeManager = [[ThemeManager alloc] init];
        }
    }
    
    return sharedThemeManager;
}

// Override 重写themeName的set方法
- (void) setThemeName:(NSString *)themeName {
    _themeName = themeName;
}
//通过图片名生成路径获取图片
- (UIImage *) themeImageWithName:(NSString *)imageName {
    if (imageName == nil) {
        return nil;
    }
    
    NSString * themePath = [self themePath];
    NSString * themeImagePath = [themePath stringByAppendingPathComponent:imageName];
    UIImage * themeImage = [UIImage imageWithContentsOfFile:themeImagePath];
    
    return themeImage;
}

// 返回主题路径
- (NSString *)themePath {
    //获取资源路径
    NSString * resourcePath = [[NSBundle mainBundle] resourcePath];
    if (self.themeName == nil || [self.themeName isEqualToString:@""]) {
        return resourcePath;
    }
    
    //获取资源文件路径
    NSString * themeSubPath = [self.themePlistDict objectForKey:self.themeName];    // Skins/blue
    NSString * themeFilePath = [resourcePath stringByAppendingPathComponent:themeSubPath]; // .../Skins/blue
    
    return themeFilePath;
}
@end
