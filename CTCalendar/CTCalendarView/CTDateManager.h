//
//  CTDateManager.h
//  CTCalendar
//
//  Created by GodCoder on 2019/7/21.
//  Copyright © 2019 CTCalendar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTDayCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CTDateManager : NSObject

+ (instancetype)shareManager;

- (NSMutableArray *)getThisYearDates;

- (NSMutableArray *)getSomeMonths;

- (void)logThisMonthDays;
///  当前时间
@property (nonatomic,strong)NSDate *currentDate;

@end

NS_ASSUME_NONNULL_END
