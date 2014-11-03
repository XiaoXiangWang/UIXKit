//
//  UIXLMTableViewController.m
//  UIXTest
//
//  Created by WangXiaoXiang on 14/10/29.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXLMTableViewController.h"

@implementation UIXLMTableViewController


-(void)setPullUpControl:(UIXPullUpControl *)pullUpControl{
    _pullUpControl = pullUpControl;
    [pullUpControl addTarget:self
                      action:@selector(beginPullUpRefreshing)
            forControlEvents:UIControlEventValueChanged];
}

-(void)beginPullUpRefreshing{
    
}

-(void)endPullUpRefreshing{
    [self.pullUpControl endRefreshing];
}

#pragma mark - UIXLoadMoreControlDelegate
-(NSUInteger)numberOfCurrentPageInPullUpControl{
    return 0;
}
-(NSUInteger)numberOfMaxPagesInPullUpControl{
    return 0;
}

@end
