//
//  CTMonthCell.h
//  CTCalendarView
//
//  Created by 吴传涛 on 2019/7/18.
//  Copyright © 2019 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTCalanderDayProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface CTMonthCell : UICollectionViewCell

@property(strong, nonatomic) UICollectionView * daysContentView;

@property (weak, nonatomic) id<CTCalanderDayProtocols> daysSource;

@property (strong, nonatomic) NSDate * monthKey;

@end

NS_ASSUME_NONNULL_END
