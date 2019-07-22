//
//  CTDateManager.m
//  CTCalendar
//
//  Created by GodCoder on 2019/7/21.
//  Copyright © 2019 CTCalendar. All rights reserved.
//

#import "CTDateManager.h"
#import "CTCalanderFile.h"

@implementation CTDateManager

static CTDateManager * mgr = nil;

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mgr = [super allocWithZone:zone];
    });
    return mgr;
}


+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mgr = [[self alloc] init];
    });
    return mgr;
}

- (NSMutableArray *)getThisYearDates {
    NSMutableArray * array = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 12; i ++) {
        CTDayCellModel * model = [CTDayCellModel new];
        
        NSDate * tmpDate = [NSDate appointMonthWith:[NSDate date] index: i - 6];
        
        model.dateKey = [NSDate getDateString:tmpDate with:@""];
        model.day = [NSDate day:tmpDate];
        model.month = [NSDate month:tmpDate];
        model.year = [NSDate year:tmpDate];
        
        [array addObject:model];
    }
    return array;
}

- (NSMutableArray *)getSomeMonths {
    NSMutableArray * array = [[NSMutableArray alloc] init];
    NSDateFormatter * formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    for (NSInteger i = 0; i < 24; i ++) {
        
        NSDate * tmpDate = [NSDate appointMonthWith:[NSDate date] index: i];
        [array addObject:tmpDate];
    }
    return array;
}
/* **获取月份内的所有日期,返回模型数组 */
- (NSMutableArray*)getDayModelsOfMonth:(NSDate *)date {
    NSMutableArray * array = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 42; i ++) {
        CTDayCellModel * model = [CTDayCellModel new];
        
        NSDate * tmpDate = [NSDate appointDayWith:[NSDate date] index: i];
        model.dateKey = [NSDate getDateString:tmpDate with:@""];
        model.day = [NSDate day:tmpDate];
        model.month = [NSDate month:tmpDate];
        model.year = [NSDate year:tmpDate];
        
        [array addObject:model];
    }
    return array;
}

/* 控制台打印当前日期该显示的日历表📅 */
- (void)logThisMonthDays {
    
    NSDate * thisDate = [NSDate date];
    //    NSInteger day = [NSDate day:thisDate];
    NSInteger year = [NSDate year:thisDate];
    NSInteger month = [NSDate month:thisDate];
    NSInteger days = [NSDate daysCountInMonth:thisDate];
    NSInteger firstWeekDay = [NSDate firstWeekDayInThisMonth:thisDate];
    NSInteger lastMonthDays = [NSDate daysCountInMonth:[NSDate appointMonthWith:thisDate index:-1]];
    printf("%zi-%zi\n",year,month);
    
    /// 大于28天就显示5行
    NSInteger lines = days > 28 ? 5:4;
    /// 每行显示多少天
    NSInteger column = 7;
    /// 实际输出的天数
    NSInteger realityDay = 0;
    /// 下个月的天数
    NSInteger nextMonthDay = 0;
    
    for (NSInteger i = 0; i < lines; i ++) {
        for (NSInteger j = 0; j < column; j ++) {
            
            /* 判断要输出的日期是否是属于下一个月的日期 */
            if (realityDay >= days) {
                nextMonthDay++;
                printf("%zi   ", nextMonthDay);
                continue;
            }
            /* 第一行日期 并且  不属于当月*/
            if (i == 0 && j < firstWeekDay) {
                NSInteger lastMonthDay = lastMonthDays - firstWeekDay + j + 1;
                printf("%zi   ",lastMonthDay);
            }
            else {
                realityDay++;
                printf("%zi   ",realityDay);
            }
        }
        printf("\n");
    }
}

@end
