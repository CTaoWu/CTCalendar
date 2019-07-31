//
//  CTCalendarWeekView.m
//  CTCalendar
//
//  Created by GodCoder on 2019/7/22.
//  Copyright © 2019 CTCalendar. All rights reserved.
//

#import "CTCalendarWeekView.h"

@interface CTCalendarWeekView()
@property (weak, nonatomic) IBOutlet UILabel *firstWeek;
@property (weak, nonatomic) IBOutlet UILabel *secondWeek;
@property (weak, nonatomic) IBOutlet UILabel *thirdWeek;
@property (weak, nonatomic) IBOutlet UILabel *fourthWeek;
@property (weak, nonatomic) IBOutlet UILabel *fifthWeek;
@property (weak, nonatomic) IBOutlet UILabel *sixthWeek;
@property (weak, nonatomic) IBOutlet UILabel *sevenWeek;

@end
@implementation CTCalendarWeekView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
