//
//  CTDayCellModel.h
//  CTCalendar
//
//  Created by GodCoder on 2019/7/21.
//  Copyright © 2019 CTCalendar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CTDayCellModel : NSObject

@property (strong, nonatomic) NSDate * date;
/* 键 yyyy-MM-dd*/
@property (strong, nonatomic) NSString * dateKey;
/* 日 */
@property (assign, nonatomic) NSInteger day;
/* 月 */
@property (assign, nonatomic) NSInteger month;
/* 年 */
@property (assign, nonatomic) NSInteger year;
/* 是否今天 */
@property (assign, nonatomic) BOOL today;
/* 是否在本月 */
@property (assign, nonatomic) BOOL inThisMonth;
/* 是否被选中 */
@property (assign, nonatomic) BOOL select;
/* 是否有事件 */
@property (assign, nonatomic) BOOL happenEvent;
@end

NS_ASSUME_NONNULL_END
