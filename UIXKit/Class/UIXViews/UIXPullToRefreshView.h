//
//  UIXPullToRefreshView.h
//  UIXKit
//
//  Created by WangXiaoXiang on 14/12/31.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  刷新控件状态
 */
typedef NS_ENUM(NSInteger, UIXPullToRefreshState){
    /**
     *  已经停止（静止）
     */
    UIXPullToRefreshStateStopped = 0,
    /**
     *  已经出发
     */
    UIXPullToRefreshStateTriggered,
    /**
     *  正在刷新
     */
    UIXPullToRefreshStateLoading,
    /**
     *  所有状态
     */
    UIXPullToRefreshStateAll = 0x7FFFFFFF
};
@interface UIXPullToRefreshView : UIView

/**
 *  状态
 */
@property(nonatomic,assign) UIXPullToRefreshState state;
/**
 *  滑动视图
 */
@property (nonatomic, weak) UIScrollView *scrollView;

- (void)setScrollViewContentInset:(UIEdgeInsets)contentInset ;
- (void)resetScrollViewContentInset;
- (void)setScrollViewContentInsetForLoading;
@end
