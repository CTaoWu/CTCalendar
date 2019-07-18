//
//  NSDate+Calander.m
//  CTCalendar
//
//  Created by GodCoder on 2019/7/18.
//  Copyright © 2019 CTCalendar. All rights reserved.
//

#import "NSDate+Calander.h"

@implementation NSDate (Calander)

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
    
    NSDateComponents * comps = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:date];
    
    return [comps weekday];
}
@end
