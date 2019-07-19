//
//  CTCalanderMonthProtocols.h
//  CTCalendar
//
//  Created by GodCoder on 2019/7/19.
//  Copyright © 2019 CTCalendar. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CTMonthView;
@class CTDayCell;

@protocol CTCalanderMonthProtocols <NSObject>

@optional

- (CTDayCell *)calendar:(UICollectionView *)monthView cellForItemAtDate:(NSDate *)date cellState:(NSString *)cellState indexPath:(NSIndexPath *)indexPath;

@end
