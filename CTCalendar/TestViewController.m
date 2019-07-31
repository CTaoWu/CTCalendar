//
//  TestViewController.m
//  CTCalendar
//
//  Created by GodCoder on 2019/7/29.
//  Copyright © 2019 CTCalendar. All rights reserved.
//

#import "TestViewController.h"
#import "CTCalendarFlowLayout.h"
#import "TestCollectionViewCell.h"
#import "CTCalanderFile.h"

@interface TestViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView * tableView;

@property (strong, nonatomic)  UICollectionView * cView;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 300;
//    [self.view addSubview:_tableView];
    
    
    CTCalendarFlowLayout * layout = [CTCalendarFlowLayout new];
//    layout.itemSize = CGSizeMake(ScreenWidth - 20, ScreenHeight/2);
    layout.minimumLineSpacing = 50;
    layout.minimumInteritemSpacing = 5;
    
    _cView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 80, UIScreen.mainScreen.bounds.size.width, ScreenHeight) collectionViewLayout:layout];
    _cView.delegate = self;
    _cView.dataSource = self;
    _cView.backgroundColor = UIColor.whiteColor;
    [_cView registerNib:[UINib nibWithNibName:@"TestCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"TestCollectionViewCellID"];
    [self.view addSubview:_cView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    for (UIView * view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    if (indexPath.row == 0) {
        [cell.contentView addSubview:_cView];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TestCollectionViewCellID" forIndexPath:indexPath];
    cell.testLab.text = [NSString stringWithFormat:@"%zi",indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 20;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat collectionViewY = scrollView.contentOffset.y;
    if (collectionViewY < 0) {
//        TestCollectionViewCell *cell = [_cView dequeueReusableCellWithReuseIdentifier:@"TestCollectionViewCellID" forIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
//        CGFloat height = cell.contentView.frame.size.height;
//        height = height - collectionViewY;
//        CGRect rect = CGRectMake(cell.contentView.frame.origin.x, cell.contentView.frame.origin.y, cell.contentView.frame.size.width, height);
//        cell.contentView.frame = rect;
//        [_cView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]]];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return CGSizeMake(ScreenHeight/7, ScreenHeight/7);
    return CGSizeMake((ScreenWidth - 5*7)/7, (ScreenWidth - 5*7)/7);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 50, 0);
}

@end
