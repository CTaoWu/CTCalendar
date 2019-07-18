//
//  ViewController.m
//  CTCalendar
//
//  Created by GodCoder on 2019/7/18.
//  Copyright © 2019 CTCalendar. All rights reserved.
//

#import "ViewController.h"

#import "CTMonthView.h"
#import "NSDate+Calander.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CTMonthView * monthView = [[CTMonthView alloc] initWithFrame:CGRectMake(0, 100, UIScreen.mainScreen.bounds.size.width, 400)];
    self.view.userInteractionEnabled = true;
    [self.view addSubview:monthView];
    
    NSLog(@"这个月有%zi天",[NSDate daysCountInMonth:[NSDate date]]);
    NSLog(@"这个月的第一天是星期%zi",[NSDate firstWeekDayInThisMonth:[NSDate date]]);
    NSLog(@"这个月是%zi月",[NSDate month:[NSDate date]]);
    NSLog(@"现在是%zi年",[NSDate year:[NSDate date]]);

}


@end
