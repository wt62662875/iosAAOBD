//
//  FeedbackViewController.m
//  AAOBD
//
//  Created by wt on 15/1/21.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "FeedbackViewController.h"
#import "public.h"
#import "Alert.h"
#import "AppUtils.h"
#import "MBHUDView.h"
#import "ASIClient.h"
@interface FeedbackViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIButton *NextBtn;

@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textView.delegate = self;


    [_NextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(204, 0, 0, 1)] forState:UIControlStateNormal];
    [_NextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(153, 0, 0, 1)] forState:UIControlStateHighlighted];
    _NextBtn.layer.masksToBounds=YES;
    _NextBtn.layer.cornerRadius = 3;
    
    
    // Do any additional setup after loading the view.
}
//点击空白隐藏键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_textView resignFirstResponder];
}
- (IBAction)NextBtn:(id)sender {
    // app版本
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"-----------%@",app_Version);
    
    Alert *alv = [[Alert alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    
    if (![AppUtils nowstate]) {
        alv.message = @"暂无网络连接";
        [self.navigationController.view addSubview:alv];
    }else if ([_textView.text isEqualToString:@""]){
        alv.message = @"请填写你的意见";
        [self.navigationController.view addSubview:alv];
    }else{
        [MBHUDView hudWithBody:@"正在加载..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:0 show:YES];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *UserPhoneNomber = [userDefaults stringForKey:@"UserPhoneNomber"];
        
        NSDictionary * pas=[[NSDictionary alloc]initWithObjectsAndKeys:UserPhoneNomber,@"LoginName",_textView.text,@"content",app_Version,@"version", nil];
        [ASIClient POST_Path:@"/API/Mobile/OBD.ashx?method=addsuggestion&LoginName&content&version" params:pas completed:^(id JSON, NSString *stringData) {
            
            NSLog(@"%@",JSON);
            //拉取数据成功
            if (JSON != nil) {
                NSLog(@"请求成功");
                alv.message = @"感谢你宝贵的意见";
                [self.navigationController.view addSubview:alv];
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
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {//检测到“完成”
        [textView resignFirstResponder];//释放键盘
        return NO;
    }
    if (_textView.text.length==0){//textview长度为0
        if ([text isEqualToString:@""]) {//判断是否为删除键
            _label.hidden=NO;//隐藏文字
        }else{
            _label.hidden=YES;
        }
    }else{//textview长度不为0
        if (_textView.text.length==1){//textview长度为1时候
            if ([text isEqualToString:@""]) {//判断是否为删除键
                _label.hidden=NO;
            }else{//不是删除
                _label.hidden=YES;
            }
        }else{//长度不为1时候
            _label.hidden=YES;
        }
    }
    return YES;
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
- (IBAction)backClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
