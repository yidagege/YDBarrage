//
//  BarrageClock.m
//  YDBarrage
//
//  Created by 张毅 on 2018/1/14.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import "BarrageClock.h"
#import "NSTimer+BarrageRender.h"

@interface BarrageClock()
{
    void (^_block)(NSTimeInterval time);
    NSTimer *_timer;
}

@end
@implementation BarrageClock
+ (instancetype)clockWithHandler:(void (^)(NSTimeInterval time))block
{
    BarrageClock * clock = [[BarrageClock alloc]initWithHandler:block];
    return clock;
}

- (instancetype)initWithHandler:(void (^)(NSTimeInterval time))block
{
    if (self = [super init]) {
        _block = block;
    }
    return self;
}

- (void)reset
{
    _timer = [NSTimer danmuScheduledTimerWithTimeInterval:1.f block:^{
        
        _block(0);
    } repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    [_timer setFireDate:[NSDate date]];
}

- (void)start
{
    if (!_timer) {
        [self reset];
    }
}

- (void)stop{
    [_timer invalidate];
    _timer = nil;
}

- (void)pause{
    [_timer setFireDate:[NSDate distantFuture]];
}


@end
