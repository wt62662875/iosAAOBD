//
//  BluetoothSingleton.h
//  AAOBD
//
//  Created by oi on 30/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "carInfo.h"
@interface BluetoothSingleton : NSObject
@property(nonatomic,strong)carInfo *carInfo;
@property(nonatomic,strong)NSArray *Cmd1;//快速反应指令
@property(nonatomic,strong)NSArray *Cmd2;//到了一定时间请求全部数据
@property(nonatomic,strong)NSArray *Cmd3;//体验指令
@property(nonatomic,strong)NSArray *Cmd4;//兼容检查指令

@property BOOL status;
@property BOOL Car_data;
@property BOOL Car_medical;
@property BOOL Car_check;
@property BOOL Car_Other;

@property int config_E1;//主数据显示次数
@property int config_E2;//体检的初始分数
@property BOOL config_E3;//兼容检测初始状态

@property int C1,C2,C3,C4,E1;
+(BluetoothSingleton *)sharedInstance;
@end
