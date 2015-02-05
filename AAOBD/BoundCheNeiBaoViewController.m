//
//  BoundCheNeiBaoViewController.m
//  AAOBD
//
//  Created by wt on 15/1/28.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "BoundCheNeiBaoViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "public.h"
#import "Alert.h"
#import "AppUtils.h"
#import "ASIClient.h"
#import "MBHUDView.h"

@import CoreBluetooth;

@interface BoundCheNeiBaoViewController ()<CBCentralManagerDelegate,CBPeripheralDelegate>
{
    NSString *GetIMEI;
}

@property (strong,nonatomic)CBCentralManager *centralManager;
@property (strong, nonatomic) NSMutableArray *peripherals;
@property (strong ,nonatomic) CBCharacteristic *writeCharacteristic;
@property (nonatomic, strong) CBPeripheral *peripheral;
@property (strong,nonatomic) NSMutableArray *nCharacteristics;
@property (strong,nonatomic) CBService *service;
@property (strong, nonatomic) IBOutlet UIView *IMEIlabel;
@property (strong, nonatomic) IBOutlet UITextField *IMEItextField;
@property (strong, nonatomic) IBOutlet UIButton *NextBtn;
@end

@implementation BoundCheNeiBaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _IMEIlabel.layer.borderWidth = 1;
    _IMEIlabel.layer.borderColor = RGBCOLORA(102, 102, 102, 1).CGColor;
    _IMEIlabel.layer.cornerRadius = 19;
    [_IMEItextField setValue:RGBCOLORA(153, 153, 153, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [_NextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(204, 0, 0, 1)] forState:UIControlStateNormal];
    [_NextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(153, 0, 0, 1)] forState:UIControlStateHighlighted];
    _NextBtn.layer.masksToBounds=YES;
    _NextBtn.layer.cornerRadius = 19;
    // Do any additional setup after loading the view.
    
    self.peripherals = [NSMutableArray array];
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self
                                                               queue:nil
                                                             options:nil];

}
//点击空白隐藏键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_IMEItextField  resignFirstResponder];
    
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
- (void)centralManager:(CBCentralManager *)central
 didDiscoverPeripheral:(CBPeripheral *)peripheral
     advertisementData:(NSDictionary *)advertisementData
                  RSSI:(NSNumber *)RSSI {

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

    _service = service;
    [service.characteristics enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        _writeCharacteristic = obj;
        _peripheral = peripheral;
        NSLog(@"------%@",_writeCharacteristic.UUID);
        if([_writeCharacteristic.UUID isEqual:[CBUUID UUIDWithString:@"FF01"]]) {
            
            NSData *xmldata1 = [@"@AT+HW!" dataUsingEncoding:NSASCIIStringEncoding];
            [_peripheral writeValue:xmldata1
                  forCharacteristic:_writeCharacteristic
                               type:CBCharacteristicWriteWithResponse];
        }
        
        if([_writeCharacteristic.UUID isEqual:[CBUUID UUIDWithString:@"FF02"]]) {
            
            [peripheral setNotifyValue:YES forCharacteristic:_writeCharacteristic];
        }
    }];
}
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    int f ;
    NSString *linshi = [[NSString alloc] initWithData:characteristic.value encoding:NSASCIIStringEncoding];
    NSString *linshi2 = [[NSString alloc] init];

    if([[[NSString alloc]initWithData:characteristic.value encoding:NSUTF8StringEncoding]rangeOfString:
        @"\r"].location != NSNotFound){
        f=1;
        linshi2 = [NSString stringWithFormat:@"%@%@",linshi2,linshi];
    }else {
        f=0;
        linshi2 = [NSString stringWithFormat:@"%@%@",linshi2,linshi];
    }
    if (f==1) {
        [_service.characteristics enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            _writeCharacteristic = obj;
            if([_writeCharacteristic.UUID isEqual:[CBUUID UUIDWithString:@"FF01"]]) {
                GetIMEI = linshi2;
                
                [self.centralManager stopScan];
                [self.centralManager cancelPeripheralConnection:self.peripheral];
            }
            
        }];

    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ConnectCarSwith:(id)sender {
    UISwitch *swichButton = (UISwitch *)sender;
    AVCaptureDevice *device =[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([swichButton isOn]) {
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOn];
        [device unlockForConfiguration];
    }else{
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOff];
        [device unlockForConfiguration];
    }
}
- (IBAction)PassBtn:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)BackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];    
}
- (IBAction)BoundOBD:(id)sender {
    Alert *alv = [[Alert alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    
    NSString *str = [NSString stringWithFormat:@"%@\r",_IMEItextField.text];
    NSLog(@"%@--%@",str,GetIMEI);
    if ([str isEqualToString:GetIMEI]) {
        if (![AppUtils nowstate]) {
            alv.image = @"error";
            alv.message = @"暂无网络连接";
            [self.navigationController.view addSubview:alv];
        }else{
            [MBHUDView hudWithBody:@"正在加载..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:0 show:YES];
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            NSString *UserPhoneNomber = [userDefaults stringForKey:@"UserPhoneNomber"];
            NSDictionary * pas=[[NSDictionary alloc]initWithObjectsAndKeys:UserPhoneNomber,@"LoginName",_IMEItextField.text,@"SerialCode", nil];
            [ASIClient POST_Path:@"/API/Mobile/OBD.ashx?method=bindobd&LoginName&SerialCode" params:pas completed:^(id JSON, NSString *stringData) {
                
                NSLog(@"json------------%@",JSON);
                
                //拉取数据成功
                if ([[JSON objectForKey:@"Result"] boolValue]) {
                    alv.image = @"Alert_check";
                    alv.message = @"绑定成功";
                    [self.navigationController.view addSubview:alv];
                    
                    [self.navigationController popToRootViewControllerAnimated:YES];
                }else{
                    alv.image = @"error";
                    alv.message = [JSON objectForKey:@"Msg"];
                    [self.navigationController.view addSubview:alv];
                }
                [MBHUDView dismissCurrentHUD];
                
            } failed:^(NSError *error) {
                //拉取失败,更多可能服务器关闭，手机无网络
                NSLog(@"当前无网络");
                [MBHUDView dismissCurrentHUD];
                
            }];
        }

    }else{
        alv.image = @"error";
        alv.message = @"IMEI号输入错误";
        [self.navigationController.view addSubview:alv];
    }
}
-(UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
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
