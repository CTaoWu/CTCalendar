//
//  CTCalendarAppearance.h
//  CTCalendar
//
//  Created by GodCoder on 2019/7/22.
//  Copyright © 2019 CTCalendar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    sunday = 1,
    monday = 2,
    thuesday = 3,
    wednesday = 4,
    thursday = 5,
    friday = 6,
    saturday = 7,
} CalndarWeek;

typedef NS_ENUM(NSInteger, ScrollDirection) {
    Vertical = 0,
    Horizontal = 1
};

@interface CTCalendarAppearance : NSObject

/** 日历水平/垂直滚动 默认:水平 */
@property (nonatomic) ScrollDirection scrollDirection;
/** 是否显示单行(一周) 默认:NO */
@property (assign, nonatomic) BOOL showSigleLine;
/** 第一天开始星期 默认:周日 */
@property (assign, nonatomic) CalndarWeek week;
/** 设置本月日期的字体颜色 */
@property (strong, nonatomic) UIColor * dayColor;
/** 设置日期的背景颜色 */
@property (strong, nonatomic) UIColor * dayBGColor;
/** 设置非本月日期的字体颜色 */
@property (strong, nonatomic) UIColor * otherMonthColor;
/** 设置本月周日,周六的字体颜色 */
@property (strong, nonatomic) UIColor * weekendTextColor;
/** 今天的字体颜色 */
@property (strong, nonatomic) UIColor * todayTextColor;
/** 今天的背景色 */
@property (strong, nonatomic) UIColor * todayBGColor;


@end

NS_ASSUME_NONNULL_END
