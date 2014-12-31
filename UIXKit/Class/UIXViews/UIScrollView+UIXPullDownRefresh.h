//
//  UIScrollView+UIXPullDownRefresh.h
//  UIXKit
//
//  Created by WangXiaoXiang on 14/12/31.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIXPullDownRefreshView;
@interface UIScrollView (UIXPullDownRefresh)
/**
 *  下拉刷新
 */
@property (nonatomic,strong,readonly) UIXPullDownRefreshView* pullDownRefreshView;
/**
 *  是否显示默认YES
 */
@property (nonatomic,assign) BOOL showsPullDownToRefresh;

@end
