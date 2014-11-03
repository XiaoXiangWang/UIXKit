//
//  UIXTableViewController.m
//  UIXRefreshControl
//
//  Created by WangXiaoXiang on 14/10/27.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXTableViewController.h"

@interface UIXTableViewController ()

/**
 *  @Author wangxiaoxiang.cn@iCloud.com, 14-10-27 11:10:25
 *
 *  @brief  表样式
 */
@property(nonatomic,assign) UITableViewStyle style;

@end

@implementation UIXTableViewController

#pragma mark - Lifecycle
-(instancetype)initWithTableViewStyle:(UITableViewStyle)tableViewStyle{
    if (self = [super init]) {
        NSAssert1(tableViewStyle == UITableViewStyleGrouped || tableViewStyle == UITableViewStylePlain, @"未知的UITableViewStyle:%d", tableViewStyle);
        self.style = tableViewStyle;
    }
    return self;
}

-(void)loadView{
    [super loadView];
    UITableView* tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:self.style];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isClearsSelectionOnViewWillAppear) { //选中时是否清除选中
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        if (indexPath) {
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


#pragma mark - UITableViewDelegate & DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
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
