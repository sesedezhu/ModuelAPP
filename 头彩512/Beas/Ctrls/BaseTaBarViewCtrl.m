//
//  BaseTaBarViewCtrl.m
//  HaiBa
//
//  Created by 涛程 on 17/3/22.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import "BaseTaBarViewCtrl.h"
#import "BaseNavigatViewCtrl.h"


#import "ThemeManager.h"
#import "UIFactory.h"

@interface BaseTaBarViewCtrl ()

@end

@implementation BaseTaBarViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    // 1.添加5个子控制器
    UIViewController *vc1 = [self addChildViewControllerWithClassName:@"HomeViewCtrl" andTabBarItemWithTitle:@"活动" andImageName:@"Home"];
   UIViewController *vc3 = [self addChildViewControllerWithClassName:@"FoundCtrl" andTabBarItemWithTitle:@"攻略" andImageName:@"Found"];
    UIViewController *vc5 = [self addChildViewControllerWithClassName:@"MyCtrl" andTabBarItemWithTitle:@"信息" andImageName:@"myss"];
    
    // 给标签控制器添加五个子控制器
    self.viewControllers = @[vc1, vc3, vc5];
//    self.viewControllers = @[vc1,vc2, vc3, vc5];

    // 设置标签栏的主题色,下边的item字体
    self.tabBar.tintColor = [UIColor  colorWithRed:85/255.00 green:210/255.00 blue:146/255.00 alpha:1.0f];
    // 设置tabBar的背景图片
//    ThemeManager * themeManager = [ThemeManager sharedThemeManager];
//    UIImage * tabBarBackgroundImage = [themeManager themeImageWithName:@"tabbar_background.png"];
//    self.tabBar.backgroundImage = tabBarBackgroundImage;
    self.tabBar.translucent = NO;
    //去除tabbar顶部的阴影线
//    [self.tabBar setClipsToBounds:YES];
}

- (UIViewController *)addChildViewControllerWithClassName:(NSString *)className andTabBarItemWithTitle:(NSString *)title andImageName:(NSString *)imageName {
    
    // 1.把字符串形式的类的名称转换成类
    Class class = NSClassFromString(className);
    
    // 创建控制器
    UIViewController *vc = [[class alloc] init];
    
    // 在子控制和标签控制器之间嵌套导航控制器
    BaseNavigatViewCtrl *nav = [[BaseNavigatViewCtrl alloc] initWithRootViewController:vc];
    
    // 拼接高亮图片名称
    NSString *selImageNmae = [imageName stringByAppendingString:@"_Sel"];
    
    // 设置标签栏上的文字及图片
    UITabBarItem * homeTabBarItem = [UIFactory createTabBarItemWithTitle:title imageName:imageName selectedImage:selImageNmae];
    
    //更换tabBarItem
    nav.tabBarItem = homeTabBarItem;

    // 设置导航条的标题
    vc.navigationItem.title = title;
//    vc.view.backgroundColor = [UIColor whiteColor];
    
    return nav;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
