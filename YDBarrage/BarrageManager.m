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
@interface BarrageManager ()
{
    BarrageCanvas * _canvas; // 画布
    BarrageClock *_clock;
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
        [strongSelf continuingDrawAndShowDanMu];
        
    }];
}

- (void)continuingDrawAndShowDanMu{
    
}

- (UIView *)view
{
    return _canvas;
}

- (void)startDanMu{
    
}

- (void)receiveDanMuDataList:(NSMutableArray<BarrageSpriteInfo *> *)danmuList{
    
}

- (void)pauseDanMu{
    
}

- (void)resumeDanMu{
    
}

- (void)stopDanMu{
    
}


@end
