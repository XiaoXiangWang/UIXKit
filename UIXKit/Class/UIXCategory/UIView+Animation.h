//
//  UIView+Animation.h
//  UIXRefreshControl
//
//  Created by WangXiaoXiang on 14/10/23.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIXKitDefines.h"


UIKIT_EXTERN NSString* const kUIViewAnimationRotate360;


typedef NS_ENUM(NSUInteger, UIMediaTimingFunction) {
    UIMediaTimingFunctionLinear,
    UIMediaTimingFunctionEaseIn,
    UIMediaTimingFunctionEaseOut,
    UIMediaTimingFunctionEaseInEaseOut,
    UIMediaTimingFunctionDefault
};

@interface UIView (Animation)

-(void)rotate360WithDuration:(CGFloat)aDuration
                 repeatCount:(CGFloat)aRepeatCount
         mediaTimingFunction:(UIMediaTimingFunction)mediaTimingFunction
                   clockwise:(BOOL)clockwise;

-(void)rotate360WithRepeatCount:(CGFloat)aRepeatCount;

-(void)removeRotate360Animation;


@end
