//
//  VoicePromptViewController.m
//  AAOBD
//
//  Created by wt on 15/1/12.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "VoicePromptViewController.h"
#import "public.h"

@interface VoicePromptViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UISwitch *swichBtn;
@property (strong, nonatomic) IBOutlet UIProgressView *speedProgress;
@property (strong, nonatomic) IBOutlet UIProgressView *WaterTemperatureProgress;
@property (strong, nonatomic) IBOutlet UIStepper *speedStepper;
@property (strong, nonatomic) IBOutlet UIStepper *WaterTemperatureStepper;

@end

@implementation VoicePromptViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _scrollView.contentSize = CGSizeMake(0, 560);
    [_scrollView setScrollEnabled:YES];
    _scrollView.showsVerticalScrollIndicator = NO;
    
    _speedProgress.layer.masksToBounds = YES;
    _speedProgress.layer.cornerRadius = 5.0f;
    _WaterTemperatureProgress.layer.masksToBounds = YES;
    _WaterTemperatureProgress.layer.cornerRadius = 5.0f;
    
    // Do any additional setup after loading the view.
}
- (IBAction)speedStepper:(id)sender {
    switch ((int)_speedStepper.value) {
        case 0:
            _speedProgress.progress = 0;
            break;
        case 1:
            _speedProgress.progress = 0.143;
            break;
        case 2:
            _speedProgress.progress = 0.286;
            break;
        case 3:
            _speedProgress.progress = 0.429;
            break;
        case 4:
            _speedProgress.progress = 0.572;
            break;
        case 5:
            _speedProgress.progress = 0.715;
            break;
        case 6:
            _speedProgress.progress = 0.858;
            break;
        case 7:
            _speedProgress.progress = 1;
            break;
        case 8:
            _speedStepper.value = 7;
            break;
        default:
            break;
    }
//    _speedProgress.progress = 0.125;
    
}
- (IBAction)WaterTemperatureStepper:(id)sender {
    switch ((int)_WaterTemperatureStepper.value) {
        case 0:
            _WaterTemperatureProgress.progress = 0;
            break;
        case 1:
            _WaterTemperatureProgress.progress = 0.167;
            break;
        case 2:
            _WaterTemperatureProgress.progress = 0.333;
            break;
        case 3:
            _WaterTemperatureProgress.progress = 0.5;
            break;
        case 4:
            _WaterTemperatureProgress.progress = 0.667;
            break;
        case 5:
            _WaterTemperatureProgress.progress = 0.834;
            break;
        case 6:
            _WaterTemperatureProgress.progress = 1;
            break;
        case 7:
            _WaterTemperatureStepper.value = 6;
            break;
        default:
            break;
    }

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
