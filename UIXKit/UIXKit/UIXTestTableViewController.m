//
//  UIXTestTableViewController.m
//  UIXRefreshControl
//
//  Created by WangXiaoXiang on 14/10/27.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXTestTableViewController.h"
#import "UIXPullDownControl.h"
#import "UIXPullUpControl.h"

@interface UIXTestTableViewController ()<UIXPullUpControlDelegate>

@end

@implementation UIXTestTableViewController


-(NSUInteger)numberOfMaxPagesInPullUpControl{
    return 0;
}

-(NSUInteger)numberOfCurrentPageInPullUpControl{
    return 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pullDownControl = [[UIXPullDownControl alloc] initWithscrollView:self.tableView];
    self.pullUpControl = [[UIXPullUpControl alloc] initWithscrollView:self.tableView delegate:self];
    
    self.navigationController.toolbarHidden = NO;
    self.clearsSelectionOnViewWillAppear = YES;
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    NSLog(@"ContentInset:%@",NSStringFromUIEdgeInsets(self.tableView.contentInset));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"TEST"];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TEST"];
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Hello World:%ld",(long)indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIXViewController* vc = [UIXViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UIXLoadMoreControlDelegate
//-(NSInteger)numberOfMaxPages{
//    return 1;
//}
//
//-(NSInteger)numberOfCurrentPage{
//    return 0;
//    
//}

#pragma mark - Override
-(void)beginPullDownRefreshing{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self endPullDownRefreshing];
    });
}

-(void)beginPullUpRefreshing{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self endPullUpRefreshing];
    });
}

@end
