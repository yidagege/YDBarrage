//
//  ViewController.m
//  BarrageDame
//
//  Created by zhangyi on 2018/1/15.
//  Copyright © 2018年 iqiyi.com. All rights reserved.
//

#import "ViewController.h"
#import "BarrageManager.h"
#import "BarrageConfig.h"

@interface ViewController ()
{
    BarrageManager *_barrageManager;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BarrageCanvasConfig *model = [[BarrageCanvasConfig alloc]init];
    model.frame = self.view.bounds;
    
    _barrageManager = [[BarrageManager alloc]initWithConfig:model];
    [self.view addSubview: _barrageManager.view];
    _barrageManager.view.backgroundColor = [UIColor redColor];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
