//
//  InsuranceViewController.m
//  AAOBD
//
//  Created by wt on 14/12/31.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "InsuranceViewController.h"
#import "Animation.h"
#import "Alert.h"
#import "public.h"

@interface InsuranceViewController ()
@property (strong, nonatomic) IBOutlet UIButton *btn1;
@property (strong, nonatomic) IBOutlet UIButton *btn2;
@property (strong, nonatomic) IBOutlet UIButton *btn3;
@property (strong, nonatomic) IBOutlet UIButton *btn4;

@end

@implementation InsuranceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}
- (IBAction)selectInsuranceClick:(id)sender {
    _btn1.enabled = NO;

    [Animation btnclick:sender rippleX:17 rippleY:17];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"InsuranceToComputing" sender:self];
        _btn1.enabled = YES;
    });
}
- (IBAction)NoOpenBtn:(id)sender {
    _btn2.enabled = NO;
    _btn3.enabled = NO;
    _btn4.enabled = NO;
    Alert *alv = [[Alert alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];

    [Animation btnclick:sender rippleX:17 rippleY:17];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        alv.message = @"此保险尚未开通！";
        [self.navigationController.view addSubview:alv];
        _btn2.enabled = YES;
        _btn3.enabled = YES;
        _btn4.enabled = YES;
    });

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
