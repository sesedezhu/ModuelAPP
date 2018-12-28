//
//  BaseNavigatViewCtrl.m
//  HaiBa
//
//  Created by 涛程 on 17/3/22.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import "BaseNavigatViewCtrl.h"
#import "UIColor+Definition.h"

@interface BaseNavigatViewCtrl ()

@end

@implementation BaseNavigatViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.设置导航栏上的标题文字颜色
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont systemFontOfSize:19]};
    
    // 2.以下两行代码可以把导航栏下面的阴影线去掉
    /*
       使用此方法，当隐藏导航栏的时候，其下的字类都将不调用
     */
    [self.navigationBar setBackgroundImage:[UIColor imageColorWithCreateImage:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    
    //导航栏的背景颜色
//    self.navigationBar.barTintColor =allcolor;
//    self.navigationBar.barTintColor = [UIColor colorWithHex:0x2e90d4];
//    [UIColor colorWithHex:0x2e90d4];
    //改变返回键的文字颜色
     [self.navigationBar setTintColor:[UIColor blackColor]];
    
    // 关闭半透明效果,初始值将从导航栏以下开始
//    self.navigationBar.translucent = NO;
    
    /*
     跳入下一页，保留导航栏左侧图标，文字隐藏
     */
//    self.navigationController.navigationBar.topItem.title = @""; //保留返回图标，去掉后面的字
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//隐藏导航栏将不能实现
 //设置 UIStatusBar 的首选样式
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleLightContent;    //黑底白字
//    return UIStatusBarStyleDefault;         //白底黑字
//    return UIStatusBarStyleLightContent;
//}
//
//- (UIViewController *)childViewControllerForStatusBarStyle{
//    return self.topViewController;
//}

/*
 
 //状态栏变白色
 info.plist
 View controller-based status bar appearance = no
 Status bar style  =  UIStatusBarStyleLightContent
 
 */
@end
