//
//  UIXPullDownRefreshView.m
//  UIXKit
//
//  Created by WangXiaoXiang on 14/12/31.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXPullDownRefreshView.h"
#import "UIXRefreshIndicatorView.h"

@interface UIXPullDownRefreshView()
/**
 *  刷新指示器
 */
@property(nonatomic,weak) UIXRefreshIndicatorView* refreshIndicatorView;
/**
 *  文本标签
 */
@property(nonatomic,weak) UILabel*  textLabel;
/**
 *  时间标签
 */
@property(nonatomic,weak) UILabel*  timeLabel;
@end

@implementation UIXPullDownRefreshView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setup];
    }
    return self;
}
-(void)_setup{
    self.state = -1;
    [self _initSubViews];
}

-(void)_initSubViews{
    self.backgroundColor = [UIColor whiteColor];
    
    UIXRefreshIndicatorView* refreshIndicatorView = [[UIXRefreshIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    refreshIndicatorView.baseNumber = 0.95f;
    [self addSubview:refreshIndicatorView];
    self.refreshIndicatorView = refreshIndicatorView;
    
    UILabel* textLabel = [UILabel new];
    textLabel.font = [UIFont systemFontOfSize:15];
    textLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:textLabel];
    self.textLabel = textLabel;
    
    UILabel* timeLabel = [UILabel new];
    timeLabel.font = [UIFont systemFontOfSize:10];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:timeLabel];
    self.timeLabel = timeLabel;
    
    //AutoLayout
    textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    refreshIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[textLabel(width)]"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:@{@"width":@(140)}
                                                                   views:NSDictionaryOfVariableBindings(textLabel)]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[timeLabel(width)]"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:@{@"width":@(140)}
                                                                   views:NSDictionaryOfVariableBindings(timeLabel)]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-13-[textLabel]-5-[timeLabel]-8-|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(textLabel,timeLabel)]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:textLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:timeLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[refreshIndicatorView(20)]-8-[textLabel]"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(refreshIndicatorView,textLabel)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[refreshIndicatorView(20)]"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(refreshIndicatorView)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:refreshIndicatorView
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
}
#pragma mark - Scroll View

#pragma mark - Setter
-(void)setState:(UIXPullToRefreshState)newState{
    if (self.state == newState) {
        return;
    }
    switch (newState) {
        case UIXPullToRefreshStateStopped:
            self.textLabel.text = NSLocalizedString(@"Pull to refresh...",);
            break;
        case UIXPullToRefreshStateTriggered:
            self.textLabel.text = NSLocalizedString(@"Release to refresh...",);
            break;
        case UIXPullToRefreshStateLoading:
            self.textLabel.text = NSLocalizedString(@"Loading...",);
            break;
        case UIXPullToRefreshStateAll:
            break;
        default:
            break;
    }
}
@end
