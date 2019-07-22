//
//  CTCalendarDaysLayout.m
//  CTCalendar
//
//  Created by GodCoder on 2019/7/19.
//  Copyright © 2019 CTCalendar. All rights reserved.
//

#import "CTCalendarDaysLayout.h"

@implementation CTCalendarDaysLayout
//- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
//    
//    NSArray * layoutattributes = [super layoutAttributesForElementsInRect:rect];
//    
//    for (int i = 0; i < layoutattributes.count; i++) {
//        UICollectionViewLayoutAttributes * attribute = layoutattributes[i];
//        CGFloat collectionViewY = self.collectionView.contentOffset.y;
//        if (collectionViewY > 0) {
//            break;
//        }
//        CGFloat width = self.collectionView.frame.size.width;
//        /* 偏移多少,就给他高度设置多少 */
//        CGFloat height = attribute.frame.size.height - collectionViewY;
//        attribute.frame = CGRectMake(0, collectionViewY, width, height);
//    }
//    return layoutattributes;
//}
//
//- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
//    return YES;
//}
@end
