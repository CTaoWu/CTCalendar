//
//  CTDayCell.m
//  CTCalendarView
//
//  Created by 吴传涛 on 2019/7/18.
//  Copyright © 2019 涛. All rights reserved.
//

#import "CTDayCell.h"

@implementation CTDayCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        _dayLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        _dayLab.textAlignment = NSTextAlignmentCenter;
        _dayLab.textColor = UIColor.blackColor;
        _dayLab.font = [UIFont systemFontOfSize:14];
        [self addSubview:_dayLab];
    }
    return self;
}
@end
