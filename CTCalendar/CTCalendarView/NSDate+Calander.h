//
//  NSDate+Calander.h
//  CTCalendar
//
//  Created by GodCoder on 2019/7/18.
//  Copyright © 2019 CTCalendar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Calander)

/** 获取当月的第一天的日期NSDate */
+ (NSDate *)getFirstDayInMonth:(NSDate *)date;
/** 获取年月日 */
+ (NSString *)getDateString:(NSDate *)date with:(NSString *)formatterStr;
/** 获取当天 */
+ (NSInteger)day:(NSDate *)date;
/** 获取当月 */
+ (NSInteger)month:(NSDate *)date;
/** 获取当年 */
+ (NSInteger)year:(NSDate *)date;
/** 获取当月的天数 */
+ (NSInteger)daysCountInMonth:(NSDate *)date;
/** 获取当月的第一天是星期几 */
+ (NSInteger)firstWeekDayInThisMonth:(NSDate *)date;
/**
 date: 选择的时间
 index: 选择的时间的上下几个月 正数为未来的几个月,负数为之前的几个月
 */
+ (NSDate *)appointMonthWith:(NSDate *)date index:(NSInteger)index;
+ (NSDate *)appointYearWith:(NSDate *)date index:(NSInteger)index;
/** 获取当月的上下几个月的date */
+ (NSDate *)appointDayWith:(NSDate *)date index:(NSInteger)index;
/** 获取时间段内的所有日期 */
+ (NSArray*)getDatesWithStartDate:(NSString *)startDate endDate:(NSString *)endDate;
/**
 
 获取当月的日期
 */
+ (NSArray *)getDatesInThisMonth:(NSDate *)date;
@end

NS_ASSUME_NONNULL_END
