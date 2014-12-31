//
//  UIXPullDownControl.m
//  UIXTest
//
//  Created by WangXiaoXiang on 14/10/29.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXPullDownControl.h"
#import "UIXRefreshIndicatorView.h"

static const CGFloat UIXPullDownControlHeight = 300.0f;
static const CGFloat UIXPullDownControlTriggerStartOffsetY = 5.0f;
static const CGFloat UIXPullDownControlTriggerEndOffsetY = 65;
static const CGFloat UIXPullDownContentHeight = 50.0f;


#define UIXPullDownControlFrame CGRectMake(0,-(UIXPullDownControlHeight),CGRectGetWidth(scrollView.bounds),UIXPullDownControlHeight)
#pragma mark - UIXPullDownView interface
@interface UIXPullDownView : UIView

@property (nonatomic,strong) UIXRefreshIndicatorView* progressView;

@property (nonatomic,strong) UILabel* textLabel;

@property (nonatomic,strong) UILabel* timeLabel;

@end

#pragma mark - UIXPullDownView implementation
@implementation UIXPullDownView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self _setup];
    }
    return self;
    
}

-(void)_setup{
    self.backgroundColor = [UIColor whiteColor];
    
    UIXRefreshIndicatorView* progressView = [[UIXRefreshIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    progressView.baseNumber = 0.95f;
    [self addSubview:progressView];
    self.progressView = progressView;
    
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
    textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    progressView.translatesAutoresizingMaskIntoConstraints = NO;
    //AutoLayout
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
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[progressView(20)]-8-[textLabel]"
                                                                options:NSLayoutFormatDirectionLeadingToTrailing
                                                                metrics:nil
                                                                  views:NSDictionaryOfVariableBindings(progressView,textLabel)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[progressView(20)]"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(progressView)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:progressView
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
    
}

@end
#pragma mark - UIXPullDownControl interface

@interface UIXPullDownControl ()

@property(nonatomic,weak) UIXPullDownView* pullDownView;

@end


#pragma mark - UIXPullDownControl implementation
@implementation UIXPullDownControl

-(instancetype)initWithscrollView:(UIScrollView *)scrollView{
    self = [super initWithFrame:UIXPullDownControlFrame scrollView:scrollView];
    if (self) {
        [self _setup];
    }
    return self;
}

-(void)_setup{
    self.backgroundColor = [UIColor whiteColor];
    UIXPullDownView* pullDownView = [UIXPullDownView new];
    [self addSubview:pullDownView];
    self.pullDownView = pullDownView;
    pullDownView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leading-[pullDownView]-trailing-|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:@{@"leading":@(0),@"trailing":@(0)}
                                                                   views:NSDictionaryOfVariableBindings(pullDownView)]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[pullDownView(height)]-trailing-|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:@{@"trailing":@(0),@"height":@(UIXPullDownContentHeight)}
                                                                   views:NSDictionaryOfVariableBindings(pullDownView)]];
}




#pragma mark - Refresh state
-(void)setRefreshState:(UIXRefreshState)refreshState{
    self.hidden = NO;
    switch (refreshState) {
        case UIXRefreshStateNormal:
            self.hidden = YES;
            break;
        case UIXRefreshStatePulling:
            break;
        case UIXRefreshStateReadyToRefresh:
            break;
        case UIXRefreshStateRefreshing:
            [self sendActionsForControlEvents:UIControlEventValueChanged];
            break;
        case UIXRefreshStateFinish:
            break;
        default:
            break;
    }
    self.pullDownView.textLabel.text = [self stringWithState:refreshState];
    [super setRefreshState:refreshState];
}

-(void)scrollViewChangedContentOffset:(CGPoint)newContentOffset{
    if (self.enabled && self.refreshState <= UIXRefreshStateReadyToRefresh) {
        if(self.scrollView.isDecelerating && self.refreshState == UIXRefreshStateReadyToRefresh){
            [self beginRefreshing];
            return;
        }
        if (self.scrollView.isDragging){
            CGFloat offset = self.scrollView.contentOffset.y + self.scrollView.contentInset.top;
            if (offset <= 0) {
                CGFloat progress =(abs(offset)-UIXPullDownControlTriggerStartOffsetY) / UIXPullDownControlTriggerEndOffsetY;
                progress = MAX(MIN(progress, UIXCircleProgressMaxValue), UIXCircleProgressMinValue);
                //                NSLog(@"progress:%.2f",progress);
                self.pullDownView.progressView.progress = progress;
                if (progress == 0) {
                    self.refreshState = UIXRefreshStateNormal;
                }else if(progress>0 && progress < 1.0){
                    self.refreshState = UIXRefreshStatePulling;
                }else if(progress == 1.0){
                    self.refreshState = UIXRefreshStateReadyToRefresh;
                }
            }
        }
        
    }
}
-(void)scrollViewChangedContentInset:(UIEdgeInsets)newContentInset{
    if (self.ignoreContentInsetChange) {
        self.ignoreContentInsetChange = NO;
    }else{
        if (self.refreshState >= UIXRefreshStateRefreshing) {
            newContentInset = UIEdgeInsetsMake(newContentInset.top -  UIXPullDownContentHeight, newContentInset.left, newContentInset.bottom, newContentInset.right);
        }
        self.originalContentInset = newContentInset;
        
    }
}

-(NSString *)stringWithState:(UIXRefreshState)state{
    NSString* content = nil;
    switch (state) {
        case UIXRefreshStateNormal:
            content = UIXKitLocalizedString(@"UIX_REFRESH_NORMAL");
            break;
        case UIXRefreshStatePulling:
            content = UIXKitLocalizedString(@"UIX_REFRESH_PULLING");
            break;
        case UIXRefreshStateReadyToRefresh:
            content = UIXKitLocalizedString(@"UIX_REFRESH_RR");
            break;
        case UIXRefreshStateRefreshing:
            content = UIXKitLocalizedString(@"UIX_REFRESH_REFRESHING");
            break;
        case UIXRefreshStateFinish:
            content = UIXKitLocalizedString(@"UIX_REFRESH_FINISH");
            break;
        default:
            break;
    }
    return content;
}

-(void)beginRefreshing{
    self.refreshState = UIXRefreshStateRefreshing;
    [self.pullDownView.progressView beginRotatingAnimation];
    self.ignoreContentInsetChange = YES;
    self.scrollView.contentInset = UIEdgeInsetsMake(UIXPullDownContentHeight+self.originalContentInset.top,
                                                    self.originalContentInset.left,
                                                    self.originalContentInset.bottom,
                                                    self.originalContentInset.right);
}
-(void)endRefreshing{
    self.refreshState = UIXRefreshStateFinish;
    [self.pullDownView.progressView endRotatingAnimation];
    [self _reset];
}

-(void)_reset{
    self.refreshState = UIXRefreshStateNormal;
    __weak typeof(self) weakSelf = self;
    self.scrollView.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.3f
                     animations:^{
                         weakSelf.scrollView.contentInset = weakSelf.originalContentInset;
                     }
                     completion:^(BOOL finished) {
                         weakSelf.scrollView.userInteractionEnabled = YES;
                         
                     }];
    
}

@end
