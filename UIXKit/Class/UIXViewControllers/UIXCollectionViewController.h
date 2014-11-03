//
//  UIXCollectionViewController.h
//  UIXRefreshControl
//
//  如果的使用这个类，请一定要重写collectionView:numberOfRowsInSection:和collectionView:cellForRowAtIndexPath:方法。
//  在UIXCollectionViewController类中默认numberOfSectionsInCollectionView:方法默认返回1。
//
//  Created by WangXiaoXiang on 14/10/27.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import "UIXViewController.h"
#import "UIXPullDownControl.h"
@interface UIXCollectionViewController : UIXViewController<UICollectionViewDelegate, UICollectionViewDataSource>

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout;

/**
 *  @Author wangxiaoxiang.cn@iCloud.com, 14-10-27 14:10:10
 *
 *  @brief  集合视图
 */
@property (nonatomic, weak) UICollectionView *collectionView;

/**
 *  @Author wangxiaoxiang.cn@iCloud.com, 14-10-27 14:10:25
 *
 *  @brief  集合视图布局
 */
@property (nonatomic,readonly) UICollectionViewLayout *collectionViewLayout;

/**
 *  @Author wangxiaoxiang.cn@iCloud.com, 14-10-27 14:10:39
 *
 *  @brief  是否清除选中，在WillAppear的时候.
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
