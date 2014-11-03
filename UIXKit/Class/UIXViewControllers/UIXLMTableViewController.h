//
//  UIXLMTableViewController.h
//  UIXTest
//
//  Created by WangXiaoXiang on 14/10/29.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXTableViewController.h"
#import "UIXPullUpControl.h"

@interface UIXLMTableViewController : UIXTableViewController<UIXPullUpControlDelegate>
/**
 *  @Author wangxiaoxiang.cn@iCloud.com, 14-10-27 11:10:57
 *
 *  @brief  上拉视图，需要子类初始化。父类中不做初始化。
 */
@property (nonatomic,strong) UIXPullUpControl* pullUpControl;


/**
 *  @Author wangxiaoxiang.cn@iCloud.com, 14-10-27 11:10:25
 *
 *  @brief 当子类初始化“上拉加载”完成，触发上拉加载时会调用此方法。如果子类需要Override此方法。
 */
-(void)beginPullUpRefreshing;


/**
 *  @Author wangxiaoxiang.cn@iCloud.com, 14-10-27 11:10:25
 *
 *  @brief 如果子类完成上拉加载时需要调用此方法。
 */
-(void)endPullUpRefreshing;

@end
