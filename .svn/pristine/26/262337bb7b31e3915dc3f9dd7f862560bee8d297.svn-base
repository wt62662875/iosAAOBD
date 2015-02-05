//
//  SelectInsuranceViewController.m
//  AAOBD
//
//  Created by wt on 15/1/5.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "SelectInsuranceViewController.h"
#import "public.h"
#import "Animation.h"
#import "AlertView.h"
#import "HotComboAlertView.h"
#import "AllAlertView.h"
#import "ThirdMoneyAlertView.h"
@interface SelectInsuranceViewController ()<AlertViewdelegate,HotComboViewdelegate,AllViewdelegate,ThirdMoneyViewdelegate>
{

}
@property (strong, nonatomic) IBOutlet UIButton *NextBtn;
@property (strong, nonatomic) IBOutlet UILabel *MoneyLab;
@property (strong, nonatomic) IBOutlet UIButton *ThirdMoneyBtn;

@end

@implementation SelectInsuranceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_NextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(204, 0, 0, 1)] forState:UIControlStateNormal];
    [_NextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(153, 0, 0, 1)] forState:UIControlStateHighlighted];
    _NextBtn.layer.masksToBounds=YES;
    _NextBtn.layer.cornerRadius = 3;
    // Do any additional setup after loading the view.
}
- (IBAction)ThirdMoneyClick:(id)sender {
    ThirdMoneyAlertView *tmav = [[ThirdMoneyAlertView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    tmav.delegate = self;
    [self.navigationController.view addSubview:tmav];
}

- (IBAction)HotComboClick:(id)sender {
    HotComboAlertView *hav = [[HotComboAlertView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    hav.delegate = self;
    [self.navigationController.view addSubview:hav];
}
- (IBAction)AllClick:(id)sender {
    AllAlertView *aav = [[AllAlertView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    aav.delegate = self;
    [self.navigationController.view addSubview:aav];
}
- (IBAction)BasicClick:(id)sender {
    AlertView *alv = [[AlertView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    alv.delegate = self;
    [self.navigationController.view addSubview:alv];
}
//基本套餐
-(void)AlertViewSend:(NSMutableArray *)array{
    NSLog(@"%@",array);
    _MoneyLab.text = @"8888";
}
//热门套餐
-(void)HotComboAlertSend:(NSMutableArray *)array{
    NSLog(@"%@",array);
}
//全保套餐
-(void)AllAlertSend:(NSMutableArray *)array{
    NSLog(@"%@",array);
}
//第三方责任险
-(void)ThirdMoneyViewSend:(NSString *)str{
    NSLog(@"%@",str);
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
