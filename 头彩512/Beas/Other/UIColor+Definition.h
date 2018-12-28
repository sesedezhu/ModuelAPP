//
//  UIColor+Definition.h
//  CT实用modules
//
//  Created by 涛程 on 2018/7/23.
//  Copyright © 2018年 涛程. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Definition)
/*
 * 使用 16 进制数字创建颜色，例如 0xFF0000 创建红色
 * @param hex 16 进制无符号32位整数
 * @return 颜色
 */
+ (instancetype)colorWithHex:(uint32_t)hex;
/*
 * 生成随机颜色
 * @return 随机颜色
 */
+ (instancetype)colorRandom;
/*
 * 使用 R / G / B 数值创建颜色
 * @param red   red
 * @param green green
 * @param blue  blue
 * @return 颜色
 */
+ (instancetype)colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;
/*
 * 通过颜色生成图片
 * @color 颜色值
 * @return 返回图片类型
 */
+ (UIImage*)imageColorWithCreateImage:(UIColor*)color;
@end
