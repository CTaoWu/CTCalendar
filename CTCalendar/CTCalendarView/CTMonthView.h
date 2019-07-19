//
//  CTMonthView.h
//  CTCalendarView
//
//  Created by 吴传涛 on 2019/7/18.
//  Copyright © 2019 涛. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CTCalanderMonthProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface CTMonthView : UIView

@property(strong, nonatomic) UICollectionView * monthView;

@property (weak, nonatomic) id<CTCalanderMonthProtocols> monthSource;

@end

NS_ASSUME_NONNULL_END
