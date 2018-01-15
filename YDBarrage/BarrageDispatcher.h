//
//  BarrageDispatcher.h
//  YDBarrage
//
//  Created by 张毅 on 2018/1/14.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BarrageConfig.h"

@interface BarrageDispatcher : NSObject

- (void)distributeSprites;
- (void)addSprite:(BarrageSpriteInfo *)sprite;

@end
