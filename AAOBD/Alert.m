//
//  Alert.m
//  AAOBD
//
//  Created by wt on 15/1/27.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "Alert.h"
#import "public.h"

@implementation Alert{
    UIView *alertview;
    UIView *view1;
    UIButton *sure;
}

- (void)drawRect:(CGRect)rect {
    self.backgroundColor = [UIColor lightGrayColor];
    self.alpha = 0.65;
    
    float width = 220;
    float heigh = 150;
    
    view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    view1.backgroundColor = [UIColor clearColor];
    [self.superview addSubview:view1];
    
    alertview = [[UIView alloc]initWithFrame:CGRectMake(SCREENWIDTH/2-width/2, 0, width, heigh)];
    alertview.backgroundColor = RGBCOLORA(228, 228, 228, 1);
    alertview.layer.cornerRadius = 4;
    alertview.alpha = 1;
    [view1 addSubview:alertview];
    
    sure = [UIButton buttonWithType:UIButtonTypeCustom];
    [sure setFrame:CGRectMake(-120, SCREENHTIGHT/2+heigh/2-50, 120, 30)];
    [sure setBackgroundImage:[self createImageWithColor:RGBCOLORA(255, 0, 0, 1)] forState:UIControlStateNormal];
    [sure setTitle:@"确定" forState:UIControlStateNormal];
    sure.titleLabel.textColor = [UIColor whiteColor];
    sure.titleLabel.font = [UIFont fontWithName:@"黑体-简" size:12];
    sure.layer.masksToBounds=YES;
    sure.layer.cornerRadius = 2;
    [sure addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
    [view1 addSubview:sure];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH/2-30, -60, 60, 60)];
    [image setImage:[UIImage imageNamed:_image]];
    [view1 addSubview:image];
    
    UILabel *lab1 = [[UILabel alloc]initWithFrame:CGRectMake(-140,SCREENHTIGHT/2-30 , 140, 30)];
    lab1.textColor = [UIColor blackColor];
    [lab1 setFont:[UIFont fontWithName:@"黑体-简" size:14]];
    lab1.textAlignment = NSTextAlignmentCenter;
    lab1.text = _message;
    [view1 addSubview:lab1];
    
    
    [UIView animateWithDuration:0.2 animations:^{
        alertview.layer.frame = CGRectMake(SCREENWIDTH/2-width/2, SCREENHTIGHT/2, width, heigh);
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            alertview.layer.frame = CGRectMake(SCREENWIDTH/2-width/2, SCREENHTIGHT/2-heigh/2, width, heigh);
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                sure.layer.frame =CGRectMake(SCREENWIDTH/2-60, SCREENHTIGHT/2+heigh/2-50, 120, 30);
                image.layer.frame =CGRectMake(SCREENWIDTH/2-30, SCREENHTIGHT/2-heigh/2-30, 60, 60);
                lab1.layer.frame = CGRectMake(SCREENWIDTH/2-70,SCREENHTIGHT/2-30 , 140, 30);
            } completion:^(BOOL finished) {
                
            }];
            
        }];
    }];
    
}
-(void)sureClick{
    [view1 removeFromSuperview];
    [self removeFromSuperview];
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
@end
