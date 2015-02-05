//
//  ForgetPasswordViewController.m
//  AAOBD
//
//  Created by wt on 14/12/26.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "public.h"
#import "AppUtils.h"
#import "ASIClient.h"
#import "MBHUDView.h"
#import "Alert.h"
@interface ForgetPasswordViewController ()
{
    int ttimer;
    NSTimer *countDownTimer;
}
@property (strong, nonatomic) IBOutlet UIButton *GetSecurityCodeBtn;
@property (strong, nonatomic) IBOutlet UIView *PhonenumberView;
@property (strong, nonatomic) IBOutlet UIView *SignView;
@property (strong, nonatomic) IBOutlet UIButton *NextPageBtn;
@property (strong, nonatomic) IBOutlet UITextField *PhoneNumberText;
@property (strong, nonatomic) IBOutlet UITextField *VerificationCodetext;
@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    _PhonenumberView.layer.borderWidth = 1;
    _PhonenumberView.layer.borderColor = RGBCOLORA(102, 102, 102, 1).CGColor;
    _PhonenumberView.layer.cornerRadius = 19;
    _SignView.layer.borderWidth = 1;
    _SignView.layer.borderColor = RGBCOLORA(102, 102, 102, 1).CGColor;
    _SignView.layer.cornerRadius = 19;
    [_NextPageBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(204, 0, 0, 1)] forState:UIControlStateNormal];
    [_NextPageBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(153, 0, 0, 1)] forState:UIControlStateHighlighted];
    _NextPageBtn.layer.masksToBounds=YES;
    _NextPageBtn.layer.cornerRadius = 19;
    [_PhoneNumberText setValue:RGBCOLORA(153, 153, 153, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [_VerificationCodetext setValue:RGBCOLORA(153, 153, 153, 1) forKeyPath:@"_placeholderLabel.textColor"];
    // Do any additional setup after loading the view.
}
- (IBAction)NextPageBtn:(id)sender {
    Alert *alv = [[Alert alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    
    if (![AppUtils nowstate]) {
        alv.image = @"error";
        alv.message = @"暂无网络连接";
        [self.navigationController.view addSubview:alv];
    }else if([_PhoneNumberText.text isEqualToString:@""] ){
        alv.image = @"error";
        alv.message = @"请输入手机号";
        [self.navigationController.view addSubview:alv];
    }else if([_VerificationCodetext.text isEqualToString:@""]){
        alv.image = @"error";
        alv.message = @"请填写验证码";
        [self.navigationController.view addSubview:alv];
    }else{
        
        [MBHUDView hudWithBody:@"正在加载..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:0 show:YES];
        NSDictionary * pas=[[NSDictionary alloc]initWithObjectsAndKeys:_VerificationCodetext.text,@"VerifyCode",_PhoneNumberText.text,@"LoginName", nil];
        [ASIClient POST_Path:@"/API/Mobile/OBD.ashx?method=checkcode&LoginName&VerifyCode" params:pas completed:^(id JSON, NSString *stringData) {
            
            NSLog(@"json------------%@",JSON);
            
            //拉取数据成功
            if ([[JSON objectForKey:@"Result"] boolValue]) {
                NSLog(@"验证成功");
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                [userDefaults setObject:_PhoneNumberText.text forKey:@"UserPhoneNomber"];
                
                [self performSegueWithIdentifier:@"ForgetToSet" sender:self];
            }else{
                alv.image = @"error";
                alv.message = @"验证失败，稍后重试";
                [self.navigationController.view addSubview:alv];
            }
            [MBHUDView dismissCurrentHUD];
            
        } failed:^(NSError *error) {
            //拉取失败,更多可能服务器关闭，手机无网络
            NSLog(@"当前无网络");
            [MBHUDView dismissCurrentHUD];
            
        }];
    }

}
//获取验证码
- (IBAction)GetSecurityCodeClick:(id)sender {
    
    Alert *alv = [[Alert alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    
    NSDictionary * pas=[[NSDictionary alloc]initWithObjectsAndKeys:_PhoneNumberText.text,@"LoginName", nil];
    [ASIClient POST_Path:@"/API/Mobile/OBD.ashx?method=check&LoginName" params:pas completed:^(id JSON, NSString *stringData) {
        NSLog(@"json------------%@",JSON);
        if ([[JSON objectForKey:@"Result"] boolValue]) {
            alv.image = @"error";
            alv.message = @"你的手机号尚未注册";
            [self.navigationController.view addSubview:alv];        }
        else{
            if (![AppUtils nowstate]) {
                alv.image = @"error";
                alv.message = @"暂无网络连接";
                [self.navigationController.view addSubview:alv];
            }else if([_PhoneNumberText.text isEqualToString:@""] ||![AppUtils isValidateMobile:_PhoneNumberText.text]){
                alv.image = @"error";
                alv.message = @"请输入正确手机号";
                [self.navigationController.view addSubview:alv];
            }else{
                
                _GetSecurityCodeBtn.enabled = NO;
                ttimer = 60;
                countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
                [countDownTimer fire];
                
                NSDictionary * pas=[[NSDictionary alloc]initWithObjectsAndKeys:_PhoneNumberText.text,@"LoginName", nil];
                [ASIClient POST_Path:@"/API/Mobile/OBD.ashx?method=sendcode&LoginName" params:pas completed:^(id JSON, NSString *stringData) {
                    
                    NSLog(@"json------------%@",JSON);
                    
                    //拉取数据成功
                    if ([[JSON objectForKey:@"doResult"] boolValue]) {
                        NSLog(@"请求成功");
                    }
                    
                }
                              failed:^(NSError *error) {
                                  //拉取失败,更多可能服务器关闭，手机无网络
                                  NSLog(@"当前无网络");
                              }];
            }

        
        }
        
    } failed:^(NSError *error) {
        //拉取失败,更多可能服务器关闭，手机无网络
        NSLog(@"当前无网络");
    }];

}
-(void)timeFireMethod{
    ttimer = ttimer -1 ;
    [ _GetSecurityCodeBtn setTitle:[NSString stringWithFormat:@"(%d秒)后重新获取验证码",ttimer] forState:UIControlStateNormal ] ;
    
    if (ttimer == 0) {
        _GetSecurityCodeBtn.enabled = YES;
        [ _GetSecurityCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal] ;
        
        [countDownTimer invalidate];
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)BackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

}
@end
