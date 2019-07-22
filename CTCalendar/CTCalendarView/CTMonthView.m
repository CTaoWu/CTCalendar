//
//  CTMonthView.m
//  CTCalendarView
//
//  Created by 吴传涛 on 2019/7/18.
//  Copyright © 2019 涛. All rights reserved.
//

#import "CTMonthView.h"
#import "CTCalendarFlowLayout.h"

#import "CTMonthCell.h"
#import "CTDayCell.h"
#import "CTCalanderFile.h"

@interface CTMonthView()<UICollectionViewDelegate, UICollectionViewDataSource, CTCalanderDayProtocols>

@property (weak, nonatomic) CTMonthCell * superCell;

@property (strong, nonatomic) NSMutableArray * dateArray;

@end
@implementation CTMonthView

static NSString * CTMonthCellID = @"CTMonthCellID";
static NSString * TMPCTDayCellID = @"TMPCTDayCellID";

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[CTMonthCell class] forCellWithReuseIdentifier:CTMonthCellID];
        [self registerClass:[CTDayCell class] forCellWithReuseIdentifier:TMPCTDayCellID];
        
        _dateArray = [[NSMutableArray alloc] init];
        _dateArray = [[CTDateManager shareManager] getSomeMonths];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dateArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CTMonthCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CTMonthCellID forIndexPath:indexPath];
//    cell.daysSource = self;
    cell.monthKey = _dateArray[indexPath.row];
    _superCell = cell;
    return cell;
}

- (CTDayCell *)calendar:(UICollectionView *)daysContentView cellForItemAtDate:(NSDate *)date cellState:(NSString *)cellState indexPath:(NSIndexPath *)indexPath {
    if (_monthSource && [_monthSource respondsToSelector:@selector(calendar:cellForItemAtDate:cellState:indexPath:)]) {
        return [_monthSource calendar:daysContentView cellForItemAtDate:[NSDate date] cellState:@"test" indexPath:indexPath];
    }
    else {
        CTDayCell * cell = [self dequeueReusableCellWithReuseIdentifier:TMPCTDayCellID forIndexPath:indexPath];
        cell.dayLab.text = [NSString stringWithFormat:@"%zi", indexPath.row];
        return cell;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

- (void)tableViewContentOffsetY:(CGFloat)tableViewContentOffsetY {
//    CGRect frame = self.frame;
//    frame.origin.y -= tableViewContentOffsetY;
//    self.frame = frame;
//    _superCell.backgroundColor = RandomColor;
    
    NSLog(@"%f",tableViewContentOffsetY);
}

#pragma - mark ======= 操作 =======
- (void)nextPage {
    if (self.contentOffset.x + self.bounds.size.width <= self.contentSize.width) {
        [self setContentOffset:CGPointMake(self.contentOffset.x + self.bounds.size.width, 0) animated:true];
//        [self scrollRectToVisible:CGRectMake(self.contentOffset.x + self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height) animated:true];

    }
}

- (void)lastPage {
    if (self.contentOffset.x - self.bounds.size.width >= 0) {
        [self setContentOffset:CGPointMake(self.contentOffset.x - self.bounds.size.width, 0) animated:true];
//        [self scrollRectToVisible:CGRectMake(self.contentOffset.x - self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height) animated:true];
    }
}

@end
