//
//  PersonalDataViewController.m
//  AAOBD
//
//  Created by wt on 15/1/5.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "PersonalDataViewController.h"
#import "public.h"
#import "Alert.h"
@interface PersonalDataViewController ()
{
    BOOL IsGender;//1表示男，0表示女
}
@property (strong, nonatomic) IBOutlet UITextField *NameText;
@property (strong, nonatomic) IBOutlet UITextField *PhoneNubmerText;
@property (strong, nonatomic) IBOutlet UITextField *IdCardText;
@property (strong, nonatomic) IBOutlet UIButton *MenBtn;
@property (strong, nonatomic) IBOutlet UIButton *WomenBtn;
@property (strong, nonatomic) IBOutlet UIButton *NextBtn;

@end

@implementation PersonalDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_NameText setValue:RGBCOLORA(153, 153, 153, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [_PhoneNubmerText setValue:RGBCOLORA(153, 153, 153, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [_IdCardText setValue:RGBCOLORA(153, 153, 153, 1) forKeyPath:@"_placeholderLabel.textColor"];
    
    [_NextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(204, 0, 0, 1)] forState:UIControlStateNormal];
    [_NextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(153, 0, 0, 1)] forState:UIControlStateHighlighted];
    _NextBtn.layer.masksToBounds=YES;
    _NextBtn.layer.cornerRadius = 3;
    
    // Do any additional setup after loading the view.
    
    NSLog(@"%@-%@-%@-%@",_BuyCarTime,_CarNumber,_CarFrame,_CarEngine);
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
- (IBAction)NextPageBtn:(id)sender {
    Alert *alv = [[Alert alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    if (IsGender == 1) {
        NSLog(@"男");
    }else if(IsGender == 0){
        NSLog(@"女");
    }
    if ([_NameText.text isEqualToString:@""]||[_PhoneNubmerText.text isEqualToString:@""]||[_IdCardText.text isEqualToString:@""]) {
        alv.image = @"error";
        alv.message = @"请完善资料";
        [self.navigationController.view addSubview:alv];
    }else{
        
        [self performSegueWithIdentifier:@"PersonalToSelect" sender:self];
    }
}

- (IBAction)MenClick:(id)sender {
    if (!_MenBtn.selected) {
        [_MenBtn setImage:[UIImage imageNamed:@"boy_clikced"] forState:UIControlStateNormal];
        [_WomenBtn setImage:[UIImage imageNamed:@"girl"] forState:UIControlStateNormal];
        IsGender = 1;
    }
}
- (IBAction)WomenClick:(id)sender {
    if (!_WomenBtn.selected) {
        [_WomenBtn setImage:[UIImage imageNamed:@"girl_clicked"] forState:UIControlStateNormal];
        [_MenBtn setImage:[UIImage imageNamed:@"boy"] forState:UIControlStateNormal];
        IsGender = 0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backClick:(id)sender {
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
