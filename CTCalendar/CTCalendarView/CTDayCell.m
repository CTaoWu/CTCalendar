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
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = UIColor.blackColor.CGColor;
        self.layer.masksToBounds = true;
        
        CGFloat dayLabSize = CGRectGetWidth(frame)*2/3;
        _dayLab = [[UILabel alloc] init];
        _dayLab.frame = CGRectMake(CGRectGetWidth(frame)/6, CGRectGetWidth(frame)/6, dayLabSize, dayLabSize);
        _dayLab.textAlignment = NSTextAlignmentCenter;
        _dayLab.textColor = UIColor.blackColor;
        _dayLab.font = [UIFont systemFontOfSize:14];
        _dayLab.layer.masksToBounds = true;
        _dayLab.layer.borderWidth = 1;
        [_dayLab.layer setCornerRadius:dayLabSize/2];
        [self addSubview:_dayLab];
    }
    return self;
}
@end
