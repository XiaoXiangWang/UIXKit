//
//  UIView+Animation.m
//  UIXRefreshControl
//
//  Created by WangXiaoXiang on 14/10/23.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIView+Animation.h"


NSString* const kUIViewAnimationRotate360 = @"com.NeXT.UIViewAnimation.Rotate360";


@implementation UIView (Animation)

-(void)rotate360WithRepeatCount:(CGFloat)aRepeatCount{
    [self rotate360WithDuration:0.7f
                    repeatCount:aRepeatCount
            mediaTimingFunction:UIMediaTimingFunctionLinear
                      clockwise:YES];
}

-(void)rotate360WithDuration:(CGFloat)aDuration
                 repeatCount:(CGFloat)aRepeatCount
         mediaTimingFunction:(UIMediaTimingFunction)mediaTimingFunction
                   clockwise:(BOOL)clockwise;
{
    [self removeRotate360Animation];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:KTransformRotationZ];
    animation.fromValue = @(0);
    animation.toValue = clockwise?@(2*M_PI):@(-2*M_PI);
    animation.duration = aDuration;
    animation.repeatCount = aRepeatCount;
    animation.timingFunction = [self timingFunctionsWithAnimationCurve:mediaTimingFunction];
    
    [self.layer addAnimation:animation forKey:kUIViewAnimationRotate360];
}

-(CAMediaTimingFunction *)timingFunctionsWithAnimationCurve:(UIMediaTimingFunction)aMediaTimingFunction{
    CAMediaTimingFunction* mediaTimingFunction = nil;
    switch (aMediaTimingFunction) {
        case UIMediaTimingFunctionEaseIn:
            mediaTimingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            break;
        case UIMediaTimingFunctionEaseOut:
            mediaTimingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            break;
        case UIMediaTimingFunctionEaseInEaseOut:
            mediaTimingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            break;
        case UIMediaTimingFunctionLinear:
            mediaTimingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            break;
        case UIMediaTimingFunctionDefault:
            mediaTimingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
            break;
        default:
            mediaTimingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
            break;
    }
    return mediaTimingFunction;
}

-(void)removeRotate360Animation{
    [self.layer removeAnimationForKey:kUIViewAnimationRotate360];
}

@end
