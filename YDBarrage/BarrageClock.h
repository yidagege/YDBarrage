//
//  BarrageClock.h
//  YDBarrage
//
//  Created by 张毅 on 2018/1/14.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import <Foundation/Foundation.h>
// 时间引擎
@interface BarrageClock : NSObject
+ (instancetype)clockWithHandler:(void (^)(NSTimeInterval time))block;

/// 启动时间引擎,根据刷新频率返回逻辑时间.
- (void)start;

/// 关闭时间引擎; 一些都已结束,或者重新开始,或者归于沉寂.
- (void)stop;

/// 暂停,相等于把speed置为0; 不过通过start可以恢复.
- (void)pause;

@end
