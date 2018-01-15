//
//  BarrageManager
//  YDBarrage
//
//  Created by 张毅 on 2018/1/6.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BarrageConfig.h"

@protocol BarrageManagerProtocol<NSObject>
@optional

@end

@interface BarrageManager : NSObject
@property (nonatomic, weak)id<BarrageManagerProtocol>delegate;
@property (nonatomic, weak)UIView * view;



- (id)initWithConfig:(BarrageCanvasConfig *)data;

/** 2
 *	@brief	开始弹幕
 */
- (void)startDanMu;

/** 3
 *	@brief	赋值弹幕数据，开始弹幕后需要设置弹幕数据进去，否则没数据可展示，可以分多次设置弹幕数据，此方法可多次调用
 *	@param 	danmuList	          存放的列表
 */
- (void)receiveDanMuDataList:(NSMutableArray<BarrageSpriteInfo *> *)danmuList;

/** 4
 *	@brief	暂停弹幕，这个时候弹幕禁止不动。
 */
- (void)pauseDanMu;

/** 5
 *	@brief	恢复弹幕，这个时候禁止的弹幕重新恢复运动
 */
- (void)resumeDanMu;

/** 6
 *	@brief	结束弹幕，在弹幕使用结束或者退出当前页面之前，需要调用结束终止弹幕，否则会出现内部timer循环引用未终止造成崩溃
 */
- (void)stopDanMu;


@end
