//
//  UIXRefreshCircleProgressView.m
//  UIXRefreshControl
//
//  Created by WangXiaoXiang on 14/10/23.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXRefreshIndicatorView.h"
#import "UIView+Animation.h"

NSString * const UIXProgressViewRotatingAnimationKey = @"UIXProgressViewRotatingAnimationKey";

@interface UIXRefreshIndicatorView ()

@end

@implementation UIXRefreshIndicatorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.baseNumber = 1;
        //BUG_FIX: 动画进入后台时消失。
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(_applicationWillEnterForeground:)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
    }
    return self;
}
-(void)_applicationWillEnterForeground:(NSNotification*)notification{
    if (self.isRotating) {
        [self beginRotatingAnimation];
    }
}
-(void)setProgress:(float)progress animated:(BOOL)animated{
    progress = progress*self.baseNumber;
    [super setProgress:progress animated:animated];
}


#pragma mark - animation
-(void)beginRotatingAnimation{
    self.rotating = YES;
    [self rotate360WithRepeatCount:MAXFLOAT];
}

-(void)endRotatingAnimation{
    self.rotating = NO;
    [self removeRotate360Animation];
    
}
@end
