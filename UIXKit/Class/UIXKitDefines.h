//
//  UIXKitDefines.h
//  UIXTest
//
//  Created by WangXiaoXiang on 14/10/29.
//  Copyright (c) 2014年 WangXiaoXiang. All rights reserved.
//

#import <Foundation/Foundation.h>


#define UIXKitLocalizedString(key) NSLocalizedStringFromTable((key), @"UIXLocalization",NULL)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////Animation
/*将弧度转换成角度*/
#define UIXAngle(arc) (arc)*180/M_PI

/*将角度装换成弧度*/
#define UIXArc(angle) M_PI/180*(angle)

/*X轴旋转angle度*/
#define CATransform3DMakeRotationX(angle) CATransform3DMakeRotation(UIXArc((angle)), 1, 0, 0)

/*Y轴旋转angle度*/
#define CATransform3DMakeRotationY(angle) CATransform3DMakeRotation(UIXArc((angle)), 0, 1, 0)

/*Z轴旋转angle度*/
#define CATransform3DMakeRotationZ(angle) CATransform3DMakeRotation(UIXArc((angle)), 0, 0, 1)


#define KTransformRotationZ @"transform.rotation.z"

#define KTransformRotationX @"transform.rotation.x"

#define KTransformRotationY @"transform.rotation.y"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////Debug
#define UIXDEBUG 1

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////Version
FOUNDATION_EXPORT const char* UIXKitVersionNumber;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface UIXKitDefines : NSObject

@end
