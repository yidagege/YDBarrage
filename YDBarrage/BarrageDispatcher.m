//
//  BarrageDispatcher.m
//  YDBarrage
//
//  Created by 张毅 on 2018/1/14.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import "BarrageDispatcher.h"
#import "BarrageLayer.h"

/// 弹幕调度器, 主要完成负载均衡的工作.
@interface BarrageDispatcher ()<CAAnimationDelegate>
@property(nonatomic,strong)NSMutableArray *danMuAllCellArray;
@property(nonatomic,strong)NSMutableArray *danMuAllArray;
@property(nonatomic, strong)dispatch_queue_t dataQueue;
@property (nonatomic) NSMutableArray *dmLabelPool;

@end

@implementation BarrageDispatcher

-(instancetype)init{
    if (self = [super init]) {
        
        _danMuAllCellArray=[[NSMutableArray alloc]init];
        _danMuAllArray=[[NSMutableArray alloc]init];
        _dmLabelPool = [NSMutableArray array];

        _dataQueue = dispatch_queue_create([@"QYBarrage_draw_data" UTF8String], DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)distributeSprites{
    
}

- (void)addSprite:(BarrageSpriteInfo *)sprite{
    dispatch_async(self.dataQueue, ^{
        if (_danMuAllArray && sprite) {
            [_danMuAllArray addObject:sprite];
        }
    });
}

#pragma mark - Reuse

- (BarrageLayer *)dequeueDMLabel {
    BarrageLayer *dmLabel = _dmLabelPool.lastObject;
    if (dmLabel) {
        [_dmLabelPool removeLastObject];
    } else {
        dmLabel = [BarrageLayer new];
    }
    return dmLabel;
}

- (void)addToReusePool:(BarrageLayer *)label {
    label.contents = nil;
    [_dmLabelPool addObject:label];
}

@end
