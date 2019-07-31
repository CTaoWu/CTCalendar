//
//  CTCalendarAppearance.m
//  CTCalendar
//
//  Created by GodCoder on 2019/7/22.
//  Copyright © 2019 CTCalendar. All rights reserved.
//

#import "CTCalendarAppearance.h"

@implementation CTCalendarAppearance

- (instancetype)init
{
    self = [super init];
    if (self) {
        _todayBGColor = [UIColor greenColor];
        _week = sunday;
        _todayTextColor = [UIColor yellowColor];
        _dayColor = [UIColor blackColor];
        _otherMonthColor = [UIColor grayColor];
        _dayBGColor = [UIColor clearColor];
    }
    return self;
}
@end
