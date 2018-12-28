//
//  BaseViewController.m
//  HaiBa
//
//  Created by 涛程 on 17/3/22.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseHeader.h"
#import "ThemeManager.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

- (id) init {
    if (self == [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChangedNotfication:) name:kThemeChangedNotification object:nil];
    }

//    [self reloadThemeImage];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //    变化的是导航栏的颜色
    [self reloadThemeImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) themeChangedNotfication:(NSNotification *)notification {
    //变化的是tabbar的颜色
    [self reloadThemeImage];
}
//通过路径选择那个文件夹里面的图片
- (void) reloadThemeImage {
    ThemeManager * themeManager = [ThemeManager sharedThemeManager];
    NSLog(@"BaseViewController->themeManager.themeName========%@",themeManager.themeName);
    /*
     这个是根据16进制的颜色值来改变导航栏和状态栏的颜色
        if ([themeManager.themeName isEqualToString:@"blue"]) {
            [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithHex:0x6e90d6]];
        }
     */
    //更换导航栏图标
    UIImage * navigationBackgroundImage = [themeManager themeImageWithName:@"nav_bg_all-64"];
    [self.navigationController.navigationBar setBackgroundImage:navigationBackgroundImage forBarMetrics:UIBarMetricsDefault];

    //更换tabbar图标
    UIImage * tabBarBackgroundImage = [themeManager themeImageWithName:@"tabbar_background.png"];
    [self.tabBarController.tabBar setBackgroundImage:tabBarBackgroundImage];
    

}
- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)cusPopToViewController:(Class)aClass {
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[aClass class]]) {
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}
@end
