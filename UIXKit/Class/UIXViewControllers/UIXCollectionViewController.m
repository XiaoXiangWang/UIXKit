//
//  UIXCollectionViewController.m
//  UIXRefreshControl
//
//  Created by WangXiaoXiang on 14/10/27.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXCollectionViewController.h"
#import "UIXCollectionViewFlowLayout.h"

@interface UIXCollectionViewController ()

@property (nonatomic,readwrite) UICollectionViewLayout *collectionViewLayout;

@end

@implementation UIXCollectionViewController

#pragma mark - Lifecycle
-(instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    NSParameterAssert(layout != nil);
    if (self = [super init]) {
        self.collectionViewLayout = layout;
    }
    return self;
}

-(void)loadView{
    [super loadView];
    UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                                          collectionViewLayout:self.collectionViewLayout];
    collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isClearsSelectionOnViewWillAppear) {
        NSArray* selectedItems = [self.collectionView indexPathsForSelectedItems];
        if (selectedItems) {
            for (NSIndexPath* indexPath in selectedItems) {
                [self.collectionView deselectItemAtIndexPath:indexPath
                                                    animated:YES];
            }
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    [self.pullDownControl removeScrollViewAllObserver];
}
#pragma mark - Refresh

-(void)setPullDownControl:(UIXPullDownControl *)pullDownControl{
    _pullDownControl = pullDownControl;
    [pullDownControl addTarget:self
                        action:@selector(beginPullDownRefreshing)
              forControlEvents:UIControlEventValueChanged];
}
-(void)beginPullDownRefreshing{

}

-(void)endPullDownRefreshing{
    [self.pullDownControl endRefreshing];
}


#pragma mark - UICollectionViewDelegate & DataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 0;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
