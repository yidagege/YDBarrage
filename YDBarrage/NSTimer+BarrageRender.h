//
//  NSTimer+BarrageRender.h
//  YDBarrage
//
//  Created by 张毅 on 2018/1/14.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (BarrageRender)
+ (NSTimer *)danmuScheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                           block:(void(^)())block
                                         repeats:(BOOL)repeats;

@end
