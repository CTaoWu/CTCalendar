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

@interface ViewController ()<CTCalanderMonthProtocols, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView * tableView;
@property (strong, nonatomic) CTMonthView * monthView;
@property (strong, nonatomic) CTCalendarFlowLayout * layout;

@property (assign, nonatomic) CGFloat tableViewContentOffsetY;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * lastBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [lastBtn addTarget:self action:@selector(lastAction) forControlEvents:UIControlEventTouchUpInside];
    [lastBtn setTitle:@"上个月" forState:UIControlStateNormal];
    lastBtn.frame = CGRectMake(50, 80, 80, 40);
    [self.view addSubview:lastBtn];
    
    UIButton * next = [UIButton buttonWithType:UIButtonTypeSystem];
    [next addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    [next setTitle:@"下个月" forState:UIControlStateNormal];
    next.frame = CGRectMake(200, 80, 80, 40);
    [self.view addSubview:next];
    
    _layout = [[CTCalendarFlowLayout alloc] init];
    _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _layout.itemSize = CGSizeMake(ScreenWidth, 550);
    _layout.minimumInteritemSpacing = 0;
    _layout.minimumLineSpacing = 0;
    
    _monthView = [[CTMonthView alloc] initWithFrame:CGRectMake(0, 150, ScreenWidth, 550) collectionViewLayout:_layout];
    _monthView.pagingEnabled = true;
    _monthView.bounces = true;
    _monthView.monthSource = self;
    [_monthView registerNib:[UINib nibWithNibName:@"DayCell" bundle:nil] forCellWithReuseIdentifier:@"DayCellID"];
    [self.view addSubview:_monthView];

//    [self setTableView];
}

- (void)lastAction {
    [_monthView lastPage];
}

- (void)nextAction {
    [_monthView nextPage];
}

- (void)setTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
//    _tableView.bounces = false;
//    _tableView.rowHeight = 400;
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"tableViewCell"];
    }
    for (UIView * view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    if (indexPath.row == 0) {
        [cell.contentView addSubview:_monthView];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 400 - _tableViewContentOffsetY;
    }
    return 400;
}

- (CTDayCell *)calendar:(UICollectionView *)monthCell cellForItemAtDate:(NSDate *)date cellState:(NSString *)cellState indexPath:(NSIndexPath *)indexPath {

    [monthCell registerClass:[DayCell class] forCellWithReuseIdentifier:@"DayCell"];
    DayCell * cell = [monthCell dequeueReusableCellWithReuseIdentifier:@"DayCell" forIndexPath:indexPath];
    cell.dayLab.text = [NSString stringWithFormat:@"%zi",indexPath.row];
    return cell;
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (scrollView == _tableView) {
//        if (scrollView.contentOffset.y < -44) {
//            _tableViewContentOffsetY = scrollView.contentOffset.y + 44;
//            _monthView.frame = CGRectMake(0, 0, ScreenWidth, -_tableViewContentOffsetY+400);
////            _layout.itemSize = CGSizeMake(ScreenWidth, -_tableViewContentOffsetY+400);
////            _layout.itemSize = CGSizeMake(ScreenWidth, -_tableViewContentOffsetY+400);
//        }
//        else {
//            _monthView.frame = CGRectMake(0, 0, ScreenWidth, 400);
//            _layout.itemSize = CGSizeMake(ScreenWidth, 400);
//        }
////        [_monthView tableViewContentOffsetY:scrollView.contentOffset.y];
//    }
//}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    if (scrollView == _tableView) {
//        NSLog(@">>>>>%f",scrollView.contentOffset.y);
//    }
//}
@end
