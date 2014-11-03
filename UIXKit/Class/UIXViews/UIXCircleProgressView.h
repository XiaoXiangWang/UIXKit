//
//  UIXActivityIndicatorView.h
//  UIXRefreshControl
//
//  Created by WangXiaoXiang on 14/10/22.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIXAbstractProgressView.h"
@interface UIXCircleProgressView : UIXAbstractProgressView

/*
 * 线条宽度,默认 2.0
 */
@property(nonatomic,assign) CGFloat lineWidth UI_APPEARANCE_SELECTOR;

/*
 * 边框宽度,默认 0
 */
@property(nonatomic,assign) CGFloat borderWidth UI_APPEARANCE_SELECTOR;

/**
 *  @Author wangxiaoxiang.cn@iCloud.com
 *
 *  @brief  线的颜色，默认[UIColor redColor]
 */
@property(nonatomic,copy) UIColor* lineColor UI_APPEARANCE_SELECTOR;

/**
 *  @Author wangxiaoxiang.cn@iCloud.com
 *
 *  @brief  边框的颜色，默认[UIColor redColor]
 */
@property(nonatomic,copy) UIColor* borderColor UI_APPEARANCE_SELECTOR;





@end