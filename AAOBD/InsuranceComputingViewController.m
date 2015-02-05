//
//  InsuranceComputingViewController.m
//  AAOBD
//
//  Created by wt on 14/12/31.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "InsuranceComputingViewController.h"
#import "public.h"
#import "Alert.h"
#import "PersonalDataViewController.h"
@interface InsuranceComputingViewController ()
@property (strong, nonatomic) IBOutlet UITextField *PlateNumberText;
@property (strong, nonatomic) IBOutlet UITextField *CarFrameText;
@property (strong, nonatomic) IBOutlet UITextField *EngineText;
@property (strong, nonatomic) IBOutlet UIButton *NextBtn;

@end

@implementation InsuranceComputingViewController{
    UIView *backView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [_PlateNumberText setValue:RGBCOLORA(153, 153, 153, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [_CarFrameText setValue:RGBCOLORA(153, 153, 153, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [_EngineText setValue:RGBCOLORA(153, 153, 153, 1) forKeyPath:@"_placeholderLabel.textColor"];

    [_NextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(204, 0, 0, 1)] forState:UIControlStateNormal];
    [_NextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(153, 0, 0, 1)] forState:UIControlStateHighlighted];
    _NextBtn.layer.masksToBounds=YES;
    _NextBtn.layer.cornerRadius = 3;
    
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

- (IBAction)pickDateClick:(id)sender {
    [[UIApplication sharedApplication].keyWindow endEditing:NO];
    
    PickerDateView *pickdate =[[[NSBundle mainBundle]loadNibNamed:@"PickerDate" owner:self options:nil] objectAtIndex:0];
//
    pickdate.delegate = self;
    [pickdate setCenter:CGPointMake( self.view.bounds.size.width/2.0,  self.view.bounds.size.height-130)];
    [pickdate.datePicker setMaximumDate:[NSDate date]];
    CATransition *animation = [CATransition  animation];
    animation.delegate = self;
    animation.duration = 0.3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromTop;
    [pickdate setAlpha:1.0f];
    [pickdate.layer addAnimation:animation forKey:@"pushIn"];
    
    backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    backView.backgroundColor = [UIColor whiteColor];
    backView.alpha = 0.5;
    [self.navigationController.view addSubview:backView];
    [self.navigationController.view addSubview:pickdate];

}
-(void)sendtime:(NSString *)time{
    [backView removeFromSuperview];
    [_datePickBtn setTitle:time forState:UIControlStateNormal];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)NextPageBtn:(id)sender {
    Alert *alv = [[Alert alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    
    if ([_datePickBtn.titleLabel.text isEqualToString:@"请输入购车时间"]||[_PlateNumberText.text isEqualToString:@""]||[_CarFrameText.text isEqualToString:@""]||[_EngineText.text isEqualToString:@""]) {
        alv.image = @"error";
        alv.message = @"请完善资料";
        [self.navigationController.view addSubview:alv];
    }else{
        [self performSegueWithIdentifier:@"InsuranceToPersonalData" sender:self];
    }

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"InsuranceToPersonalData"]) {
        PersonalDataViewController *pdvc = segue.destinationViewController;
        [pdvc setBuyCarTime:_datePickBtn.titleLabel.text];
        [pdvc setCarNumber:_PlateNumberText.text];
        [pdvc setCarFrame:_CarFrameText.text];
        [pdvc setCarEngine:_EngineText.text];
    }
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
