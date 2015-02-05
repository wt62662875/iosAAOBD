//
//  SaveMoneyViewController.m
//  AAOBD
//
//  Created by wt on 14/12/27.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "SaveMoneyViewController.h"
#import "public.h"
#import "AppUtils.h"
#import "Alert.h"
#import "MBHUDView.h"
#import "ASIClient.h"
#import "BluetoothSingleton.h"
@import CoreBluetooth;

@interface SaveMoneyViewController ()<CBCentralManagerDelegate,CBPeripheralDelegate>
{
    int a;
    int status;
    NSString *linshi2;
    int flag;
    double iii;
    int ccc;
    int aaa;
    NSTimer *timer;
    NSTimer *timer2;
    float savemoney1 ;
    float savemoney2 ;
    float savemoney3 ;
    float savemoney4 ;
    float savemoney5 ;
    float savemoney6 ;
    float savemoney7 ;
}

@property (strong, nonatomic) IBOutlet UIScrollView *savemoneyScrView;
@property (strong, nonatomic) IBOutlet UIView *StatisticalGraphView;
@property (strong, nonatomic) IBOutlet UILabel *saveMoneyLab;

@property (strong,nonatomic)CBCentralManager *centralManager;
@property (strong, nonatomic) NSMutableArray *peripherals;
@property (strong ,nonatomic) CBCharacteristic *writeCharacteristic;
@property (nonatomic, strong) CBPeripheral *peripheral;
@property (strong,nonatomic) NSMutableArray *nCharacteristics;
@property (strong,nonatomic) CBService *service;
@property (strong, nonatomic) IBOutlet UILabel *TodaySaveMoneyLab;
@end

@implementation SaveMoneyViewController

@synthesize delegete;

- (void)viewDidLoad {
    [super viewDidLoad];
    _savemoneyScrView.contentSize = CGSizeMake(0, 560);
    [_savemoneyScrView setScrollEnabled:YES];
    _savemoneyScrView.showsVerticalScrollIndicator = NO;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *SaveMoney = [userDefaults stringForKey:@"SaveMoney"];
    _saveMoneyLab.text =SaveMoney;
    NSArray *Cmd1 = @[@"BT+DATA.VSS\r\n",@"BT+DATA.ECT\r\n",@"BT+DATA.RPM\r\n",@"BT+DATA.CAC_AFE\r\n"];//快速反应指令
    NSArray *Cmd2 = @[@"BT+DATA.VSS\r\n",@"BT+DATA.ECT\r\n",@"BT+DATA.RPM\r\n",@"BT+DATA.CAC_AFE\r\n",@"BT+DATA.FUELLVL\r\n",@"BT+SPWR\r\n",@"BT+DATA.AD_MIL\r\n",@"BT+DATA.MIL_DIST\r\n"];//到了一定时间请求全部数据
    NSArray *Cmd3 = @[@"BT+RPDTC\r\n",@"BT+DATA.RPM\r\n",@"BT+DATA.TPS\r\n",@"BT+DATA.CATTEMP11\r\n"];//体验指令
    NSArray *Cmd4 = @[@"BT+DATA.VSS\r\n",@"BT+DATA.VSS\r\n"];//兼容检查指令
    [BluetoothSingleton sharedInstance].Cmd1 = Cmd1;
    [BluetoothSingleton sharedInstance].Cmd2 = Cmd2;
    [BluetoothSingleton sharedInstance].Cmd3 = Cmd3;
    [BluetoothSingleton sharedInstance].Cmd4 = Cmd4;
    [BluetoothSingleton sharedInstance].status = false;
    [BluetoothSingleton sharedInstance].Car_data = false;
    [BluetoothSingleton sharedInstance].Car_medical = false;
    [BluetoothSingleton sharedInstance].Car_check = false;
    [BluetoothSingleton sharedInstance].Car_Other = false;
    [BluetoothSingleton sharedInstance].config_E1 = 3;//主数据显示次数
    [BluetoothSingleton sharedInstance].config_E2 = 100;//体检的初始分数
    [BluetoothSingleton sharedInstance].config_E3 = true;//兼容检测初始状态
    [BluetoothSingleton sharedInstance].E1 = [BluetoothSingleton sharedInstance].config_E1;
    [BluetoothSingleton sharedInstance].C1=0;
    [BluetoothSingleton sharedInstance].C2=0;
    [BluetoothSingleton sharedInstance].C3=0;
    [BluetoothSingleton sharedInstance].C4=0;
    
    [self getTodaysavemoney];//获取今日省钱
    
    
    flag = 0;
    status = 1;
    
    iii = 0;
    ccc = 0;
    aaa = 0;
    
    self.peripherals = [NSMutableArray array];
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self
                                                               queue:nil
                                                             options:nil];
    a=0;

   
}

-(void)drawline{
    //横线图
    for (int i=0 ; i<=20; i++) {
        
        if (i%5 ==0) {
            [self drawline:40 startpoint:20+10*i endpoint:SCREENWIDTH-20 endpoint:20+10*i colorx:160 colory:160 colorz:160 linewidth:1];
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 14+10*i, 20, 15)];
            lab.textColor = RGBCOLORA(153, 153, 153, 1);
            lab.textAlignment = NSTextAlignmentCenter;
            lab.text =[NSString stringWithFormat:@"%d",20-i];
            [_StatisticalGraphView addSubview:lab];
        }else{
            [self drawline:40 startpoint:20+10*i endpoint:SCREENWIDTH-20 endpoint:20+10*i colorx:102 colory:102 colorz:102 linewidth:0.5];
        }
    }
    //x点表示7天 35/天   75，110，145.....285
    //y点表示0-20元钱  10/元   20,30,40.....220
    //勾点连线
    //1-2天
    [self drawdatemoney:1 firstmoney:savemoney1 towmoney:savemoney2];
    //2-3天
    [self drawdatemoney:2 firstmoney:savemoney2 towmoney:savemoney3];
    //3-4天
    [self drawdatemoney:3 firstmoney:savemoney3 towmoney:savemoney4];
    //4-5天
    [self drawdatemoney:4 firstmoney:savemoney4 towmoney:savemoney5];
    //5-6天
    [self drawdatemoney:5 firstmoney:savemoney5 towmoney:savemoney6];
    //6-7天
    [self drawdatemoney:6 firstmoney:savemoney6 towmoney:savemoney7];
    // Do any additional setup after loading the view.
    
    //蓝牙开始
}
//每天划线方法      参数：date第几天，first第一天多少钱,two第二天多少钱
-(void)drawdatemoney:(int)date firstmoney:(float)first towmoney:(float)two{
    float x = [self moneyToY:first];
    float y = [self moneyToY:two];
    if (x < y) {
        x = x+2;
        y = y-2;
    }else if(x == y){
        x = x;
        y = y;
    }else{
        x = x-2;
        y = y+2;
    }
    [self drawline:[self dateToX:date]+2 startpoint:x endpoint:[self dateToX:date+1]-2 endpoint:y colorx:0 colory:153/255 colorz:255 linewidth:1];
    [self drawCiccle:[self dateToX:date+1] ciccley:[self moneyToY:two]];
}
//直线方法     起点坐标x y 终点坐标x y  颜色值x y z  线宽
-(void)drawline:(float)x startpoint:(float)y endpoint:(float)endx endpoint:(float)endy colorx:(float)colorx colory:(float)colory colorz :(float)colorz linewidth:(float)line{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:self.view.frame];
    [_StatisticalGraphView addSubview:imageView];
    
//    UIGraphicsBeginImageContext(imageView.frame.size);
    UIGraphicsBeginImageContextWithOptions(imageView.frame.size,NO,0);
    
//    UIGraphicsBeginImageContext(imageView.frame.size);
    UIGraphicsBeginImageContextWithOptions(imageView.frame.size,NO,0);

    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapSquare);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), line);  //线宽
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), colorx, colory, colorz, 1.0);  //颜色
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), x  , y);  //起点坐标
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), endx, endy);   //终点坐标
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    imageView.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}
//圆圈方法     圆位置x y
-(void)drawCiccle:(float)x ciccley:(float)y{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:self.view.frame];
    [_StatisticalGraphView addSubview:imageView];
    
    UIGraphicsBeginImageContextWithOptions(imageView.frame.size,NO,0);

    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapSquare);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 1);  //线宽
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 153/255, 255.0f, 1.0);  //颜色
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    
    CGContextAddArc(UIGraphicsGetCurrentContext(), x, y, 3, 0, 2*M_PI, 0);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    imageView.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}
//日期对应坐标转换
-(float)dateToX:(int)aa{
    float bb = 0;
    if (aa>0||aa<=7) {
        bb = 40 + aa*35;
    }
    return bb;

}
//钱对应坐标转换
-(float)moneyToY:(int)aa{
    float bb;
    if (aa>=0||aa<=20) {
        bb = 220 - aa*10;
    }
    return bb;

}
- (IBAction)InsuranceClick:(id)sender {
    [self performSegueWithIdentifier:@"fristViewToSelectInsurancecompany" sender:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//蓝牙开始

-(void)timing:(NSTimer *)timer{
    ccc++;
    if (ccc == 1) {
        aaa = iii;
    }
    if (ccc == 2) {
        if (iii == aaa) {
            [_service.characteristics enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                _writeCharacteristic = obj;
                if([_writeCharacteristic.UUID isEqual:[CBUUID UUIDWithString:@"FF01"]]) {
                    
                    [self StartCallBack];//init command
                    [BluetoothSingleton sharedInstance].Car_data=true;
                }
                if([_writeCharacteristic.UUID isEqual:[CBUUID UUIDWithString:@"FF02"]]) {
                    
                    [_peripheral setNotifyValue:YES forCharacteristic:_writeCharacteristic];
                }
            }];
            ccc=0;
            a=0;
            NSLog(@"刷新了刷新了刷新了刷新了刷新了刷新了刷新了");
            
            flag = 0;
        }else{
            iii =0;ccc=0;aaa=0;
        }
    }
}
- (void)centralManager:(CBCentralManager *)central
 didDiscoverPeripheral:(CBPeripheral *)peripheral
     advertisementData:(NSDictionary *)advertisementData
                  RSSI:(NSNumber *)RSSI {
    
    // optionally stop scanning for more peripherals
    // [self.centralManager stopScan];
    if(![self.peripherals containsObject:peripheral]) {
        NSLog(@"准备连接外围设备...");
        peripheral.delegate = self;
        [self.peripherals addObject:peripheral];
        [self.centralManager connectPeripheral:peripheral options:nil];
    }
}
-(void) centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    
    NSLog(@"发现服务...");
    [peripheral discoverServices:nil];
    //    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(readRSSI) userInfo:nil repeats:1.0];
    ////    [timer fire];
    //    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
}

-(void) peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {
    
    NSLog(@"发现特征...");
    __block BOOL found = NO;
    [peripheral.services enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CBService *service = obj;
        NSLog(@"-----------%@",service.UUID);
        NSLog(@"====%@",peripheral.name);
        if([service.UUID isEqual:[CBUUID UUIDWithString:@"FF00"]]) {
            [peripheral discoverCharacteristics:nil forService:service];
            found = YES;
        }
    }];
    if(!found)
        NSLog(@"这不是aaobd设备");
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
    NSLog(@"读取数据...");
    //定时器
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(timing:)
                                           userInfo:nil
                                            repeats:YES];
    [timer fire];
    _service = service;
    [service.characteristics enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        _writeCharacteristic = obj;
        _peripheral = peripheral;
        NSLog(@"------%@",_writeCharacteristic.UUID);
        if([_writeCharacteristic.UUID isEqual:[CBUUID UUIDWithString:@"FF01"]]) {
            //Byte aaa[] = {0x69,0x74,0x63,0x7a,0x1a,0x03,0x00,0x96,0x00,0x6a};
            //NSData *data = [[NSData alloc]initWithBytes:aaa length:10];
            //[_peripheral writeValue:data
            //      forCharacteristic:_writeCharacteristic
            //                   type:CBCharacteristicWriteWithResponse];
            
            [self StartCallBack];//init command
            [BluetoothSingleton sharedInstance].Car_data=true;
        }
        //0x69 0x74 0x61 0x7a 0x1a 0x03 0x00 0x96 0x00 0x6a
        if([_writeCharacteristic.UUID isEqual:[CBUUID UUIDWithString:@"FF02"]]) {
            [peripheral setNotifyValue:YES forCharacteristic:_writeCharacteristic];
        }
    }];
}


- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    iii++;
    NSString *linshi = [[NSString alloc] initWithData:characteristic.value encoding:NSASCIIStringEncoding];
    NSString *character;
    NSString *GetValue =@"";
    
    int f ;
    
    /**体检**/
    if([BluetoothSingleton sharedInstance].status)
    {
        if ([[[NSString alloc]initWithData:characteristic.value encoding:NSUTF8StringEncoding]rangeOfString:
             @"\r\n"].location != NSNotFound) {
            f=1;
            linshi2 = [NSString stringWithFormat:@"%@%@",linshi2,linshi];
        }else {
            f=0;
            linshi2 = [NSString stringWithFormat:@"%@%@",linshi2,linshi];
        }
        if(f==1){
            [_service.characteristics enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
            {
                _writeCharacteristic = obj;
                if([_writeCharacteristic.UUID isEqual:[CBUUID UUIDWithString:@"FF01"]]){
                    
                    if([BluetoothSingleton sharedInstance].C3==1)/*第一次进来初始化为零*/
                        [BluetoothSingleton sharedInstance].config_E2 = 100;
                    //判断是不是以#结束
                    if([[[NSString alloc]initWithData:characteristic.value encoding:NSUTF8StringEncoding]rangeOfString:@"RPDTC:"].location != NSNotFound)/**判断是否以#号结束，主要作用在启动代码**/
                    {
                        //返回数据格式：有故障码：RPDTC:000
                        //无故障码：RPDTC:002,&P009&P1114
                        //如果有故障码：
                        [BluetoothSingleton sharedInstance].config_E2 = [BluetoothSingleton sharedInstance].config_E2 - 10;
                    }
                    else if([[[NSString alloc]initWithData:characteristic.value encoding:NSUTF8StringEncoding]rangeOfString:@"TPS:"].location != NSNotFound)/*如果返回的书数据有TPS：就表示有故障码就开始解析数据*/
                    {
                        //正常范围 15.9~21%，超出就异常
                        [BluetoothSingleton sharedInstance].config_E2 = [BluetoothSingleton sharedInstance].config_E2 - 10;
                    }
                    else if([[[NSString alloc]initWithData:characteristic.value encoding:NSUTF8StringEncoding]rangeOfString:@"RPM:"].location != NSNotFound)/*如果返回的书数据有RPM：就表示有故障码就开始解析数据*/
                    {
                        //正常范围 632~811)，超出就异常
                        [BluetoothSingleton sharedInstance].config_E2 = [BluetoothSingleton sharedInstance].config_E2 - 10;
                    }
                    else if([[[NSString alloc]initWithData:characteristic.value encoding:NSUTF8StringEncoding]rangeOfString:@"CATTEMP11:"].location != NSNotFound)/*如果返回的书数据有CATTEMP11：就表示有故障码就开始解析数据*/
                    {
                        //正常范围 300~800)，超出就异常
                        [BluetoothSingleton sharedInstance].config_E2 = [BluetoothSingleton sharedInstance].config_E2 - 10;
                    }
                    [self sendBlueToothData:[BluetoothSingleton sharedInstance].Cmd3[[BluetoothSingleton sharedInstance].C3]];
                    [BluetoothSingleton sharedInstance].C3++;
                }
            }];
        }
    }
    /**兼容监测*/
    else if([BluetoothSingleton sharedInstance].Car_check)
    {
        if([BluetoothSingleton sharedInstance].C4==1)/*第一次进来初始化为true*/
            [BluetoothSingleton sharedInstance].config_E3 = true;
        if ([[[NSString alloc]initWithData:characteristic.value encoding:NSUTF8StringEncoding]rangeOfString:
             @"\r\n"].location != NSNotFound)/**判断是否以\r\n号结束**/
        {
            if([[[NSString alloc]initWithData:characteristic.value encoding:NSUTF8StringEncoding]rangeOfString:@"Status:003"].location != NSNotFound)/**Status:003\r结束表示协议不正常**/
            {
                /**异常**/
                [BluetoothSingleton sharedInstance].config_E3 = false;
            }
            [self sendBlueToothData:[BluetoothSingleton sharedInstance].Cmd4[[BluetoothSingleton sharedInstance].C4]];
            [BluetoothSingleton sharedInstance].C4++;
            if([BluetoothSingleton sharedInstance].C4>[BluetoothSingleton sharedInstance].Cmd4.count)
            {
                [BluetoothSingleton sharedInstance].C4=0;
            }
        }
    }
    /**其他通信数据*/
    else if([BluetoothSingleton sharedInstance].Car_Other)
    {
        /**其他操作*/
    }
    else
    {
        if ([[[NSString alloc]initWithData:characteristic.value encoding:NSUTF8StringEncoding]rangeOfString:@"\r\n"].location != NSNotFound) {
            f=1;
            linshi2 = [NSString stringWithFormat:@"%@%@",linshi2,linshi];
        }else {
            f=0;
            linshi2 = [NSString stringWithFormat:@"%@%@",linshi2,linshi];
        }
        if (f==1) {
            NSRange rrr = [linshi2 rangeOfString:@"Status:006"];
            if (rrr.location != NSNotFound) {
                flag=1;
            }
            for (int i = 0; i<linshi2.length; ++i) {
                character = [linshi2 substringWithRange:NSMakeRange(i, 1)];
                if ([character isEqual: @"0"]|
                    [character isEqual: @"1"]|
                    [character isEqual: @"2"]|
                    [character isEqual: @"3"]|
                    [character isEqual: @"4"]|
                    [character isEqual: @"5"]|
                    [character isEqual: @"6"]|
                    [character isEqual: @"7"]|
                    [character isEqual: @"8"]|
                    [character isEqual: @"9"]|
                    [character isEqual: @"."]) {
                    GetValue = [GetValue stringByAppendingString:character];
                }
            }
            NSRange rang = [linshi2 rangeOfString:@"\r\n"];
            [_service.characteristics enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                
                _writeCharacteristic = obj;
                if([_writeCharacteristic.UUID isEqual:[CBUUID UUIDWithString:@"FF01"]]) {
                    
                    if (rang.location != NSNotFound) {
                        
                        if (flag == 1) {
                            if (status == 1) {
                                [AppUtils showAlertView:@"提示" STR:@"熄火了" BtnTxt:@"好的"];
                                status = 2;
                            }
                            
                        }else if(flag == 0){
                            status = 1;
                            if([BluetoothSingleton sharedInstance].E1!=0)
                            {
                                switch ([BluetoothSingleton sharedInstance].C1) {
                                    case 1:
                                        NSLog(@"速度-------%@",GetValue);
                                        [self.delegete CarSpeed:GetValue];
                                        [BluetoothSingleton sharedInstance].carInfo.Speed = GetValue;
                                        break;
                                    case 2:
                                        NSLog(@"温度-------%@",GetValue);
                                        [self.delegete CarSpeed:GetValue];
                                        [BluetoothSingleton sharedInstance].carInfo.WaterTemperature = GetValue;
                                        break;
                                    case 3:
                                        NSLog(@"转速-------%@",GetValue);
                                        [self.delegete CarSpeed:GetValue];
                                        [BluetoothSingleton sharedInstance].carInfo.RPM = GetValue;
                                        break;
                                    case 4:
                                        NSLog(@"油耗-------%@",GetValue);
                                        [self.delegete CarSpeed:GetValue];
                                        [BluetoothSingleton sharedInstance].carInfo.TheAverageFuel = GetValue;
                                        break;
                                    default:
                                        break;
                                }
                                if([BluetoothSingleton sharedInstance].C1==[BluetoothSingleton sharedInstance].Cmd1.count)
                                {
                                    [BluetoothSingleton sharedInstance].C1=0;
                                    [BluetoothSingleton sharedInstance].E1--;
                                }
                                /*send data*/
                                [self sendBlueToothData:[BluetoothSingleton sharedInstance].Cmd1[[BluetoothSingleton sharedInstance].C1]];
                                [BluetoothSingleton sharedInstance].C1++;
                            }
                            else
                            {
                                switch ([BluetoothSingleton sharedInstance].C2) {
                                    case 1:
                                        NSLog(@"速度-------%@",GetValue);
                                        [self.delegete CarSpeed:GetValue];
                                        [BluetoothSingleton sharedInstance].carInfo.Speed = GetValue;
                                        break;
                                    case 2:
                                        NSLog(@"温度-------%@",GetValue);
                                        [self.delegete CarSpeed:GetValue];
                                        [BluetoothSingleton sharedInstance].carInfo.WaterTemperature = GetValue;
                                        break;
                                    case 3:
                                        NSLog(@"转速-------%@",GetValue);
                                        [self.delegete CarSpeed:GetValue];
                                        [BluetoothSingleton sharedInstance].carInfo.RPM = GetValue;
                                        break;
                                    case 4:
                                        NSLog(@"油耗-------%@",GetValue);
                                        [self.delegete CarSpeed:GetValue];
                                        [BluetoothSingleton sharedInstance].carInfo.TheAverageFuel = GetValue;
                                        break;
                                    case 5:
                                        NSLog(@"剩余油量-------%@",GetValue);
                                        [self.delegete CarSpeed:GetValue];
                                        [BluetoothSingleton sharedInstance].carInfo.oilMass = GetValue;
                                        break;
                                    case 6:
                                        NSLog(@"电压-------%@",GetValue);
                                        [self.delegete CarSpeed:GetValue];
                                        [BluetoothSingleton sharedInstance].carInfo.voltage = GetValue;
                                        break;
                                    case 7:
                                        NSLog(@"里程-------%@",GetValue);
                                        [self.delegete CarSpeed:GetValue];
                                        [BluetoothSingleton sharedInstance].carInfo.KM = GetValue;
                                        break;
                                    case 8:
                                        NSLog(@"故障灯-------%@",GetValue);
                                        [self.delegete CarSpeed:GetValue];
                                        [BluetoothSingleton sharedInstance].carInfo.TroubleLight = GetValue;
                                        break;
                                    default:
                                        break;
                                }
                                /*send data*/
                                if([BluetoothSingleton sharedInstance].C2==[BluetoothSingleton sharedInstance].Cmd2.count)
                                {
                                    [BluetoothSingleton sharedInstance].C2=0;
                                    [BluetoothSingleton sharedInstance].E1=[BluetoothSingleton sharedInstance].config_E1;//config_E1由配置文件提供
                                }
                                [self sendBlueToothData:[BluetoothSingleton sharedInstance].Cmd2[[BluetoothSingleton sharedInstance].C2]];
                                [BluetoothSingleton sharedInstance].C2++;
                            }
                        }
                    }
                }
            }];
            linshi2 = @"";
        }
    }
}
//断开连接调用
-(void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    [timer invalidate];
    if (_peripheral != nil) {
        [self.centralManager connectPeripheral:_peripheral options:nil];
    }
    
    NSLog(@"断了断了断了断了断了断了");
}

-(void)centralManagerDidUpdateState:(CBCentralManager *)central{
    if(central.state == CBCentralManagerStatePoweredOn) {
        
        [self.centralManager scanForPeripheralsWithServices:nil
                                                    options:nil];
    } else if(self.centralManager.state == CBCentralManagerStatePoweredOff) {
        
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"蓝牙关闭状态", @"")
                                    message:NSLocalizedString(@"请打开你的手机蓝牙", @"")
                                   delegate:self
                          cancelButtonTitle:NSLocalizedString(@"关闭", @"")
                          otherButtonTitles: nil] show];
    } else if(self.centralManager.state == CBCentralManagerStateUnsupported) {
        
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"你的手机不支持蓝牙4.0", @"")
                                    message:NSLocalizedString(@"请更换IPHONE4S以上设备", @"")
                                   delegate:self
                          cancelButtonTitle:NSLocalizedString(@"关闭", @"")
                          otherButtonTitles: nil] show];
        
    }

}
//获取今日省钱数
-(void)getTodaysavemoney{
    Alert *alv = [[Alert alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    
    if (![AppUtils nowstate]) {
        alv.image = @"error";
        alv.message = @"暂无网络连接";
        [self.navigationController.view addSubview:alv];
    }else{
 
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *UserPhoneNomber = [userDefaults stringForKey:@"UserPhoneNomber"];
        NSString *Cheqckedcarid = [userDefaults stringForKey:@"Cheqckedcarid"];
        NSDictionary * pas=[[NSDictionary alloc]initWithObjectsAndKeys:UserPhoneNomber,@"LoginName",Cheqckedcarid,@"carid", nil];
        [ASIClient POST_Path:@"/API/Mobile/OBD.ashx?method=getdaysave&LoginName&carid" params:pas completed:^(id JSON, NSString *stringData) {
            
            NSLog(@"%@",JSON);
            //拉取数据成功
            if (JSON != nil) {
                NSLog(@"请求成功");
                NSDate *  senddate1=[NSDate dateWithTimeIntervalSinceNow:-6*(24*60*60)];
                NSDate *  senddate2=[NSDate dateWithTimeIntervalSinceNow:-5*(24*60*60)];
                NSDate *  senddate3=[NSDate dateWithTimeIntervalSinceNow:-4*(24*60*60)];
                NSDate *  senddate4=[NSDate dateWithTimeIntervalSinceNow:-3*(24*60*60)];
                NSDate *  senddate5=[NSDate dateWithTimeIntervalSinceNow:-2*(24*60*60)];
                NSDate *  senddate6=[NSDate dateWithTimeIntervalSinceNow:-(24*60*60)];
                NSDate *  senddate7=[NSDate date];
                NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
                [dateformatter setDateFormat:@"YYYY-MM-dd"];
                NSString *  locationString1=[dateformatter stringFromDate:senddate1];
                NSString *  locationString2=[dateformatter stringFromDate:senddate2];
                NSString *  locationString3=[dateformatter stringFromDate:senddate3];
                NSString *  locationString4=[dateformatter stringFromDate:senddate4];
                NSString *  locationString5=[dateformatter stringFromDate:senddate5];
                NSString *  locationString6=[dateformatter stringFromDate:senddate6];
                NSString *  locationString7=[dateformatter stringFromDate:senddate7];
                
                savemoney1 = [[JSON objectForKey:locationString1] floatValue];
                savemoney2 = [[JSON objectForKey:locationString2] floatValue];
                savemoney3 = [[JSON objectForKey:locationString3] floatValue];
                savemoney4 = [[JSON objectForKey:locationString4] floatValue];
                savemoney5 = [[JSON objectForKey:locationString5] floatValue];
                savemoney6 = [[JSON objectForKey:locationString6] floatValue];
                savemoney7 = [[JSON objectForKey:locationString7] floatValue];
                [self drawline];
                _TodaySaveMoneyLab.text = [NSString stringWithFormat:@"%.2f",savemoney7];
            }else{
                
            }
            [MBHUDView dismissCurrentHUD];
        } failed:^(NSError *error) {
            //拉取失败,更多可能服务器关闭，手机无网络
            NSLog(@"当前无网络");
            [MBHUDView dismissCurrentHUD];
            
        }];
    }

}
/**send the data to bluetooth*/
- (void)sendBlueToothData:(NSString*)CmdData{

    [_peripheral writeValue:[CmdData dataUsingEncoding:NSASCIIStringEncoding]
          forCharacteristic:_writeCharacteristic
                       type:CBCharacteristicWriteWithResponse];
}
- (void) StartCallBack{
    if([BluetoothSingleton sharedInstance].Car_data)
    {
        if([BluetoothSingleton sharedInstance].E1!=0)
        {
            [self sendBlueToothData:[BluetoothSingleton sharedInstance].Cmd1[[BluetoothSingleton sharedInstance].C1]];
            [BluetoothSingleton sharedInstance].C1++;
            if([BluetoothSingleton sharedInstance].C1==[BluetoothSingleton sharedInstance].Cmd1.count){
                [BluetoothSingleton sharedInstance].C1 = 0;
            }
        }
        else
        {
            [self sendBlueToothData:[BluetoothSingleton sharedInstance].Cmd2[[BluetoothSingleton sharedInstance].C2]];
            [BluetoothSingleton sharedInstance].C2++;
            if([BluetoothSingleton sharedInstance].C2==[BluetoothSingleton sharedInstance].Cmd2.count){
                [BluetoothSingleton sharedInstance].C2 = 0;
            }
        }
    }
    else if([BluetoothSingleton sharedInstance].Car_medical)
    {
        [self sendBlueToothData:[BluetoothSingleton sharedInstance].Cmd3[[BluetoothSingleton sharedInstance].C3]];
        [BluetoothSingleton sharedInstance].C3++;
        if([BluetoothSingleton sharedInstance].C3==[BluetoothSingleton sharedInstance].Cmd3.count){
            [BluetoothSingleton sharedInstance].C3 = 0;
        }
    }
    else if([BluetoothSingleton sharedInstance].Car_check)
    {
        [self sendBlueToothData:[BluetoothSingleton sharedInstance].Cmd4[[BluetoothSingleton sharedInstance].C4]];
        [BluetoothSingleton sharedInstance].C4++;
        if([BluetoothSingleton sharedInstance].C4==[BluetoothSingleton sharedInstance].Cmd4.count){
            [BluetoothSingleton sharedInstance].C4 = 0;
        }
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
