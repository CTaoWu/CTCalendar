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
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CTMonthCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CTMonthCellID forIndexPath:indexPath];
//    cell.daysSource = self;
    [cell.daysContentView reloadData];
    return cell;
}

- (CTDayCell *)calendar:(UICollectionView *)daysContentView cellForItemAtDate:(NSDate *)date cellState:(NSString *)cellState indexPath:(NSIndexPath *)indexPath {
    if (_monthSource && [_monthSource respondsToSelector:@selector(calendar:cellForItemAtDate:cellState:indexPath:)]) {
        return [_monthSource calendar:daysContentView cellForItemAtDate:[NSDate date] cellState:@"test" indexPath:indexPath];
    }
    else {
        return [self dequeueReusableCellWithReuseIdentifier:TMPCTDayCellID forIndexPath:indexPath];
    }
}
@end
