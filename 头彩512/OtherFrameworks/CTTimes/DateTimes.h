//
//  DateTimes.h
//  HaiBa
//
//  Created by 涛程 on 2017/7/6.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateTimes : NSObject
#pragma mark - 获取当前时间戳
/**
 * 2016-12-22 10:25:40.602080 当前时间戳：1482373540
 * 根据手机上当前的时间获取时间耀
 */
+(int)getCurrentTimeStamp;

#pragma mark - 时间戳转成日期格式秒级 yyyy-MM-dd HH:mm:ss
/**
 * timestamp:   1482373540
 * formatter:   yyyy年MM月dd日 HH:mm
 * return       2016年12月22日 10:25
 * 请注意！timestamp 时间戳请传入9位，其他位数不可行。formatter 日期格式 请写正确。
 */
+(nonnull NSString*)getTimeFromTimeStamp:(NSInteger)timestamp andDateFormatter:(nonnull NSString*)formatter;
#pragma mark - 时间戳转成日期格式毫秒级 YYYY-MM-dd HH:mm:ss
+ (nonnull NSString *)timeWithTimeIntervalString:(nonnull NSString *)timeString;
#pragma mark - 获取当前时间
/**
 *  formatter:@"YYYY-MM-dd HH:mm:ss"  想要得到的时间字符串格式
 */
+(nonnull NSString*)getCurrentTimeStrByFormatter:(nonnull NSString*)formatter;
#pragma mark - 当前时间与给定时间【秒】差
/*
 当前时间与给定时间timeString的时间【秒】差
 timeString格式参考：20161013101801
 */
+ (nonnull NSString *)secondsFromTimeString:(nonnull NSString *)timeString;
#pragma mark - 将某个时间转化成 时间戳
/*
 * formatTime 时间日期
 * format     设置时间格式
 * return     返回时间耀
 */
+ (NSInteger)timeSwitchTimestamp:(NSString *_Nullable)formatTime andFormatter:(NSString *_Nullable)format;




//根据用户输入的时间(dateString)确定当天是星期几,输入的时间格式 yyyy-MM-dd ,如 2015-12-18
+ (NSString *_Nullable)getTheDayOfTheWeekByDateString:(NSString *_Nullable)dateString;
#pragma mark - 获取后一天日期
/*
 begStr       开始时间 2017-10-08
 Formatter    时间格式 YYYY-MM-dd
 time         结束时间 - 开始时间 = 天数； 24*60*60*N
 
 */
+ (NSString *_Nullable)timeHouTian:(NSString *_Nullable)begStr DateFormatter:(NSString *_Nullable)Formatter DateTime:(NSInteger )time;
#pragma mark - 转化字符串时间显示样式如：
/*
 显示格式变化
 time : 2017-09-07
 Formatter : YYYY-MM-dd
 toFormatter:YYYY-MM月dd日
 return : 2017-09月07日
 */
+ (NSString *_Nullable)timeSwitchTimestamp:(NSString *_Nullable)time getFormatter:(NSString *_Nullable)Formatter toFormatter:(NSString *_Nullable)twoFormatter;
@end
