//
//  ViewController.m
//  UIXKit
//
//  Created by WangXiaoXiang on 14/11/3.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "ViewController.h"
#import "UIXTestTableViewController.h"
#import "UIXTestCollectionViewController.h"
#import "UIXCollectionViewFlowLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)col:(id)sender {
    UIXTestCollectionViewController* tcvc = [[UIXTestCollectionViewController alloc] initWithCollectionViewLayout:[UIXCollectionViewFlowLayout new]];
    [self.navigationController pushViewController:tcvc animated:YES];
}
- (IBAction)tab:(id)sender {
    UIXTestTableViewController* tbvc = [[UIXTestTableViewController alloc] initWithTableViewStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:tbvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
