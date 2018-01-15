//
//  NSTimer+BarrageRender.m
//  YDBarrage
//
//  Created by 张毅 on 2018/1/14.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import "NSTimer+BarrageRender.h"

@implementation NSTimer (BarrageRender)
+ (NSTimer *)danmuScheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                           block:(void(^)())block
                                         repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(dm_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}

+ (void)dm_blockInvoke:(NSTimer *)timer {
    void (^block)() = timer.userInfo;
    if(block) {
        block();
    }
}

@end
