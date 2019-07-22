//
//  CTMonthCell.m
//  CTCalendarView
//
//  Created by 吴传涛 on 2019/7/18.
//  Copyright © 2019 涛. All rights reserved.
//

#import "CTMonthCell.h"

#import "CTDayCell.h"
#import "CTCalendarDaysLayout.h"

#import "CTCalanderFile.h"

@interface CTMonthCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) CTCalendarDaysLayout * layout;

@property (strong, nonatomic) NSMutableArray<CTDayCellModel *> * dayModels;

@end
@implementation CTMonthCell

static NSString * CTDayCellID = @"CTDayCellIDID";

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        CGFloat space = 5;
        CGFloat size = (CGRectGetWidth(self.frame) - space*6)/7;
        _dayModels = [NSMutableArray array];
        
        _layout = [[CTCalendarDaysLayout alloc] init];
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _layout.itemSize = CGSizeMake(size, size);
        _layout.minimumInteritemSpacing = space;
        _layout.minimumLineSpacing = space;
        
        _daysContentView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) collectionViewLayout:_layout];
        _daysContentView.pagingEnabled = true;
        _daysContentView.delegate = self;
        _daysContentView.dataSource = self;
        _daysContentView.backgroundColor = UIColor.whiteColor;
        
        [_daysContentView registerClass:[CTDayCell class] forCellWithReuseIdentifier:CTDayCellID];
        [self addSubview:_daysContentView];

    }
    return self;
}

- (void)setMonthKey:(NSDate *)monthKey {
    _monthKey = monthKey;
    NSInteger firstWeekDay = [NSDate firstWeekDayInThisMonth:monthKey];// 3周二,4:周三,5:四=
    for (NSInteger i = 0; i < 42; i ++) {
        CTDayCellModel * model = [CTDayCellModel new];
        NSDate * tmpDate = [NSDate appointDayWith:[NSDate getFirstDayInMonth:monthKey] index:i - firstWeekDay + 1];

        /// 从第一天开始算,如果小于当月开始的第一天的星期几,则是上个月的日期
        if (i < firstWeekDay - 1) {
            model.inThisMonth = false;
        }
        else if (i > firstWeekDay - 2 + [NSDate daysCountInMonth:monthKey]) {
            model.inThisMonth = false;
        }
        else {
            model.inThisMonth = true;
        }
        
        model.dateKey = [NSDate getDateString:tmpDate with:@""];
        model.month = [NSDate month:tmpDate];
        model.year = [NSDate year:tmpDate];
        model.day = [NSDate day:tmpDate];
        
        [_dayModels addObject:model];
    }
    [_daysContentView reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_daysSource && [_daysSource respondsToSelector:@selector(calendar:cellForItemAtDate:cellState:indexPath:)]) {
        return [_daysSource calendar:collectionView cellForItemAtDate:[NSDate date] cellState:@"" indexPath:indexPath];
    } else {
        CTDayCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CTDayCellID forIndexPath:indexPath];
//        cell.dayLab.text = [NSString stringWithFormat:@"%zi", indexPath.row];
        cell.dayLab.text = [NSString stringWithFormat:@"%zi", _dayModels[indexPath.row].day];
        if (!_dayModels[indexPath.row].inThisMonth) {
            cell.dayLab.textColor = [UIColor redColor];
        } else {
            cell.dayLab.textColor = [UIColor blackColor];
        }
        return cell;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return [NSDate daysCountInMonth:[NSDate date]];
    return 42;
}

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 7;
//}
@end

