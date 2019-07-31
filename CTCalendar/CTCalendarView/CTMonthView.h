//
//  CTMonthView.h
//  CTCalendarView
//
//  Created by 吴传涛 on 2019/7/18.
//  Copyright © 2019 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTCalendarAppearance.h"
#import "CTCalanderMonthProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface CTMonthView : UICollectionView

@property (weak, nonatomic) id<CTCalanderMonthProtocols> monthSource;

@property (strong, nonatomic) CTCalendarAppearance * appearance;

- (void)tableViewContentOffsetY:(CGFloat)tableViewContentOffsetY;

- (void)nextPage;

- (void)lastPage;

@end

NS_ASSUME_NONNULL_END
