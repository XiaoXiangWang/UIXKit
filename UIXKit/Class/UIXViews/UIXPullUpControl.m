//
//  UIXPullUpControl.m
//  UIXTest
//
//  Created by WangXiaoXiang on 14/10/29.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXPullUpControl.h"

static const CGFloat UIXPullUpControlHeight = 150.0f;
static const CGFloat UIXPullUpContentHeight = 50.0f;
static const CGFloat UIXPullUpHeight = 60.0f;

/*还有一些*/
#define UIXHasSomePages 1
/*没有更多了*/
#define UIXBeenNoPages -1

#define UIXPullUpControlFrame(scrollView) CGRectMake(0,(scrollView).contentSize.height,CGRectGetWidth((scrollView).bounds),UIXPullUpControlHeight)

#pragma mark - UIXPullUpView interface
@interface UIXPullUpView : UIView

@property(nonatomic,weak) UIActivityIndicatorView * activityIndicatorView;

@property(nonatomic,weak) UILabel* textLabel;

@end

#pragma mark - UIXPullUpView implementation
@implementation UIXPullUpView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setup];
    }
    return self;
}

-(void)_setup{
    self.backgroundColor = [UIColor whiteColor];
    
    //标题
    UILabel* textLabel = [UILabel new];
    textLabel.text = @"NeXT";
    textLabel.font = [UIFont systemFontOfSize:15];
    textLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:textLabel];
    self.textLabel = textLabel;
    
    textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[textLabel(200)]"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(textLabel)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[textLabel(15)]"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(textLabel)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:textLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:textLabel
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
    
    //指示器
    UIActivityIndicatorView * activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:activityIndicatorView];
    self.activityIndicatorView = activityIndicatorView;
    
    activityIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[activityIndicatorView(25)]-10-[textLabel]"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(activityIndicatorView,textLabel)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[activityIndicatorView(25)]"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(activityIndicatorView)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:activityIndicatorView
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
    
}

@end


#pragma mark - UIXPullUpView interface

@interface UIXPullUpControl ()

@property (nonatomic,weak) UIXPullUpView* pullUpView;

@property (nonatomic,assign,getter=isBadSize) BOOL badSize;


@end

#pragma mark - UIXPullUpControl implementation
@implementation UIXPullUpControl

#pragma mark - 生命周期
-(instancetype)initWithscrollView:(UIScrollView *)scrollView delegate:(id<UIXPullUpControlDelegate>)delegate{
    NSParameterAssert(delegate);
    NSParameterAssert(scrollView);
    NSAssert1([delegate respondsToSelector:@selector(numberOfCurrentPageInPullUpControl)] && [delegate respondsToSelector:@selector(numberOfMaxPagesInPullUpControl)], @"这个类的代理必须实现numberOfMaxPagesInPullUpControl和numberOfCurrentPageInPullUpControl方法,ClassName:%@",[delegate class]);
    self = [super initWithFrame:UIXPullUpControlFrame(scrollView) scrollView:scrollView];
    if (self) {
        self.delegate = delegate;
        [self _setup];
    }
    return self;
}

-(void)_setup{
    self.backgroundColor = [UIColor grayColor];
    self.badSize = YES;
    
    UIXPullUpView* pullUpView = [UIXPullUpView new];
    [self addSubview:pullUpView];
    self.pullUpView = pullUpView;
    pullUpView.translatesAutoresizingMaskIntoConstraints = NO;
    pullUpView.textLabel.text = [self stringWithState:self.refreshState];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[pullUpView]-0-|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(pullUpView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[pullUpView(50)]"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(pullUpView)]];
    
}


-(void)setBadSize:(BOOL)badSize{
    if (badSize != _badSize) {
        _badSize = badSize;
        self.hidden = badSize;
    }
}


#pragma mark - Override function
-(void)setRefreshState:(UIXRefreshState)refreshState{
    if (self.isBadSize) {
        [super setRefreshState:UIXRefreshStateNormal];
        return;
    }
    self.hidden = NO;
    switch (refreshState) {
        case UIXRefreshStateNormal:
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
    self.pullUpView.textLabel.text = [self stringWithState:refreshState];
    [super setRefreshState:refreshState];
}


-(NSString *)stringWithState:(UIXRefreshState)state{
    NSString* content = nil;
    switch (state) {
        case UIXRefreshStateNormal:
            content = UIXKitLocalizedString(@"UIX_REFRESH_NORMAL");
            break;
        case UIXRefreshStatePulling:
            content = UIXKitLocalizedString(@"UIX_REFRESH_PULLUP");
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

-(void)scrollViewChangedContentInset:(UIEdgeInsets)newContentInset{
    if (self.ignoreContentInsetChange) {
        self.ignoreContentInsetChange = NO;
    }else{
        if (self.refreshState >= UIXRefreshStateRefreshing) {
            newContentInset = UIEdgeInsetsMake(newContentInset.top, newContentInset.left, newContentInset.bottom-UIXPullUpContentHeight, newContentInset.right);
        }
        self.originalContentInset = newContentInset;
        
    }
}

-(void)scrollViewChangedContentOffset:(CGPoint)newContentOffset{
//    NSLog(@"self.scrollView.isDragging:%d",self.scrollView.isDragging);
    if (self.isBadSize == NO && [self _verifyPageNumber] == UIXHasSomePages && self.enabled) {
        if(self.scrollView.isDecelerating && self.refreshState == UIXRefreshStateReadyToRefresh){
            [self beginRefreshing];
        }else if (self.refreshState < UIXRefreshStateReadyToRefresh && self.scrollView.isDragging){
            CGFloat startOffSetY = MAX(self.scrollView.contentSize.height - CGRectGetHeight(self.scrollView.bounds)+self.scrollView.contentInset.top, 0.0f);
            CGFloat currentOffsetY = self.scrollView.contentOffset.y;
            if (currentOffsetY >= startOffSetY ) {
                CGFloat progess = (currentOffsetY - startOffSetY)/ UIXPullUpHeight;
                if (progess == 0) { //Normal
                    self.refreshState = UIXRefreshStateNormal;
                }else if(progess > 0 && progess < 1){ // pulling
                    self.refreshState = UIXRefreshStatePulling;
                }else{ //ready
                    self.refreshState = UIXRefreshStateReadyToRefresh;
                }
                
            }
        }
        
    }
}
-(void)scrollViewChangedContentSize:(CGSize)contentSize{
    self.frame = UIXPullUpControlFrame(self.scrollView);
    self.badSize = NO;
    if ( self.scrollView.contentSize.height <= (CGRectGetHeight(self.scrollView.bounds)-self.scrollView.contentInset.top - self.scrollView.contentInset.bottom)) {
        self.badSize = YES;
    };
}

-(void)beginRefreshing{
    self.refreshState = UIXRefreshStateRefreshing;
    [self.pullUpView.activityIndicatorView startAnimating];
    self.ignoreContentInsetChange = YES;
    self.scrollView.contentInset = UIEdgeInsetsMake(self.originalContentInset.top,
                                                    self.originalContentInset.left,
                                                    self.originalContentInset.bottom+UIXPullUpContentHeight,
                                                    self.originalContentInset.right);

}

-(void)endRefreshing{
    self.refreshState = UIXRefreshStateFinish;
    [self.pullUpView.activityIndicatorView stopAnimating];
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

#pragma mark - delegate
-(NSInteger)_verifyPageNumber{
    return [self _currentPage] < [self _maxPages]? UIXHasSomePages:UIXBeenNoPages;
}

-(NSUInteger)_maxPages{
    return [self.delegate numberOfMaxPagesInPullUpControl];
}

-(NSUInteger)_currentPage{
    return [self.delegate numberOfCurrentPageInPullUpControl];
}
@end
