//
//  CTMonthCell.m
//  CTCalendarView
//
//  Created by 吴传涛 on 2019/7/18.
//  Copyright © 2019 涛. All rights reserved.
//

#import "CTMonthCell.h"

#import "CTDayCell.h"
#import "CTCalendarFlowLayout.h"

#import "CTCalanderFile.h"

@interface CTMonthCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@end
@implementation CTMonthCell

static NSString * CTDayCellID = @"CTDayCellIDID";

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        CTCalendarFlowLayout * layout = [[CTCalendarFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake(CGRectGetWidth(self.frame)/7, CGRectGetHeight(self.frame)/7);
        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing = 10;
        
        _daysContentView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) collectionViewLayout:layout];
        _daysContentView.pagingEnabled = true;
        _daysContentView.delegate = self;
        _daysContentView.dataSource = self;
        
        [_daysContentView registerClass:[CTDayCell class] forCellWithReuseIdentifier:CTDayCellID];
        [self addSubview:_daysContentView];
    }
    return self;
}

- (void)setItemContent {
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_daysSource && [_daysSource respondsToSelector:@selector(calendar:cellForItemAtDate:cellState:indexPath:)]) {
        return [_daysSource calendar:collectionView cellForItemAtDate:[NSDate date] cellState:@"" indexPath:indexPath];
    } else {
        CTDayCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CTDayCellID forIndexPath:indexPath];
        cell.dayLab.text = [NSString stringWithFormat:@"%zi", indexPath.row];
        cell.backgroundColor = RandomColor;
        return cell;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [NSDate daysCountInMonth:[NSDate date]];
}

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 7;
//}
@end

