//
//  BaseNavigatViewCtrl.h
//  HaiBa
//
//  Created by 涛程 on 17/3/22.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigatViewCtrl : UINavigationController

@end


/*
 *  当self.navigationBar.translucent为no时:
    setBackgroundImage方法为去除导航栏阴影线的方法，
    barTintColor方法为颜色赋值的方法.
 *  当self.navigationBar.translucent为yes时:
    setBackgroundImage方法为颜色活着图片赋值的方法，
    barTintColor方法隐藏.
 */
