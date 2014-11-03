//
//  UIXCollectionViewFlowLayout.m
//  UIXRefreshControl
//
//  Created by WangXiaoXiang on 14/10/27.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXCollectionViewFlowLayout.h"

@implementation UIXCollectionViewFlowLayout
-(instancetype)init{
    if (self = [super init]) {
        self.itemSize = (CGSize){50.0f,50.0f};
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return self;
}
@end
