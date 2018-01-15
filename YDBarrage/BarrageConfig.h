//
//  BarrageConfig.h
//  YDBarrage
//
//  Created by 张毅 on 2018/1/14.
//  Copyright © 2018年 zhangyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BarrageContentType) {
    kQYBarrageTypeText = 0,
    kQYBarrageTypeEmotion,
};


@interface BarrageCanvasConfig : NSObject
@property(nonatomic,assign)CGRect frame;//画布尺寸
@property(nonatomic,strong)NSString* barrage_lines; //弹幕的行数
@property(nonatomic,strong)NSString* barrage_spd;//单条弹幕经过屏幕的时间,秒，默认8
@property(nonatomic,strong)NSString* barrage_distancetotop;//最上面航道与弹幕视图top的偏移量
@property(nonatomic,strong)NSString* barrage_linebetweenspace;//相邻弹道之间行间距
@property(nonatomic,strong)NSString* barrage_cellheight;//每个航道里面可能有不同的font弹幕，设置一个单个弹幕自身的高度，默认30
@property(nonatomic,strong)UIColor *viewBgColor; //弹幕视图背景色
@property(nonatomic,strong)NSString* danmuFont; //字号

@end


@interface BarrageSpriteConfig : NSObject  //此类可以统一设置，也可以单独设置，单独弹幕设置后会覆盖统一设置属性
@property(nonatomic,strong)UIColor *labelBgColor; //弹幕label背景色
@property(nonatomic,strong)NSString* label_opa;//默认透明度1
@property(nonatomic,assign)BOOL isHaveBorder;//是否有边框
@property(nonatomic,assign)float borderWidth;//边框宽度
@property(nonatomic,strong)UIColor *labelBorderColor; //弹幕边框背景色
@property(nonatomic,assign)BOOL isHaveCornerRadius;//是否切圆角
@property(nonatomic,assign)float cornerRadius;//圆角半径

@property(nonatomic,strong)NSString* textawaybgleftmargin;//弹幕文字label距弹幕背景视图左边margin。弹幕文字的具体size对应的font自适应尺寸，默认值为0及label坐标x居中
@property(nonatomic,strong)NSString* textawaybgrightmargin;//弹幕文字距弹幕背景视图右边margin，默认值为0
@property(nonatomic,strong)NSString* textawaybgtopmargin;//弹幕文字距弹幕背景视图顶部margin，默认值为0及坐标y剧中

@property(nonatomic,copy)UIImage *bgImage;//自定义背景框图片
@property(nonatomic,strong)NSString* imgBorderHeight;//图片框高度，建议与图片实际像素高度一致，避免拉伸时变形，默认值等于父视图(弹幕行高barrage_cellheight)高度
@property(nonatomic,strong)NSString* imgawaybgleftmargin;//图片框左侧距弹幕背景视图左边margin，默认值为0及imageview坐标x居中
@property(nonatomic,strong)NSString* imgawaybgrightmargin;//图片框右侧距弹幕背景视图右边margin默认值为0
@property(nonatomic,strong)NSString* imgawaybgtopmargin;//图片框右侧距弹幕背景视图顶部margin，默认值为0及坐标y居中

@end


@interface BarrageSpriteInfo : NSObject
@property(nonatomic,strong)BarrageSpriteConfig *spriteConfig;//单个处理弹幕的展示样式设置
@property(nonatomic,copy)NSString *content;//具体的输入内容
@property(nonatomic,copy)NSString *font;//字号大小
@property(nonatomic,copy)NSString *color;//@"ffffff" 格式


@end
