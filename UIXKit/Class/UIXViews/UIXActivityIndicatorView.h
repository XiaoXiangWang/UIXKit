//
//  UIXActivityIndicatorView.h
//  UIXTest
//  此版本这个视图的bug比较多不建议使用
//  Created by WangXiaoXiang on 14/10/27.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIXKitDefines.h"

@interface UIXActivityIndicatorView : UIView

@property(nonatomic,assign,getter=isHidesWhenStopped) BOOL  hidesWhenStopped;

- (void)startAnimating;

- (void)stopAnimating;

- (BOOL)isAnimating;
@end
