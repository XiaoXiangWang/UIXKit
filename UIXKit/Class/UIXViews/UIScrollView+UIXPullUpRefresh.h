//
//  UIScrollView+UIXPullUpRefresh.h
//  UIXKit
//
//  Created by WangXiaoXiang on 14/12/31.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIXPullUpRefreshView;
@interface UIScrollView (UIXPullUpRefresh)
/**
 *  上拉加载
 */
@property (nonatomic,strong,readonly) UIXPullUpRefreshView* pullUpRefreshView;
/**
 *  是否显示默认YES
 */
@property (nonatomic,assign) BOOL showsPullUpToRefresh;

@end
