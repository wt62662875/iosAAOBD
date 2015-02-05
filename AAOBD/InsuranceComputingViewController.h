//
//  InsuranceComputingViewController.h
//  AAOBD
//
//  Created by wt on 14/12/31.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerDateView.h"

@interface InsuranceComputingViewController : UIViewController<PickDateViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *datePickBtn;

@end
