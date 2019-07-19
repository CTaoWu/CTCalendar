//
//  ViewController.m
//  CTCalendar
//
//  Created by GodCoder on 2019/7/18.
//  Copyright © 2019 CTCalendar. All rights reserved.
//

#import "ViewController.h"
#import "CTCalendarFlowLayout.h"
#import "DayCell.h"

#import "CTMonthView.h"
#import "NSDate+Calander.h"
#import "CTCalanderFile.h"

@interface ViewController ()<CTCalanderMonthProtocols>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CTCalendarFlowLayout * layout = [[CTCalendarFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(ScreenWidth, 400);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    CTMonthView * monthView = [[CTMonthView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 400) collectionViewLayout:layout];
    monthView.pagingEnabled = true;
    monthView.monthSource = self;
//    [monthView registerNib:[UINib nibWithNibName:@"DayCell" bundle:nil] forCellWithReuseIdentifier:@"DayCellID"];
    [self.view addSubview:monthView];
    
    NSLog(@"这个月有%zi天",[NSDate daysCountInMonth:[NSDate date]]);
    NSLog(@"这个月的第一天是星期%zi",[NSDate firstWeekDayInThisMonth:[NSDate date]]);
    NSLog(@"这个月是%zi月",[NSDate month:[NSDate date]]);
    NSLog(@"现在是%zi年",[NSDate year:[NSDate date]]);
}

- (CTDayCell *)calendar:(UICollectionView *)monthCell cellForItemAtDate:(NSDate *)date cellState:(NSString *)cellState indexPath:(NSIndexPath *)indexPath {

    [monthCell registerNib:[UINib nibWithNibName:@"DayCell" bundle:nil] forCellWithReuseIdentifier:@"DayCell"];
    DayCell * cell = [monthCell dequeueReusableCellWithReuseIdentifier:@"DayCell" forIndexPath:indexPath];
    return cell;
}

@end
