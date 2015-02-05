//
//  PasswordSetViewController.m
//  AAOBD
//
//  Created by wt on 14/12/26.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "PasswordSetViewController.h"
#import "public.h"
#import "AppUtils.h"
#import "ASIClient.h"
#import "MBHUDView.h"
#import "Alert.h"
@interface PasswordSetViewController ()
@property (strong, nonatomic) IBOutlet UIView *NicknameView;
@property (strong, nonatomic) IBOutlet UIView *PasswordView;
@property (strong, nonatomic) IBOutlet UIView *secendPasswordView;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;
@property (strong, nonatomic) IBOutlet UIButton *checkBtn;
@property (strong, nonatomic) IBOutlet UITextField *NickNameText;
@property (strong, nonatomic) IBOutlet UITextField *PassWordText;
@property (strong, nonatomic) IBOutlet UITextField *SurePassWordText;

@end

@implementation PasswordSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _NicknameView.layer.borderWidth = 1;
    _NicknameView.layer.borderColor = RGBCOLORA(102, 102, 102, 1).CGColor;
    _NicknameView.layer.cornerRadius = 19;
    _PasswordView.layer.borderWidth = 1;
    _PasswordView.layer.borderColor = RGBCOLORA(102, 102, 102, 1).CGColor;
    _PasswordView.layer.cornerRadius = 19;
    _secendPasswordView.layer.borderWidth = 1;
    _secendPasswordView.layer.borderColor = RGBCOLORA(102, 102, 102, 1).CGColor;
    _secendPasswordView.layer.cornerRadius = 19;
    
    [_nextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(204, 0, 0, 1)] forState:UIControlStateNormal];
    [_nextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(153, 0, 0, 1)] forState:UIControlStateHighlighted];
    _nextBtn.layer.masksToBounds=YES;
    _nextBtn.layer.cornerRadius = 19;
    
    [_checkBtn setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [_checkBtn setImage:[UIImage imageNamed:@"check_Checked"] forState:UIControlStateSelected];

    [_checkBtn addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];

    [_NickNameText setValue:RGBCOLORA(153, 153, 153, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [_PassWordText setValue:RGBCOLORA(153, 153, 153, 1) forKeyPath:@"_placeholderLabel.textColor"];


}
-(void)checkboxClick:(UIButton *)btn
{
    
    btn.selected = !btn.selected;
}
- (IBAction)NextBtn:(id)sender {
//    Alert *alv = [[Alert alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
//    
//    if (![AppUtils nowstate]) {
//    alv.image = @"error";
//        alv.message = @"暂无网络连接";
//        [self.navigationController.view addSubview:alv];
//    }else if([_PassWordText.text isEqualToString:@""]){
//    alv.image = @"error";
//        alv.message = @"请输入密码";
//        [self.navigationController.view addSubview:alv];
//    }else if([_NickNameText.text isEqualToString:@""]){
//    alv.image = @"error";
//        alv.message = @"请输入昵称";
//        [self.navigationController.view addSubview:alv];
//    }else if ([_SurePassWordText.text isEqualToString:@""]){
//    alv.image = @"error";
//        alv.message = @"请再次输入密码";
//        [self.navigationController.view addSubview:alv];
//    }else if(![_PassWordText.text isEqualToString:_SurePassWordText.text]){
//    alv.image = @"error";
//        alv.message = @"两次输入的密码不同";
//        [self.navigationController.view addSubview:alv];    }else if (!_checkBtn.selected){
//    alv.image = @"error";
//            alv.message = @"请允许使用条款后继续";
//            [self.navigationController.view addSubview:alv];
//    }else{
//        [MBHUDView hudWithBody:@"正在加载..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:0 show:YES];
//        NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
//        NSString *UserPhoneNomber = [userDefaultes stringForKey:@"UserPhoneNomber"];
//        NSDictionary * pas=[[NSDictionary alloc]initWithObjectsAndKeys:UserPhoneNomber,@"LoginName",_PassWordText.text,@"Pwd",_NickNameText.text,@"username", nil];
//        [ASIClient POST_Path:@"/API/Mobile/OBD.ashx?method=registe&LoginName&Pwd&username" params:pas completed:^(id JSON, NSString *stringData) {
//            
//            NSLog(@"json------------%@---------%@",JSON,[JSON objectForKey:@"Msg"]);
//            
//            //拉取数据成功
//            if ([[JSON objectForKey:@"Result"] boolValue]) {
//                NSLog(@"请求成功");
                [self performSegueWithIdentifier:@"SetPassWordToBoundCheNeiBao" sender:self];
//                
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
