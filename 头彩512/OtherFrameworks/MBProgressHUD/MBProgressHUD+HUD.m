//
//  MBProgressHUD+HUD.m
//  MBProgressHUD
//
//  Created by zhuchenglong on 16/7/23.
//  Copyright © 2016年 zhuchenglong. All rights reserved.
//

#import "MBProgressHUD+HUD.h"

#define DelayTime 2

@implementation MBProgressHUD (HUD)

/***
    最新版本的背景颜色的灰色半透明和黑色字，不喜欢的话可以用下面的方法修改：
 
    方框背景颜色(也可直接在MBProgressHUD.m的1111行修改)
    hud.bezelView.color = [UIColor blueColor];
    菊花和文字颜色
    hud.contentColor = [UIColor whiteColor];
 ***/
// 找到原因了，在MBProgressHUD.m的 1164行，注释掉就好了，原因是作者在背景图框上加了一层毛玻璃UIVisualEffectView，去掉就没有问题了。

/** 只显示菊花 **/
+(void)showLoadHUD{
    
    [MBProgressHUD hideHUD];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.contentColor = [UIColor whiteColor];
}


//显示菊花+文字
+(void)showLoadHUDMsg:(NSString *)message{
    
    [MBProgressHUD hideHUD];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];

    //关闭交互可以点击去风火轮外的区域
    hud.userInteractionEnabled = NO;
    //菊花和文字颜色
    hud.contentColor = allcolor;
    hud.label.text = message;
    
    
}

//显示菊花+文字外围不可点击
+(void)showLoadHUDMsgbigan:(NSString *)message{
    
    [MBProgressHUD hideHUD];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    
    //开启交互不可以点击去风火轮外的区域
    hud.userInteractionEnabled = NO;
    //菊花和文字颜色
    hud.contentColor = allcolor;
    hud.label.text = message;
    
    
}
//显示文字-->几秒钟后消失
+(void)showHUDMsg:(NSString *)message{
    
    [MBProgressHUD hideHUD];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.numberOfLines = 0;
    hud.label.text = message;
    hud.label.font = [UIFont systemFontOfSize:TRANS_VALUE(12)];
    hud.contentColor = [UIColor whiteColor];
    hud.userInteractionEnabled = NO;
    hud.bezelView.backgroundColor = [UIColor  colorWithRed:71/255.00 green:71/255.00 blue:73/255.00 alpha:0.7f];
    
    //可以设置显示的位置
    hud.offset = CGPointMake(0.f, -60);
    [hud hideAnimated:YES afterDelay:DelayTime];
}

/** 环形进度条+文字 **/
+(void)showCircularHUDProgress{
    
    [MBProgressHUD hideHUD];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.contentColor = [UIColor whiteColor];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.mode = MBProgressHUDModeDeterminate;
    hud.label.text = @"加载中...";
}

/** 更新progress进度 **/
+(MBProgressHUD *)getHUDProgress{
    
    return [MBProgressHUD HUDForView:[UIApplication sharedApplication].keyWindow];
    
}


/** 水平进度条 + 文字 **/
+(void)showBarHUDProgress{
    
    [MBProgressHUD hideHUD];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.contentColor = [UIColor whiteColor];
    hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    hud.label.text = @"加载中...";
}

/** 自定义图片 + 文字 **/
+(void)showCustomViewHUD:(NSString *)msg imageName:(NSString *)imageName{
    
    [MBProgressHUD hideHUD];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.contentColor = [UIColor whiteColor];
    hud.mode = MBProgressHUDModeCustomView;
    //设置显示的图片
    UIImage *image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    // Looks a bit nicer if we make it square.
    hud.square = YES;
    hud.label.text = msg;
    [hud hideAnimated:YES afterDelay:DelayTime];
}


/** 自定义加载动画 + 文字 旋转**/
+(void)showCustomGifHUD:(NSString *)msg imageName:(NSString *)imageName{
    
    [MBProgressHUD hideHUD];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.contentColor = [UIColor whiteColor];
    hud.mode = MBProgressHUDModeCustomView;
//    hud.bezelView.color = [UIColor clearColor];
    //设置显示的图片
    hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    hud.customView.size = CGSizeMake(46, 46);
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2.0];
    rotationAnimation.duration = 0.6;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 20000;//重复次数
    [hud.customView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    // Looks a bit nicer if we make it square.
    hud.square = YES;
    hud.label.text = msg;
    
    hud.bezelView.backgroundColor = [UIColor  colorWithRed:0/255.00 green:0/255.00 blue:0/255.00 alpha:0.8f];
    hud.label.font = [UIFont systemFontOfSize:13];
    //关闭交互可以点击去风火轮外的区域
    hud.userInteractionEnabled = NO;
}
/** 自定义加载动画 + 文字 多图**///后面的imageName字符串要改为数组，后面用了再整理吧
+(void)showCustomTwoGifHUD:(NSString *)msg imageArray:(NSArray *)imageArray{
    [MBProgressHUD hideHUD];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    //    hud.contentColor = [UIColor redColor];
    hud.mode = MBProgressHUDModeCustomView;
    
    hud.userInteractionEnabled = NO;
    //自定义动画
    UIImageView *gifImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_refresh_01"]];
    NSMutableArray *arrM = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i ++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"icon_refresh_0%d", i + 2]];
        [arrM addObject:image];
    }
    [gifImageView setAnimationImages:arrM];
    [gifImageView setAnimationDuration:0.3];
    [gifImageView setAnimationRepeatCount:0];
    [gifImageView startAnimating];
    
    hud.customView = gifImageView;
    hud.square = YES;
    hud.label.text = msg;
    //关闭交互可以点击去风火轮外的区域
    hud.userInteractionEnabled = NO;
}
//隐藏HUD
+(void)hideHUD{
    
    [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
}



@end
