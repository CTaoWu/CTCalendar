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

#pragma - mark ======= 获取当月 =======
+ (NSInteger)month:(NSDate *)date;
#pragma - mark ======= 获取当年 =======
+ (NSInteger)year:(NSDate *)date;
#pragma - mark ======= 获取当月的天数 =======
+ (NSInteger)daysCountInMonth:(NSDate *)date;
#pragma - mark ======= 获取当月的第一天是星期几 =======
+ (NSInteger)firstWeekDayInThisMonth:(NSDate *)date;
@end

NS_ASSUME_NONNULL_END
