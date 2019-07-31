//
//  NSDate+Calander.m
//  CTCalendar
//
//  Created by GodCoder on 2019/7/18.
//  Copyright © 2019 CTCalendar. All rights reserved.
//

#import "NSDate+Calander.h"

@implementation NSDate (Calander)

+ (NSString *)getDateString:(NSDate *)date with:(NSString *)formatterStr {
    if (formatterStr.length == 0) {
        formatterStr = @"yyyy-MM-dd";
    }
    NSDateFormatter * formatter = [NSDateFormatter new];
    [formatter setDateFormat:formatterStr];
    
    
    return [formatter stringFromDate:date];
}

#pragma - mark ======= 获取当月的第一天的日期NSDate =======
+ (NSDate *)getFirstDayInMonth:(NSDate *)date {
    
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
    /* 格式没有-dd,则返回的日期就是当月的第一天 */
    [myDateFormatter setDateFormat:@"yyyy-MM-01"];
    NSString * firstDayStr = [myDateFormatter stringFromDate:date];
    
    return [myDateFormatter dateFromString:firstDayStr];
}

#pragma - mark ======= 获取当天 =======
+ (NSInteger)day:(NSDate *)date {
    NSDateComponents * comps = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear|NSCalendarUnitWeekday|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:date];
    return comps.day;
}
#pragma - mark ======= 获取当月 =======
+ (NSInteger)month:(NSDate *)date {
    NSDateComponents * comps = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear|NSCalendarUnitWeekday|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:date];
    return comps.month;
}
#pragma - mark ======= 获取当年 =======
+ (NSInteger)year:(NSDate *)date {
    NSDateComponents * comps = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear|NSCalendarUnitWeekday|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:date];
    return comps.year;
}
#pragma - mark ======= 获取当月的天数 =======
+ (NSInteger)daysCountInMonth:(NSDate *)date {
    NSRange daysOfMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysOfMonth.length;
}
#pragma - mark ======= 获取当月的第一天是星期几 =======
+ (NSInteger)firstWeekDayInThisMonth:(NSDate *)date {
    
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents * comps = [calendar components:NSCalendarUnitWeekday fromDate:date];
    
    return [comps weekday];
}

#pragma - mark ======= 获取当月的上下几天的date =======
+ (NSDate *)appointDayWith:(NSDate *)date index:(NSInteger)index {
    
    NSDateFormatter * formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSCalendar * calendar = [NSCalendar currentCalendar];
    
    NSDateComponents * comps = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:date];
    [comps setDay:index];
    
    
    NSDate * newDate = [calendar dateByAddingComponents:comps toDate:date options:NSCalendarMatchNextTime];
    
    return newDate;
}
#pragma - mark ======= 获取当月的上下几个月的date =======
+ (NSDate *)appointMonthWith:(NSDate *)date index:(NSInteger)index {
    
    NSDateFormatter * formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM"];
    
    NSCalendar * calendar = [NSCalendar currentCalendar];
    
    NSDateComponents * comps = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:date];
    [comps setMonth:index];
    
    NSDate * newDate = [calendar dateByAddingComponents:comps toDate:date options:NSCalendarWrapComponents];
    
    return newDate;
}

#pragma - mark ======= 获取当年的上下几年的date =======
+ (NSDate *)appointYearWith:(NSDate *)date index:(NSInteger)index {
    
//    NSDateFormatter * formatter = [NSDateFormatter new];
//    [formatter setDateFormat:@"yyyy"];
    
    NSCalendar * calendar = [NSCalendar currentCalendar];
    
    NSDateComponents * comps = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:date];
    [comps setYear:index];
    
    NSDate * newDate = [calendar dateByAddingComponents:comps toDate:date options:NSCalendarWrapComponents];
    
    return newDate;
}

/* 获取时间段内的所有日期 */
#pragma - mark ======= 获取时间段内的所有日期 =======
+ (NSArray*)getDatesWithStartDate:(NSString *)startDate endDate:(NSString *)endDate {
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    
    //字符串转时间
    NSDateFormatter *matter = [[NSDateFormatter alloc] init];
    matter.dateFormat = @"yyyy-MM-dd";
    NSDate *start = [matter dateFromString:startDate];
    NSDate *end = [matter dateFromString:endDate];
    
    NSMutableArray *componentAarray = [NSMutableArray array];
    NSComparisonResult result = [start compare:end];
    NSDateComponents *comps;
    while (result != NSOrderedDescending) {
        comps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:start];
        
        //后一天
        [comps setDay:([comps day]+1)];
        start = [calendar dateFromComponents:comps];
        [componentAarray addObject:start];

        //对比日期大小
        result = [start compare:end];
    }
    return componentAarray;
}

+ (NSArray *)getDatesInThisMonth:(NSDate *)date {
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    formatter1.dateFormat = @"yyyy-MM-01";
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    formatter2.dateFormat = [NSString stringWithFormat:@"yyyy-MM-%zi",[self daysCountInMonth:date]];
    
    NSString * startDate = [formatter1 stringFromDate:date];
    NSString * endDate = [formatter2 stringFromDate:date];
    return [self getDatesWithStartDate:startDate endDate:endDate];
}

+ (BOOL)isSameDate:(NSDate *)date1 otherDate:(NSDate *)date2 {
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * comps1 = [calendar components:(NSCalendarUnitYear|NSCalendarUnitWeekday|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:date1];
    NSDateComponents * comps2 = [calendar components:(NSCalendarUnitYear|NSCalendarUnitWeekday|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:date2];
    
    BOOL result = [comps1 year] == [comps2 year]
                && [comps1 month] == [comps2 month]
                && [comps1 day] == [comps2 day];
    return result;
}
@end
