//
//  UIXAbstractRefreshControl.h
//  UIXKit
//
//  Created by WangXiaoXiang on 14/10/29.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIXKitDefines.h"
/*刷新状态*/
typedef NS_ENUM(NSUInteger, UIXRefreshState) {
    /*状态-无*/
    UIXRefreshStateNormal = 0,
    /*状态-下拉中*/
    UIXRefreshStatePulling,
    /*状态-准备刷新*/
    UIXRefreshStateReadyToRefresh,
    /*状态-刷新中*/
    UIXRefreshStateRefreshing,
    /*状态-刷新完成*/
    UIXRefreshStateFinish,
};

/*
 *  这是一个抽象类，没有实际的用途，不要直接初始化。
 */
@interface UIXAbstractRefreshControl : UIControl
/**
 *  @Author wangxiaoxiang.cn@iCloud.com
 *
 *  @brief  初始化方法
 *
 *  @param frame      坐标大小
 *  @param scrollView 滚动视图
 *
 *  @return UIXAbstractRefreshControl对象
 */
-(instancetype)initWithFrame:(CGRect)frame scrollView:(UIScrollView*)scrollView;
/**
 *  @Author wangxiaoxiang.cn@iCloud.com
 *
 *  @brief 滚动视图
 */
@property (nonatomic,weak) UIScrollView* scrollView;
/**
 *  @Author wangxiaoxiang.cn@iCloud.com
 *
 *  @brief  滚动视图的原始边距
 */
@property (nonatomic, assign) UIEdgeInsets originalContentInset;
/**
 *  @Author wangxiaoxiang.cn@iCloud.com
 *
 *  @brief  如果是'YES'忽略滚动视图的contentInset改变。如果是'NO'滚动视图的contentInset变化，self.originalContentInset改变。
 */
@property (nonatomic, assign) BOOL ignoreContentInsetChange;

/**
 *  @Author wangxiaoxiang.cn@iCloud.com
 *
 *  @brief  状态
 */
@property(nonatomic,assign) UIXRefreshState refreshState;

-(void)removeScrollViewAllObserver;

#pragma mark - SubClass override function(子类需要重写的方法)
/**
 *  @Author wangxiaoxiang.cn@iCloud.com
 *
 *  @brief  开始刷新
 */
- (void)beginRefreshing;

/**
 *  @Author wangxiaoxiang.cn@iCloud.com
 *
 *  @brief  结束刷新
 */
- (void)endRefreshing;

/**
 *  @Author wangxiaoxiang.cn@iCloud.com
 *
 *  @brief contentInset发生改变
 *
 *  @param contentInset 内容边距
 */
- (void)scrollViewChangedContentInset:(UIEdgeInsets)newContentInset;

/**
 *  @Author wangxiaoxiang.cn@iCloud.com
 *
 *  @brief  contentOffset发生改变
 *
 *  @param contentOffset offset改变
 */
- (void)scrollViewChangedContentOffset:(CGPoint)newContentOffset;

/**
 *  @Author wangxiaoxiang.cn@iCloud.com
 *
 *  @brief contentSize发生改变
 *
 *  @param contentSize contentSize
 */
- (void)scrollViewChangedContentSize:(CGSize)contentSize;

/**
 *  @Author wangxiaoxiang.cn@iCloud.com
 *
 *  @brief  对应状态的标题
 *
 *  @param state 刷新状态
 *
 *  @return 标题字符串
 */
- (NSString*)stringWithState:(UIXRefreshState)state;
@end
