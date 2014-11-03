//
//  UIXRefreshCircleProgressView.h
//  UIXRefreshControl
//
//  Created by WangXiaoXiang on 14/10/23.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXCircleProgressView.h"
#import "UIXKitDefines.h"

@interface UIXRefreshCircleProgressView : UIXCircleProgressView
/*
 * 基数最大1,最小0.默认为1
 */
@property(nonatomic,assign) CGFloat baseNumber;

@property(nonatomic,assign,getter=isRotating) BOOL rotating;


/*开始旋转动画*/
- (void)beginRotatingAnimation;

/*结束旋转动画*/
- (void)endRotatingAnimation;

@end
