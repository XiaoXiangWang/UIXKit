//
//  UIXPullToRefreshView.m
//  UIXKit
//
//  Created by WangXiaoXiang on 14/12/31.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXPullToRefreshView.h"

@implementation UIXPullToRefreshView
- (void)setScrollViewContentInset:(UIEdgeInsets)contentInset {
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.scrollView.contentInset = contentInset;
                     }
                     completion:NULL];
}
@end
