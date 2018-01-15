//
//  BarrageHelper.m
//  YDBarrage
//
//  Created by zhangyi on 2018/1/15.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import "BarrageHelper.h"

@implementation BarrageHelper


+ (void)drawCornerRadiusView:(UIView *)view topLeft:(CGFloat)topLeft topRight:(CGFloat)topRight bottomRight:(CGFloat)bottomRight bottomLeft:(CGFloat)bottomLeft{
    CGRect rect=view.bounds;
    UIBezierPath *strokepath = [UIBezierPath bezierPath];
    [strokepath moveToPoint:CGPointMake(topLeft, 0)];
    [strokepath addLineToPoint:CGPointMake(rect.size.width-topRight, 0)];
    [strokepath addArcWithCenter:CGPointMake(rect.size.width-topRight, topRight) radius:topRight startAngle:M_PI * 3/2 endAngle:M_PI * 2 clockwise:YES];
    [strokepath addLineToPoint:CGPointMake(rect.size.width, rect.size.height - bottomRight)];
    [strokepath addArcWithCenter:CGPointMake(rect.size.width-bottomRight, rect.size.height - bottomRight) radius:bottomRight startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [strokepath addLineToPoint:CGPointMake(bottomLeft, rect.size.height)];
    [strokepath addArcWithCenter:CGPointMake(bottomLeft, rect.size.height - bottomLeft) radius:bottomLeft startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    [strokepath addLineToPoint:CGPointMake(0, topLeft)];
    [strokepath addArcWithCenter:CGPointMake(topLeft, topLeft) radius:topLeft startAngle:M_PI endAngle:M_PI * 3/2 clockwise:YES];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = strokepath.CGPath;
    [strokepath closePath];
    view.layer.mask = maskLayer;
}

@end
