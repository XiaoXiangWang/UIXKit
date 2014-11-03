//
//  UIXAbstractProgressView.h
//  UIXTest
//
//  Created by WangXiaoXiang on 14/11/3.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIXKitDefines.h"
#define UIXCircleProgressMaxValue 1
#define UIXCircleProgressMinValue 0

typedef void(^UIXProgressAnimationStop)(CGFloat progress);

@interface UIXAbstractProgressView : UIView


/**
 *  @Author wangxiaoxiang.cn@iCloud.com
 *
 *  @brief  进度 min(0.0),max(1.0)
 */
@property(nonatomic,assign) CGFloat progress;

/**
 *  @Author wangxiaoxiang.cn@iCloud.com
 *
 *  @brief  动画的持续时间默认0.3f
 */
@property(nonatomic,assign) CFTimeInterval animationDuration;

/*
 * @brief 设置进度
 *
 * @Param progress 进度 min(0.0),max(1.0)
 * @Param animated 动画
 */
- (void)setProgress:(float)progress animated:(BOOL)animated;


/**
 *  @Author wangxiaoxiang.cn@iCloud.com
 *
 *  @brief  动画停止时调用此block
 */
@property(nonatomic,strong) UIXProgressAnimationStop progressAnimationStop;

@end
