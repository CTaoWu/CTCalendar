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
#import "CTCalendarWeekView.h"
#import "CTCalanderFile.h"

@interface CTMonthCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) CTCalendarDaysLayout * layout;

@property (strong, nonatomic) NSMutableArray<CTDayCellModel *> * dayModels;

@end
@implementation CTMonthCell

static NSString * CTDayCellID = @"CTDayCellIDID";
static NSString * CTCalendarWeekViewID = @"CTCalendarWeekViewID";

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
//        [_daysContentView registerNib:[UINib nibWithNibName:@"CTCalendarWeekView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CTCalendarWeekViewID];

        [self addSubview:_daysContentView];

    }
    return self;
}

- (void)setMonthKey:(NSDate *)monthKey {
    _monthKey = monthKey;
    [_dayModels removeAllObjects];
    NSDate * firstDate = [NSDate getFirstDayInMonth:monthKey];

    NSInteger firstWeekDay = [NSDate firstWeekDayInThisMonth:firstDate];// 3周二,4:周三,5:四=
    NSDateFormatter * formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    for (NSInteger i = 0; i < 42; i ++) {
        CTDayCellModel * model = [CTDayCellModel new];
        NSDate * tmpDate = [NSDate appointDayWith:firstDate index:i - firstWeekDay + 1];

        /// 从第一天开始算,如果小于当月开始的第一天的星期几,则是上个月的日期
        if (i < firstWeekDay - 1) {
            model.inThisMonth = false;
        }
        else if (i > [NSDate daysCountInMonth:monthKey] + firstWeekDay - 2) {
            model.inThisMonth = false;
        }
        else {
            model.inThisMonth = true;
        }
        
        if ([NSDate isSameDate:tmpDate otherDate:[NSDate date]]) {
            model.today = true;
        }
        model.dateKey = [NSDate getDateString:tmpDate with:@""];
        model.month = [NSDate month:tmpDate];
        model.year = [NSDate year:tmpDate];
        model.day = [NSDate day:tmpDate];
        model.date = tmpDate;
//        model.select = arc4random_uniform(2);
//        model.happenEvent = arc4random_uniform(2);
        [_dayModels addObject:model];
    }
    [_daysContentView reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_daysSource && [_daysSource respondsToSelector:@selector(calendar:cellForItemAtDate:cellState:indexPath:)]) {
        return [_daysSource calendar:collectionView cellForItemAtDate:[NSDate date] cellState:@"" indexPath:indexPath];
    } else {
        CTDayCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CTDayCellID forIndexPath:indexPath];
        cell.dayLab.text = [NSString stringWithFormat:@"%zi", _dayModels[indexPath.row].day];
        
        if (!_dayModels[indexPath.row].inThisMonth) {
            cell.dayLab.textColor = _appearance.otherMonthColor;
        } else {
            cell.dayLab.textColor = _appearance.dayColor;
        }
        
        if (_dayModels[indexPath.row].today) {
            cell.dayLab.backgroundColor = _appearance.todayBGColor;
        } else {
            cell.dayLab.backgroundColor = [UIColor clearColor];
        }
        if (_dayModels[indexPath.row].select) {
            cell.dayLab.layer.borderColor = [UIColor blueColor].CGColor;
        } else {
            cell.dayLab.layer.borderColor = [UIColor clearColor].CGColor;
        }
        
        return cell;
    }
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    _dayModels[indexPath.row].select = !_dayModels[indexPath.row].select;
    [collectionView reloadItemsAtIndexPaths:@[indexPath]];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return [NSDate daysCountInMonth:[NSDate date]];
    return 42;
}


//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    if (kind == UICollectionElementKindSectionHeader) {
//        CTCalendarWeekView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CTCalendarWeekViewID forIndexPath:indexPath];
//        return headerView;
//    }
//    return nil;
//}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//    if (section == 0) {
//        return CGSizeMake(self.bounds.size.width, 40);
//    }
//    return CGSizeZero;
//}

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 7;
//}
@end

