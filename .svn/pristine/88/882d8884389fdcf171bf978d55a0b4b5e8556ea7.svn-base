//
//  FootViewController.m
//  AAOBD
//
//  Created by wt on 14/12/23.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "FootViewController.h"
#import "public.h"
#import "Alert.h"
#import "AppUtils.h"
#import "ASIClient.h"
#import "MBHUDView.h"
#import "SelectBrandViewController.h"
@interface FootViewController ()
@property (strong, nonatomic) IBOutlet UIView *PhoneNumberView;
@property (strong, nonatomic) IBOutlet UIView *PassWordView;
@property (strong, nonatomic) IBOutlet UIButton *LoginBtn;
@property (strong, nonatomic) IBOutlet UITextField *PhoneNumberTextField;
@property (strong, nonatomic) IBOutlet UITextField *PassWordTextField;

@end

@implementation FootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *UserPhoneNomber = [userDefaults stringForKey:@"UserPhoneNomber"];
    NSString *UserPassword = [userDefaults  stringForKey:@"UserPassword"];
    _PhoneNumberTextField.text = UserPhoneNomber;
    _PassWordTextField.text = UserPassword;
    [_LoginBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(204, 0, 0, 1)] forState:UIControlStateNormal];
    [_LoginBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(153, 0, 0, 1)] forState:UIControlStateHighlighted];
    _PhoneNumberView.layer.borderWidth = 1;
    _PhoneNumberView.layer.borderColor = RGBCOLORA(102, 102, 102, 1).CGColor;
    _PhoneNumberView.layer.cornerRadius = 19;
    _PassWordView.layer.borderWidth = 1;
    _PassWordView.layer.borderColor = RGBCOLORA(102, 102, 102, 1).CGColor;
    _PassWordView.layer.cornerRadius = 19;
    _LoginBtn.layer.masksToBounds=YES;
    _LoginBtn.layer.cornerRadius = 19;
    
    [self.navigationController setNavigationBarHidden:YES];
    // Do any additional setup after loading the view.

}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setShadowImage:[self createImageWithColor:RGBCOLORA(38, 40, 46, 1)]];
    [self.navigationController setNavigationBarHidden:YES];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *UserPhoneNomber = [userDefaults stringForKey:@"UserPhoneNomber"];
    _PhoneNumberTextField.text =UserPhoneNomber;
    NSString *UserPassword = [userDefaults stringForKey:@"UserPassword"];
    _PassWordTextField.text =UserPassword;

}
//点击空白隐藏键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_PhoneNumberTextField resignFirstResponder];
    [_PassWordTextField resignFirstResponder];
    
}
- (IBAction)signInBtn:(id)sender {
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    [self performSegueWithIdentifier:@"FootToFrist" sender:self];
//                [userDefaults setObject:_PassWordTextField.text forKey:@"UserPassword"];
//                [userDefaults setObject:[JSON objectForKey:@"Checkedcarid"] forKey:@"Checkedcarid"];
//                NSLog(@"%@",[JSON objectForKey:@"Checkedcarid"]);
//                NSString *checkcarid = [NSString stringWithFormat:@"%@",[JSON objectForKey:@"Checkedcarid"]];
//                if ([checkcarid isEqualToString:@"0"]) {
//                    [self.navigationController setNavigationBarHidden:NO];
//                    UIStoryboard *storbord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//                    SelectBrandViewController *sbvc = [storbord instantiateViewControllerWithIdentifier:@"selectBrandViewController"];
//                    [self.navigationController pushViewController:sbvc animated:YES];
//                }else{
//                    [self performSegueWithIdentifier:@"FootToFrist" sender:self];
//                }
//            }else{
//    alv.image = @"error";
//                alv.message = @"帐号或密码错误";
//                [self.navigationController.view addSubview:alv];
//            }
//            [MBHUDView dismissCurrentHUD];
//            
//        } failed:^(NSError *error) {
//            //拉取失败,更多可能服务器关闭，手机无网络
//            NSLog(@"当前无网络");
//            [MBHUDView dismissCurrentHUD];
//            
//        }];
//    }

    Alert *alv = [[Alert alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    
    if (![AppUtils nowstate]) {
        alv.image = @"error";
        alv.message = @"暂无网络连接";
        [self.navigationController.view addSubview:alv];
    }else if([_PhoneNumberTextField.text isEqualToString:@""]||[_PassWordTextField.text isEqualToString:@""]){
        alv.image = @"error";
        alv.message = @"请正确输入帐号密码";
         [self.navigationController.view addSubview:alv];
    }else{
        [MBHUDView hudWithBody:@"正在加载..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:0 show:YES];
        NSDictionary * pas=[[NSDictionary alloc]initWithObjectsAndKeys:_PhoneNumberTextField.text,@"LoginName",_PassWordTextField.text,@"pwd", nil];
        [ASIClient POST_Path:@"/API/Mobile/OBD.ashx?method=login&LoginName&pwd" params:pas completed:^(id JSON, NSString *stringData) {
            
            NSLog(@"json------------%@",JSON);
            
            //拉取数据成功
            if ([[JSON objectForKey:@"LoginState"] boolValue]) {
                NSLog(@"请求成功");
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                [userDefaults setObject:_PhoneNumberTextField.text forKey:@"UserPhoneNomber"];
                [userDefaults setObject:_PassWordTextField.text forKey:@"UserPassword"];
                [userDefaults setObject:[JSON objectForKey:@"Checkedcarid"] forKey:@"Cheqckedcarid"];
                [userDefaults setObject:[JSON objectForKey:@"UserID"] forKey:@"UserID"];
                [userDefaults setObject:[JSON objectForKey:@"Deduction"] forKey:@"SaveMoney"];
                [userDefaults setObject:[JSON objectForKey:@"Key"] forKey:@"Key"];
                [userDefaults setObject:[JSON objectForKey:@"LastMileage"] forKey:@"LastMileage"];
                [userDefaults setObject:[JSON objectForKey:@"Nicename"] forKey:@"Nicename"];
                
                
                NSString *checkcarid = [NSString stringWithFormat:@"%@",[JSON objectForKey:@"Checkedcarid"]];
                if ([checkcarid isEqualToString:@"0"]) {
                    [self.navigationController setNavigationBarHidden:NO];
                    UIStoryboard *storbord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    SelectBrandViewController *sbvc = [storbord instantiateViewControllerWithIdentifier:@"selectBrandViewController"];
                    [self.navigationController pushViewController:sbvc animated:YES];
                }else{
                    [self performSegueWithIdentifier:@"FootToFrist" sender:self];
                }
            }else{
                alv.image = @"error";
                alv.message = @"帐号或密码错误";
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

@end
