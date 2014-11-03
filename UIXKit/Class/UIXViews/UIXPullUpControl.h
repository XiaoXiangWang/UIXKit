//
//  UIXPullUpControl.h
//  UIXTest
//
//  Created by WangXiaoXiang on 14/10/29.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXAbstractRefreshControl.h"


@protocol UIXPullUpControlDelegate <NSObject>

-(NSUInteger)numberOfMaxPagesInPullUpControl;

-(NSUInteger)numberOfCurrentPageInPullUpControl;

@end

@interface UIXPullUpControl : UIXAbstractRefreshControl

-(instancetype)initWithscrollView:(UIScrollView *)scrollView delegate:(id<UIXPullUpControlDelegate>)delegate;

@property(nonatomic,weak) id<UIXPullUpControlDelegate> delegate;

@end
