//
//  UIXTableViewController.h
//  UIXRefreshControl
//
//  如果的使用这个类，请一定要重写tableView:numberOfRowsInSection:和tableView:cellForRowAtIndexPath:方法。
//  在UIXTableViewController类中默认numberOfSectionsInTableView:方法默认返回1。
//
//
//
//  Created by WangXiaoXiang on 14/10/27.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXViewController.h"
#import "UIXPullDownControl.h"

@interface UIXTableViewController : UIXViewController<UITableViewDataSource,UITableViewDelegate>

/**
 *  @Author Wang.XiaoXiang, 14-10-27 11:10:04
 *
 *  @brief  指定的初始化方法。
 *
 *  @param tableViewStyle 表样式。
 *
 *  @return  UIXTableViewController instancetype
 */
-(instancetype)initWithTableViewStyle:(UITableViewStyle)tableViewStyle;

/**
 *  @Author Wang.XiaoXiang, 14-10-27 11:10:10
 *
 *  @brief  表视图。
 */
@property(nonatomic,weak) UITableView* tableView;

/**
 *  @Author wangxiaoxiang.cn@iCloud.com
 *
 *  @brief  是否在ViewWillAppear时清除选中效果
 */
@property (nonatomic,assign,getter=isClearsSelectionOnViewWillAppear) BOOL clearsSelectionOnViewWillAppear;

/**
 *  @Author wangxiaoxiang.cn@iCloud.com, 14-10-27 11:10:57
 *
 *  @brief  下拉刷新视图，需要子类初始化。父类中不做初始化。
 */
@property(nonatomic,strong) UIXPullDownControl* pullDownControl;

/**
 *  @Author wangxiaoxiang.cn@iCloud.com, 14-10-27 11:10:25
 *
 *  @brief 当子类初始化“下拉刷新”完成，触发下拉刷新时会调用此方法。如果子类需要Override此方法。
 */
-(void)beginPullDownRefreshing;

/**
 *  @Author wangxiaoxiang.cn@iCloud.com, 14-10-27 11:10:25
 *
 *  @brief 如果子类完成下拉刷新时需要调用此方法。
 */
-(void)endPullDownRefreshing;

@end
