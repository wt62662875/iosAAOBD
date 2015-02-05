//
//  SaveMoneyViewController.h
//  AAOBD
//
//  Created by wt on 14/12/27.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol bluetoothDelegate <NSObject>

- (void)CarSpeed:(NSString *)cs;//车速
- (void)RotateSpeed:(NSString *)rpm;//转速
-(void)OilMass:(NSString *)om;//油量
-(void)Temperature:(NSString *)tpt;//水温
-(void)Mileage:(NSString*)mlg;//里程
-(void)Voltage:(NSString*)vlt;//电压
-(void)cacafe:(NSString*)caf;//平均油耗
-(void)mildist:(NSString*)mid;//故障灯亮起后行驶距离
@end

typedef enum
{
    CarData = 0,
    CarCheck = 1,
    CarMedical = 2,
    CarOther = 3
}CarStatusType;
@interface SaveMoneyViewController : UIViewController
@property (nonatomic,retain) id<bluetoothDelegate> delegete;
@end
