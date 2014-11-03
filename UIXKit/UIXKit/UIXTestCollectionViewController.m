//
//  UIXTestCollectionViewController.m
//  UIXRefreshControl
//
//  Created by WangXiaoXiang on 14/10/27.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXTestCollectionViewController.h"

@interface UIXTestCollectionViewController ()

@end

@implementation UIXTestCollectionViewController

-(void)loadView{
    [super loadView];
//    self.refreshControl = [[UIXRefreshControl alloc] initInScrollView:self.collectionView];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"TEST"];
//    self.loadMoreControl = [[UIXLoadMoreControl alloc] initInScrollView:self.collectionView delegate:self];
    self.pullDownControl = [[UIXPullDownControl alloc] initWithscrollView:self.collectionView];
    self.pullUpControl = [[UIXPullUpControl alloc] initWithscrollView:self.collectionView delegate:self];
    self.navigationController.toolbarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TEST" forIndexPath:indexPath];
    UILabel* lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    lab.text = [NSString stringWithFormat:@"Hello World:%ld",(long)indexPath.row];
    [cell.contentView addSubview:lab];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIXViewController* vc = [UIXViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - UIXLoadMoreControlDelegate
-(NSInteger)numberOfMaxPages{
    return 1;
}

-(NSInteger)numberOfCurrentPage{
    return 0;
    
}

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

-(NSUInteger)numberOfCurrentPageInPullUpControl{
    return 0;
}
-(NSUInteger)numberOfMaxPagesInPullUpControl{
    return 1;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
