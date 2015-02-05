//
//  FindPasswordViewController.m
//  AAOBD
//
//  Created by wt on 15/1/27.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "FindPasswordViewController.h"
#import "public.h"
#import "AppUtils.h"
#import "ASIClient.h"
#import "MBHUDView.h"
#import "Alert.h"
@interface FindPasswordViewController ()
@property (strong, nonatomic) IBOutlet UITextField *sendPassWordText;
@property (strong, nonatomic) IBOutlet UITextField *SendSurePassWordText;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;
@property (strong, nonatomic) IBOutlet UIView *PasswordView;
@property (strong, nonatomic) IBOutlet UIView *secendPasswordView;
@end

@implementation FindPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _PasswordView.layer.borderWidth = 1;
    _PasswordView.layer.borderColor = RGBCOLORA(102, 102, 102, 1).CGColor;
    _PasswordView.layer.cornerRadius = 19;
    _secendPasswordView.layer.borderWidth = 1;
    _secendPasswordView.layer.borderColor = RGBCOLORA(102, 102, 102, 1).CGColor;
    _secendPasswordView.layer.cornerRadius = 19;
    [_sendPassWordText setValue:RGBCOLORA(153, 153, 153, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [_SendSurePassWordText setValue:RGBCOLORA(153, 153, 153, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [_nextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(204, 0, 0, 1)] forState:UIControlStateNormal];
    [_nextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(153, 0, 0, 1)] forState:UIControlStateHighlighted];
    _nextBtn.layer.masksToBounds=YES;
    _nextBtn.layer.cornerRadius = 19;
    // Do any additional setup after loading the view.
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
- (IBAction)NextBtn:(id)sender {
    Alert *alv = [[Alert alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];

    if (![AppUtils nowstate]) {
        alv.image = @"error";
        alv.message = @"暂无网络连接";
        [self.navigationController.view addSubview:alv];
    }else if([_SendSurePassWordText.text isEqualToString:@""]){
        alv.image = @"error";
        alv.message = @"请再次输入密码";
        [self.navigationController.view addSubview:alv];
    }else if ([_sendPassWordText.text isEqualToString:@""]){
        alv.image = @"error";
            alv.message = @"请输入密码";
            [self.navigationController.view addSubview:alv];
    }else if(![_sendPassWordText.text isEqualToString:_SendSurePassWordText.text]){
        alv.image = @"error";
        alv.message = @"两次输入的密码不同";
        [self.navigationController.view addSubview:alv];
    }else{
        [MBHUDView hudWithBody:@"正在加载..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:0 show:YES];
        NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
        NSString *UserPhoneNomber = [userDefaultes stringForKey:@"UserPhoneNomber"];
        NSDictionary * pas=[[NSDictionary alloc]initWithObjectsAndKeys:UserPhoneNomber,@"LoginName",_SendSurePassWordText.text,@"resetpwd", nil];
        [ASIClient POST_Path:@"/API/Mobile/OBD.ashx?method=getback&LoginName&resetpwd" params:pas completed:^(id JSON, NSString *stringData) {
            
            NSLog(@"json------------%@------%@",JSON,[JSON objectForKey:@"Msg"]);
            
            //拉取数据成功
            if ([[JSON objectForKey:@"Result"] boolValue]) {
                NSLog(@"请求成功");
                alv.image = @"Alert_check";
                alv.message = @"密码修改成功";
                [self.navigationController.view addSubview:alv];
                [self.navigationController popToRootViewControllerAnimated:YES];

                
            }
            [MBHUDView dismissCurrentHUD];
            
        } failed:^(NSError *error) {
            //拉取失败,更多可能服务器关闭，手机无网络
            NSLog(@"当前无网络");
            [MBHUDView dismissCurrentHUD];
            
        }];
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)BackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
