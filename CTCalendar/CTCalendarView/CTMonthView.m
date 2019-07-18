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
#import "CTCalanderFile.h"

@interface CTMonthView()<UICollectionViewDelegate, UICollectionViewDataSource>

@end
@implementation CTMonthView

static NSString * CTMonthCellID = @"CTMonthCellID";

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {        
        CTCalendarFlowLayout * layout = [[CTCalendarFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(CGRectGetWidth(frame), CGRectGetHeight(frame));
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        
        _monthView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
        _monthView.pagingEnabled = true;
        _monthView.delegate = self;
        _monthView.dataSource = self;

        [_monthView registerClass:[CTMonthCell class] forCellWithReuseIdentifier:CTMonthCellID];
        [self addSubview:_monthView];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CTMonthCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CTMonthCellID forIndexPath:indexPath];
    cell.backgroundColor = RandomColor;
    [cell.daysContentView reloadData];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

@end
