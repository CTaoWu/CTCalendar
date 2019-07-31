//
//  CTCalendarView.h
//  CTCalendar
//
//  Created by GodCoder on 2019/7/22.
//  Copyright © 2019 CTCalendar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTCalendarAppearance.h"

NS_ASSUME_NONNULL_BEGIN

@interface CTCalendarView : UIScrollView

@property (strong, nonatomic) CTCalendarAppearance * appearance;

@end

NS_ASSUME_NONNULL_END
