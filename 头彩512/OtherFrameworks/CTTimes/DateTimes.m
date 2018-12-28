//
//  DateTimes.m
//  HaiBa
//
//  Created by 涛程 on 2017/7/6.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import "DateTimes.h"

@implementation DateTimes

#pragma mark - 获取当前时间戳
// 2016-12-22 10:25:40.602080 当前时间戳：1482373540
+(int)getCurrentTimeStamp{
    NSDate *currentTime = [NSDate date];
    NSString *timeStamp = [NSString stringWithFormat:@"%ld",(long)[currentTime timeIntervalSince1970]];
    int timestampInt = [timeStamp intValue];
    
    return timestampInt;
}

#pragma mark - 时间戳转成日期格式秒级 YYYY-MM-dd HH:mm:ss
+(nonnull NSString*)getTimeFromTimeStamp:(NSInteger)timestamp andDateFormatter:(nonnull NSString*)formatter{
    NSTimeInterval time=timestamp ;//因为时差问题要加8小时    + 28800
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    
    
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:formatter];
    
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    
    if (timestamp <= 0) {
        currentDateStr = @"<WHTimeTools getTimeFromTimeStamp:andDateFormatter:> (timestamp参数传入错误!!)";
    }
    
    return currentDateStr;
}
#pragma mark - 时间戳转成日期格式毫秒级 YYYY-MM-dd HH:mm:ss
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY年MM月dd HH:mm:ss"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
#pragma mark - 获取当前时间
+(nonnull NSString*)getCurrentTimeStrByFormatter:(nonnull NSString*)formatter{
    NSString *nowTime = @"<WHTimeTools> getCurrentTimeStrByFormatter ERROR!!!";
    NSDate *currentTime = [NSDate date];
    NSDateFormatter *forma = [[NSDateFormatter alloc]init];
    [forma setDateFormat:formatter];
    nowTime = [forma stringFromDate:currentTime];
    return nowTime;
}

+ (nonnull NSString *)secondsFromTimeString:(nonnull NSString *)timeString{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];//设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];
    //设置一个字符串的时间
    NSMutableString *datestring = [NSMutableString stringWithFormat:@"%@",timeString];
    //注意 如果20141202052740必须是数字，如果是UNIX时间，不需要下面的插入字符串。
    [datestring insertString:@"-" atIndex:4];
    [datestring insertString:@"-" atIndex:7];
    [datestring insertString:@" " atIndex:10];
    [datestring insertString:@":" atIndex:13];
    [datestring insertString:@":" atIndex:16];
    
    NSDateFormatter * dm = [[NSDateFormatter alloc]init];
    //指定输出的格式   这里格式必须是和上面定义字符串的格式相同，否则输出空
    [dm setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate * newdate = [dm dateFromString:datestring];
    long dd = (long)[datenow timeIntervalSince1970] - [newdate timeIntervalSince1970];
    
    
    return [NSString stringWithFormat:@"%ld", dd];
    
    
}
#pragma mark - 将某个时间转化成 时间戳

+ (NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    
    
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    
    //时间转时间戳的方法:
    
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    
    
    
//    NSLog(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    
    
    
    return timeSp;
    
}


///根据用户输入的时间(dateString)确定当天是星期几,输入的时间格式 yyyy-MM-dd ,如 2015-12-18
+ (NSString *)getTheDayOfTheWeekByDateString:(NSString *)dateString{
    
    NSDateFormatter *inputFormatter=[[NSDateFormatter alloc]init];
    
    [inputFormatter setDateFormat:@"YYYY-MM-dd"];
    
    NSDate *formatterDate=[inputFormatter dateFromString:dateString];
    
    NSDateFormatter *outputFormatter=[[NSDateFormatter alloc]init];
    
    [outputFormatter setDateFormat:@"EEEE-MMMM-d"];
    
    NSString *outputDateStr=[outputFormatter stringFromDate:formatterDate];
    
    NSArray *weekArray=[outputDateStr componentsSeparatedByString:@"-"];
    
    NSString *weekstr = [weekArray objectAtIndex:0];
//    if ([[weekArray objectAtIndex:0] isEqualToString:@"Sunday"]) {
//        weekstr = @"星期日";
//    }else if ([[weekArray objectAtIndex:0] isEqualToString:@"Monday"]){
//        weekstr = @"星期一";
//    }else if ([[weekArray objectAtIndex:0] isEqualToString:@"Tuesday"]){
//        weekstr = @"星期二";
//    }else if ([[weekArray objectAtIndex:0] isEqualToString:@"Wednesday"]){
//        weekstr = @"星期三";
//    }else if ([[weekArray objectAtIndex:0] isEqualToString:@"Thursday"]){
//        weekstr = @"星期四";
//    }else if ([[weekArray objectAtIndex:0] isEqualToString:@"Friday"]){
//        weekstr = @"星期五";
//    }else if ([[weekArray objectAtIndex:0] isEqualToString:@"Saturday"]){
//        weekstr = @"星期六";
//    }
//    if ([[weekArray objectAtIndex:0] isEqualToString:@"星期日"]) {
//        weekstr = @"星期日";
//    }else if ([[weekArray objectAtIndex:0] isEqualToString:@"星期一"]){
//        weekstr = @"星期一";
//    }else if ([[weekArray objectAtIndex:0] isEqualToString:@"星期二"]){
//        weekstr = @"星期二";
//    }else if ([[weekArray objectAtIndex:0] isEqualToString:@"星期三"]){
//        weekstr = @"星期三";
//    }else if ([[weekArray objectAtIndex:0] isEqualToString:@"星期四"]){
//        weekstr = @"星期四";
//    }else if ([[weekArray objectAtIndex:0] isEqualToString:@"星期五"]){
//        weekstr = @"星期五";
//    }else if ([[weekArray objectAtIndex:0] isEqualToString:@"星期六"]){
//        weekstr = @"星期六";
//    }
    return weekstr;
}

//获取后一天日期
+ (NSString *)timeHouTian:(NSString *)begStr DateFormatter:(NSString *)Formatter DateTime:(NSInteger)time{
    //1.将日期转化成时间戳
    NSInteger houyitime = [DateTimes timeSwitchTimestamp:begStr andFormatter:Formatter];
    NSInteger a = houyitime + time ;
    //2.将添加一天后的时时间戳转化为日期
    NSString *str = [DateTimes getTimeFromTimeStamp:a andDateFormatter:Formatter];
    //    NSLog(@"houyitime2 ======= %@",str);
    return str;
}

+ (NSString *)timeSwitchTimestamp:(NSString *)time getFormatter:(NSString *)Formatter toFormatter:(NSString *)twoFormatter{
    //1.开始时间转化时间戳-后一天
    NSInteger houyiEndtime = [DateTimes timeSwitchTimestamp:time andFormatter:Formatter];
    //2.再将时间戳转化为日期格式-后一天
    NSString *Endhouyi = [DateTimes getTimeFromTimeStamp:houyiEndtime andDateFormatter:twoFormatter];
    return Endhouyi;
}
@end
