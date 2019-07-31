//
//  CTCalendarFlowLAyout.m
//  CTCalendarView
//
//  Created by 吴传涛 on 2019/7/18.
//  Copyright © 2019 涛. All rights reserved.
//

#import "CTCalendarFlowLayout.h"
#import "CTCalanderFile.h"

@interface CTCalendarFlowLayout()

@property (assign, nonatomic) BOOL scale;

@end
@implementation CTCalendarFlowLayout

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray * layoutattributes = [super layoutAttributesForElementsInRect:rect];
    for (int i = 0; i < layoutattributes.count; i++) {
        UICollectionViewLayoutAttributes * attribute = layoutattributes[i];
        //attribute.representedElementKind == UICollectionElementKindSectionHeader &&
        CGFloat collectionViewY = self.collectionView.contentOffset.y;
        if (collectionViewY > 0) {
            break;
        }
//        if (collectionViewY < -50) {
//            _scale = true;
//        }
//        if (_scale) {
//            attribute.frame = CGRectMake(attribute.frame.origin.x, attribute.frame.origin.y, attribute.frame.size.width, attribute.frame.size.height * 2);
//        } else {
//            attribute.frame = CGRectMake(attribute.frame.origin.x, attribute.frame.origin.y, attribute.frame.size.width, attribute.frame.size.height);
//        }
        
        if (attribute.indexPath.section == 0) {
            /* 偏移多少,就给他高度设置多少 */
            CGFloat height = attribute.frame.size.height - collectionViewY;

            attribute.frame = CGRectMake(attribute.frame.origin.x, collectionViewY - attribute.frame.origin.y, attribute.frame.size.width, height);
//            attribute.frame = CGRectMake(attribute.frame.origin.x, attribute.frame.origin.y, attribute.frame.size.width, height);
        }
        else {
            /* 偏移多少,就给他高度设置多少 */
            CGFloat height = attribute.frame.size.height - collectionViewY;
            attribute.frame = CGRectMake(attribute.frame.origin.x, attribute.frame.origin.y - collectionViewY * (attribute.indexPath.section-1), attribute.frame.size.width, height);
            if (attribute.indexPath.section == 1) {
                
            }
        }
    }
    return layoutattributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
