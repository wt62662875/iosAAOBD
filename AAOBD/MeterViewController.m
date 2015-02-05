//
//  MeterViewController.m
//  AAOBD
//
//  Created by oi on 23/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "MeterViewController.h"
#import "public.h"
#import "carInfo.h"
#define DEGREES_TO_RADIANS(d) (d * M_PI / 180)
@interface MeterViewController ()
@property (weak, nonatomic) IBOutlet UIButton *naviBtn;
@property (weak, nonatomic) IBOutlet UILabel *lab_Fuel;
@property (weak, nonatomic) IBOutlet UILabel *lab_Temperature;
@property (weak, nonatomic) IBOutlet UILabel *lab_Speedometer;
@property (weak, nonatomic) IBOutlet UILabel *lab_SpeedTable;
@property (weak, nonatomic) IBOutlet UILabel *lab_KM;
@property (weak, nonatomic) IBOutlet UILabel *lab_Money;
@property (weak, nonatomic) IBOutlet UIImageView *img_FuelBule;
@property (weak, nonatomic) IBOutlet UIImageView *img_FuelRed;
@property (weak, nonatomic) IBOutlet UIImageView *img_tem_red;
@property (weak, nonatomic) IBOutlet UIImageView *img_tem_blue;
@property (weak, nonatomic) IBOutlet UIImageView *img_speed_red;
@property (weak, nonatomic) IBOutlet UIImageView *img_speed_blue;
@property (weak, nonatomic) IBOutlet UIImageView *img_rpm_red;
@property (weak, nonatomic) IBOutlet UIImageView *img_rpm_blue;


@property (nonatomic, retain) carInfo *meterInfo;
@end

@implementation MeterViewController{
    
    NSMutableArray *lDataArr;
    NSMutableArray *temDataArr;//水温
    NSMutableArray *rotateSpeedArr;
    NSMutableArray *speedArr;
    
}

- (IBAction)onclickNaviBtn:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _img_FuelBule.transform=CGAffineTransformMakeRotation(M_PI*1.5);
    _img_FuelRed.transform = CGAffineTransformMakeRotation(0.43*M_PI);
    
    _lab_Fuel.text = @"0.00";
    _lab_Temperature.text=@"0.00";
    _lab_SpeedTable.text =@"0.00";
    _lab_Speedometer.text= @"0.00";
    
    _img_speed_blue.hidden=YES;
    _img_speed_red.hidden = YES;
    
    _img_rpm_blue.hidden=YES;
    _img_rpm_red.hidden = YES;
    
    [_naviBtn setImage:[UIImage imageNamed:@"return-clicked"] forState:UIControlStateHighlighted];
    
    _lab_KM.font =[UIFont fontWithName:@"DS-Digital-Italic" size:25.0];
    _lab_KM.text = @"0.00";
    _lab_Money.font =[UIFont fontWithName:@"DS-Digital-Italic" size:25.0];
    _lab_Money.text = @"0.00";
    
    [self initOilMassData];
    
    [self initRotateSpeedArr];
    
    [self initTemData];
    
    [self initSpeed];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    
}
// 油量
-(void)initOilMassData{
    
    if (lDataArr == nil) {
        lDataArr = [[NSMutableArray alloc]init];
    }
    
    if ([BluetoothSingleton sharedInstance].carInfo != nil) {
        
        _meterInfo = [BluetoothSingleton sharedInstance].carInfo;
    }
    if (_meterInfo.oilMass != nil ) {
        [_meterInfo addObserver:self forKeyPath:@"oilMass" options:NSKeyValueObservingOptionNew context:nil];
        float oil = [_meterInfo.oilMass floatValue];
        float end1 = [self calculateOilm:oil/100];
        
        _lab_Fuel.text = [NSString stringWithFormat:@"%@%@",_meterInfo.oilMass,@"%"];
        _lab_KM.text = _meterInfo.oilMass;
        [lDataArr addObject:[NSString stringWithFormat:@"%f",end1]];
        //        [self rotatingOilMassMeter:oil];
        [self roaratingOil:end1];
        
        NSLog(@"%f",end1);
    }
    
    
}

//-(float)percentage:(float)sender{
//
//
//    if (sender > 0.16) {
//        float end = 2.5 * sender/100;
//        float end1 = -1.2+(float)end;
//
//        return end1;
//
//    }else{
//        float end = 0.4 * sender/100;
//        float end1 = -3.3+(float)end;
//
//        return end1;
//    }
//
//
//
//}

//水温

-(void)initTemData{
    if (temDataArr == nil) {
        temDataArr =[[NSMutableArray alloc]init];
    }
    
    if ([BluetoothSingleton sharedInstance].carInfo != nil) {
        
        _meterInfo = [BluetoothSingleton sharedInstance].carInfo;
    }
    
    if (_meterInfo.WaterTemperature != nil) {
        
        [_meterInfo addObserver:self forKeyPath:@"WaterTemperature" options:NSKeyValueObservingOptionNew context:nil];
        //        float oil = [_meterInfo.WaterTemperature floatValue];
        //        float end1 = [self percentage:oil];
        _lab_Temperature.text = [NSString stringWithFormat:@"%@%@",_meterInfo.WaterTemperature,@"°c"];
        //        [temDataArr addObject:[NSString stringWithFormat:@"%f",end1]];
        
    }
    
    
}
//转速
-(void)initRotateSpeedArr{
    if (rotateSpeedArr == nil) {
        rotateSpeedArr =[[NSMutableArray alloc]init];
    }
    
    if ([BluetoothSingleton sharedInstance].carInfo != nil) {
        
        _meterInfo = [BluetoothSingleton sharedInstance].carInfo;
    }
    
    if (_meterInfo.RPM != nil) {
        [_meterInfo addObserver:self forKeyPath:@"RPM" options:NSKeyValueObservingOptionNew context:nil];
        float rpm = [_meterInfo.RPM floatValue];
        float end1 = [self calculateRPM:rpm];
        _lab_Speedometer.text = [NSString stringWithFormat:@"%@%@",_meterInfo.RPM,@"转/min"];
        [rotateSpeedArr addObject:[NSString stringWithFormat:@"%f",end1]];
        [self roatatingRPM:end1];
        
    }
    
}

//速度
-(void)initSpeed{
    
    if (speedArr == nil) {
        speedArr = [[NSMutableArray alloc]init];
    }
    
    if ([BluetoothSingleton sharedInstance].carInfo != nil) {
        
        _meterInfo = [BluetoothSingleton sharedInstance].carInfo;
    }
    
    if (_meterInfo.Speed != nil) {
        [_meterInfo addObserver:self forKeyPath:@"Speed" options:NSKeyValueObservingOptionNew context:nil];
        float speed = [_meterInfo.Speed floatValue];
        float end1 = [self calculateSpeed:speed];
        _lab_SpeedTable.text = [NSString stringWithFormat:@"%@%@",_meterInfo.Speed,@"KM/h"];
        [speedArr addObject:[NSString stringWithFormat:@"%f",end1]];
        [self rotatingSpeedMeter:end1];
        
    }
    
    
}
//转速
-(float)calculateRPM:(float)rpm{
    
    
    return rpm/8000.0 * 2.200 -2.199;
    
}
//速度
-(float)calculateSpeed:(float)speed{
    
    
    return speed/180*2.200 -2.199;
}
////油耗
-(float)calculateOilm:(float)oil{
    
    if (oil > 0.16) {
        return 0.2 /0.16 *oil - 3.1;
    }else{
        
        return 0.5/84 *oil - 1.2;
    }
}


///* KVO function， 只要object的keyPath属性发生变化，就会调用此函数*/
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"oilMass" ]) {
        
        if ([change objectForKey:@"new"] != nil) {
            float oil = [[change objectForKey:@"new"] floatValue];
            _lab_Fuel.text = [NSString stringWithFormat:@"%@%@",[change objectForKey:@"new"],@"%"];
            float end1 = [self calculateOilm:oil/100];
            [lDataArr addObject:[NSString stringWithFormat:@"%f",end1]];
            //            [self rotatingOilMassMeter:[[lDataArr objectAtIndex:0] floatValue]];
            [self rotatingOilMassMeter:end1];
            
        }
        
        
    }
    
    if ([keyPath isEqualToString:@"WaterTemperature"]) {
        if ([change objectForKey:@"new"] != nil) {
            float oil = [[change objectForKey:@"new"] floatValue];
            _lab_Temperature.text = [NSString stringWithFormat:@"%@%@",[change objectForKey:@"new"],@"°C"];
            //            float end1 = [self percentage:oil];
            //            [lDataArr addObject:[NSString stringWithFormat:@"%f",end1]];
            //            [self rotatingOilMassMeter:[[lDataArr objectAtIndex:0] floatValue]];
            
        }
        
    }
    
    if ([keyPath isEqualToString:@"RPM"]) {
        if ([change objectForKey:@"new"] != nil) {
            float oil = [[change objectForKey:@"new"] floatValue];
            _lab_Speedometer.text = [NSString stringWithFormat:@"%@%@",[change objectForKey:@"new"],@"转/min"];
            float end1 = [self calculateRPM:oil];
            [rotateSpeedArr addObject:[NSString stringWithFormat:@"%f",end1]];
            [self roatatingRPM:[[rotateSpeedArr firstObject] floatValue]];
            
        }
        
    }
    
    if ([keyPath isEqualToString:@"Speed"]) {
        if ([change objectForKey:@"new"] != nil) {
            float oil = [[change objectForKey:@"new"] floatValue];
            _lab_SpeedTable.text = [NSString stringWithFormat:@"%@%@",[change objectForKey:@"new"],@"KM/H"];
            float end1 = [self calculateSpeed:oil];
            [speedArr addObject:[NSString stringWithFormat:@"%f",end1]];
            [self rotatingSpeedMeter:[[speedArr objectAtIndex:0] floatValue]];
            
        }
        
    }
    
    
}

-(void)roaratingOil:(float)oil{
    if (oil <[[BluetoothSingleton sharedInstance].carInfo.oilMass floatValue]/100) {
        if (lDataArr.count == 2) {
            [self rotatingRED:[[lDataArr objectAtIndex:0] floatValue] andEnd:[[lDataArr objectAtIndex:1] floatValue]andIMG:_img_FuelBule andDur:0.5];
            [lDataArr removeObjectAtIndex:0];
        }else{
            
            [self rotatingRED:-3.1 andEnd:[[lDataArr objectAtIndex:0] floatValue]andIMG:_img_FuelBule andDur:0.5];
            //            [speedArr removeObjectAtIndex:0];
        }
        
    }else{
        if (lDataArr.count == 2) {
            [self rotatingBLUE:[[lDataArr objectAtIndex:0] floatValue] andEnd:[[rotateSpeedArr objectAtIndex:0] floatValue] andIMG:_img_FuelBule andDur:0.5];
            [lDataArr removeObjectAtIndex:0];
        }else{
            
            [self rotatingRED:-3.1 andEnd:[[speedArr objectAtIndex:0] floatValue] andIMG:_img_FuelBule andDur:0.5];
            
        }
        
        
    }
    
    
}
//转速
-(void)roatatingRPM:(float)rpm{
    
    if (rpm < -1.1) {
        _img_rpm_red.hidden = YES;
        _img_rpm_blue.hidden = NO;
        if (rotateSpeedArr.count == 2) {
            [self rotatingBLUE:[[rotateSpeedArr objectAtIndex:0] floatValue] andEnd:[[rotateSpeedArr objectAtIndex:1] floatValue]andIMG:_img_rpm_blue andDur:0.5];
            [rotateSpeedArr removeObjectAtIndex:0];
        }else{
            
            [self rotatingBLUE:-2.2 andEnd:[[rotateSpeedArr firstObject] floatValue] andIMG:_img_rpm_blue andDur:0.5];
            //            [speedArr removeObjectAtIndex:0];
        }
        
        
    }else{
        _img_speed_blue.hidden = NO;
        _img_speed_red.hidden = NO;
        if (speedArr.count == 2) {
            [self rotatingRED:[[rotateSpeedArr objectAtIndex:0] floatValue] andEnd:[[rotateSpeedArr objectAtIndex:0] floatValue] andIMG:_img_rpm_red andDur:0.5];
            [speedArr removeObjectAtIndex:0];
        }else{
            
            [self rotatingRED:-2.2 andEnd:[[speedArr objectAtIndex:0] floatValue] andIMG:_img_rpm_red andDur:0.5];
            
        }
        
    }
    
    
}
//速度
-(void)rotatingSpeedMeter:(float)speed {
    
    if (speed < -1.1) {
        //-2.1 -0.09
        _img_speed_blue.hidden= NO;
        _img_speed_red.hidden = YES;
        if (speedArr.count == 2) {
            [self rotatingBLUE:[[speedArr objectAtIndex:0] floatValue] andEnd:[[speedArr objectAtIndex:1] floatValue]andIMG:_img_speed_blue andDur:0.5];
            [speedArr removeObjectAtIndex:0];
        }else{
            
            [self rotatingBLUE:-2.2 andEnd:[[speedArr firstObject] floatValue] andIMG:_img_speed_blue andDur:0.5];
        }
        
    }else{
        //-2.2  -0.09
        _img_speed_blue.hidden = NO;
        _img_speed_red.hidden = NO;
        if (speedArr.count == 2) {
            [self rotatingRED:[[speedArr objectAtIndex:0] floatValue] andEnd:[[speedArr objectAtIndex:0] floatValue] andIMG:_img_speed_red andDur:0.5];
            [speedArr removeObjectAtIndex:0];
        }else{
            
            [self rotatingRED:-2.2 andEnd:[[speedArr objectAtIndex:0] floatValue] andIMG:_img_speed_red andDur:0.5];
            
        }
        
        
        
    }
    
    
}

//油耗
- (void)rotatingOilMassMeter:(float)oil{
    
    
    
    
}

-(void)rotatingRED:(float)star andEnd:(float)end andIMG:(UIImageView *)img andDur:(float)dur{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.delegate = self;
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(star, 0, 0 , 1.0)]; // 起始角度
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(end , 0, 0 , 1.0)];
    animation.duration = dur;
    animation.cumulative = YES;
    animation.repeatCount = 1;
    // 动画终了后不返回初始状态
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [img.layer addAnimation:animation forKey:@"animation"];
}
-(void)rotatingBLUE:(float)star andEnd:(float)end andIMG:(UIImageView *)img andDur:(float)dur{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.delegate = self;
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(star, 0, 0 , 1.0)]; // 起始角度
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(end , 0, 0 , 1.0)];
    animation.duration = dur;
    animation.cumulative = YES;
    animation.repeatCount = 1;
    // 动画终了后不返回初始状态
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [img.layer addAnimation:animation forKey:@"animation"];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    //    [_meterInfo removeObserver:self forKeyPath:@"oilMass"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dismissNaviBtn:(UIButton *)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}





@end
