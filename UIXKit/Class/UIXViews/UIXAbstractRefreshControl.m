//
//  UIXAbstractRefreshControl.m
//  UIXTest
//
//  Created by WangXiaoXiang on 14/10/29.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXAbstractRefreshControl.h"

@interface UIXAbstractRefreshControl ()


@end


@implementation UIXAbstractRefreshControl

-(instancetype)initWithFrame:(CGRect)frame scrollView:(UIScrollView *)scrollView{
    NSParameterAssert(scrollView);
    if (self = [super initWithFrame:frame]) {
        self.ignoreContentInsetChange = NO;
        //关联view的设置
        self.scrollView = scrollView;
        self.originalContentInset = scrollView.contentInset;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [scrollView addSubview:self];
        //注册KVO
        [self _registerObserverOfAbstractRefreshControl];
        self.refreshState = UIXRefreshStateNormal;
    }
    return self;
}

-(void)dealloc{
    [self removeScrollViewAllObserver];
}


#pragma mark - KVO

-(void)removeScrollViewAllObserver{
    [self _dismissObserverOfAbstractRefreshControl];
}
-(void)_registerObserverOfAbstractRefreshControl{
    [self.scrollView addObserver:self
                      forKeyPath:@"contentInset"
                         options:NSKeyValueObservingOptionNew
                         context:nil];
    [self.scrollView addObserver:self
                      forKeyPath:@"contentOffset"
                         options:NSKeyValueObservingOptionNew
                         context:nil];
    [self.scrollView addObserver:self
                      forKeyPath:@"contentSize"
                         options:NSKeyValueObservingOptionNew
                         context:nil];
}
-(void)_dismissObserverOfAbstractRefreshControl{
    [self.scrollView removeObserver:self
                         forKeyPath:@"contentInset"];
    [self.scrollView removeObserver:self
                         forKeyPath:@"contentOffset"];
    [self.scrollView removeObserver:self
                         forKeyPath:@"contentSize"];
    self.scrollView = nil;
}
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    if (!newSuperview) {
        [self removeScrollViewAllObserver];
    }
}


-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context
{
    if ([keyPath isEqualToString:@"contentInset"]) {
        [self scrollViewChangedContentInset:self.scrollView.contentInset];
    }else if([keyPath isEqualToString:@"contentSize"]){
        [self scrollViewChangedContentSize:self.scrollView.contentSize];
    }
    [self scrollViewChangedContentOffset:self.scrollView.contentOffset];
}

-(void)scrollViewChangedContentInset:(UIEdgeInsets)newContentInset{
    
}

-(void)scrollViewChangedContentOffset:(CGPoint)newContentOffset{
    
}

-(void)scrollViewChangedContentSize:(CGSize)contentSize{
    
}

-(void)beginRefreshing{
    
}

-(void)endRefreshing{
    
}

-(NSString *)stringWithState:(UIXRefreshState)state{
    return nil;
}



@end
