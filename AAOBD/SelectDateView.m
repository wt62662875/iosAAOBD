//
//  SelectDateView.m
//  AAOBD
//
//  Created by oi on 23/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "SelectDateView.h"

@implementation SelectDateView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // add subviews
    }
    return self;
}
- (IBAction)onclickSelectBtn:(UIButton *)sender {
    
    CATransition *animation = [CATransition  animation];
    animation.delegate = self;
    animation.duration = 0.3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromBottom;
    [self setAlpha:0.0f];
    [_datePicker.layer addAnimation:animation forKey:@"TSLocateView"];
    
    
    NSDate * lDtae =_datePicker.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *fromdate=[dateFormatter stringFromDate:lDtae];
    NSString *fromdate1 =[NSString  stringWithFormat:@"< %@ >",fromdate];

    [_delegate selectTime:fromdate1];
}
- (IBAction)onclickCancelBtn:(UIButton *)sender {
    
    CATransition *animation = [CATransition  animation];
    animation.delegate = self;
    animation.duration = 0.3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromBottom;
    [self setAlpha:0.0f];
    [_datePicker.layer addAnimation:animation forKey:@"TSLocateView"];
}

@end
