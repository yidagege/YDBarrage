//
//  BarrageManager
//  YDBarrage
//
//  Created by 张毅 on 2018/1/6.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import "BarrageManager.h"
#import "BarrageCanvas.h"
#import "BarrageClock.h"
#import "BarrageDispatcher.h"

@interface BarrageManager ()
{
    BarrageCanvas * _canvas; // 画布
    BarrageClock *_clock;
    BarrageDispatcher *_dispatcher;
}
@property (nonatomic, strong)BarrageCanvasConfig *data;

@end

@implementation BarrageManager

- (id)initWithConfig:(BarrageCanvasConfig *)data{
    if (self = [super init]) {
        _data = data;
        _canvas = [[BarrageCanvas alloc]initWithFrame:data.frame];
        [self initClock];
    }
    return self;
}

// 初始化时钟
- (void)initClock
{
    __weak id weakSelf = self;
    _clock = [BarrageClock clockWithHandler:^(NSTimeInterval time){
        __strong id strongSelf = weakSelf;
        [strongSelf distributeSprites];
    }];
}

- (void)distributeSprites{
    [_dispatcher distributeSprites];
}

- (UIView *)view
{
    return _canvas;
}

- (void)startDanMu{
    if (!_dispatcher) {
        _dispatcher = [[BarrageDispatcher alloc]init];
    }
    [_clock start];

}

- (void)receiveDanMuDataList:(NSMutableArray<BarrageSpriteInfo *> *)danmuList{
    for (BarrageSpriteInfo *sprite in danmuList) {
        [_dispatcher addSprite:sprite];
    }
}

- (void)pauseDanMu{
    [_clock pause];
}

- (void)resumeDanMu{
    [_clock start];
}

- (void)stopDanMu{
    [_clock stop];
}


@end
