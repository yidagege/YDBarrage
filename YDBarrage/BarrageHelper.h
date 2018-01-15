//
//  BarrageHelper.h
//  YDBarrage
//
//  Created by zhangyi on 2018/1/15.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BarrageHelper : NSObject


/**
 配置view 弧度。
 */
+ (void)drawCornerRadiusView:(UIView *)view topLeft:(CGFloat)topLeft topRight:(CGFloat)topRight bottomRight:(CGFloat)bottomRight bottomLeft:(CGFloat)bottomLeft;

@end
