//
//  PickerDateView.m
//  AAOBD
//
//  Created by wt on 15/1/2.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "PickerDateView.h"
#import "public.h"
#import "InsuranceComputingViewController.h"
@implementation PickerDateView
{
    NSString *pickDate;
    UIView *backView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */

- (void)drawRect:(CGRect)rect {
    // Drawing code

    [self setFrame:CGRectMake(0, SCREENHTIGHT-250, SCREENWIDTH, 250)];
    self.layer.cornerRadius = 8;
}

- (IBAction)cancelBtn:(id)sender {
    CATransition *animation = [CATransition  animation];
    animation.delegate = self;
    animation.duration = 0.3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromBottom;
    [self setAlpha:0.0f];
    [_datePicker.layer addAnimation:animation forKey:@"TSLocateView"];
    [self.delegate sendtime:@"请输入购车时间"];
}
- (IBAction)ensureBtn:(id)sender {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString* selectedDate=[NSString stringWithFormat:@"%@",[formatter stringFromDate:_datePicker.date]];
    
    CATransition *animation = [CATransition  animation];
    animation.delegate = self;
    animation.duration = 0.3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromBottom;
    [self setAlpha:0.0f];
    [_datePicker.layer addAnimation:animation forKey:@"TSLocateView"];
    [self.delegate sendtime:selectedDate];

}

@end
