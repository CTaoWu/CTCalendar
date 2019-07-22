//
//  CTDayCell.h
//  CTCalendarView
//
//  Created by 吴传涛 on 2019/7/18.
//  Copyright © 2019 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTCalanderDayProtocols.h"
#import "CTDayCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CTDayCell : UICollectionViewCell

@property (strong, nonatomic) UILabel * dayLab;

@property (weak, nonatomic) id<CTCalanderDayProtocols> dayDelegate;

@end

NS_ASSUME_NONNULL_END
