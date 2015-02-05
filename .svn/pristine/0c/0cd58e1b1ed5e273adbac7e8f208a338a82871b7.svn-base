//
//  ThirdMoneyAlertView.m
//  AAOBD
//
//  Created by wt on 15/2/4.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "ThirdMoneyAlertView.h"
#import "public.h"

@implementation ThirdMoneyAlertView
{
    UIView *alertview;
    UIView *view1;
    UIButton *sure;
}
- (void)drawRect:(CGRect)rect {
    self.backgroundColor = [UIColor lightGrayColor];
    self.alpha = 0.65;
    
    float width = 220;
    float heigh = 310;
    
    view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    view1.backgroundColor = [UIColor clearColor];
    [self.superview addSubview:view1];
    
    alertview = [[UIView alloc]initWithFrame:CGRectMake(SCREENWIDTH/2-width/2, 0, width, heigh)];
    alertview.backgroundColor = RGBCOLORA(228, 228, 228, 1);
    alertview.layer.cornerRadius = 4;
    alertview.alpha = 1;
    [view1 addSubview:alertview];
    
    sure = [UIButton buttonWithType:UIButtonTypeCustom];
    [sure setFrame:CGRectMake(-180, SCREENHTIGHT/2+heigh/2-50, 180, 30)];
    [sure setBackgroundImage:[self createImageWithColor:RGBCOLORA(102, 102, 102, 1)] forState:UIControlStateNormal];
    [sure setTitle:@"取消" forState:UIControlStateNormal];
    sure.titleLabel.textColor = [UIColor whiteColor];
    sure.titleLabel.font = [UIFont fontWithName:@"黑体-简" size:12];
    sure.layer.masksToBounds=YES;
    sure.layer.cornerRadius = 2;
    [sure addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
    [view1 addSubview:sure];
    
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, 30)];
    [image setImage:[UIImage imageNamed:@"alert头"]];
    [alertview addSubview:image];
    
    UILabel *lab1 = [[UILabel alloc]initWithFrame:CGRectMake(width/2-75,0 , 150, 30)];
    lab1.textColor = [UIColor whiteColor];
    [lab1 setFont:[UIFont fontWithName:@"黑体-简" size:17]];
    lab1.textAlignment = NSTextAlignmentCenter;
    lab1.text = @"第三方责任险";
    [alertview addSubview:lab1];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setFrame:CGRectMake(0, 30, width, 30)];
    [button1 setTitle:@"5万" forState:UIControlStateNormal];
    [button1 setTitleColor:RGBCOLORA(102, 102, 102, 1) forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont fontWithName:@"黑体-简" size:17];
    [button1 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
    button1.tag = 1;
    [alertview addSubview:button1];
    UIView *btnview1 = [[UIView alloc]initWithFrame:CGRectMake(0, 60, width, 0.5)];
    btnview1.backgroundColor =RGBCOLORA(102, 102, 102, 1);
    [alertview addSubview:btnview1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setFrame:CGRectMake(0, 60, width, 30)];
    [button2 setTitle:@"10万" forState:UIControlStateNormal];
    [button2 setTitleColor:RGBCOLORA(102, 102, 102, 1) forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont fontWithName:@"黑体-简" size:17];
        [button2 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
    button2.tag = 2;
    [alertview addSubview:button2];
    UIView *btnview2 = [[UIView alloc]initWithFrame:CGRectMake(0, 90, width, 0.5)];
    btnview2.backgroundColor =RGBCOLORA(102, 102, 102, 1);
    [alertview addSubview:btnview2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setFrame:CGRectMake(0, 90, width, 30)];
    [button3 setTitle:@"15万" forState:UIControlStateNormal];
    [button3 setTitleColor:RGBCOLORA(102, 102, 102, 1) forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont fontWithName:@"黑体-简" size:17];
        [button3 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
    button3.tag = 2;
    [alertview addSubview:button3];
    UIView *btnview3 = [[UIView alloc]initWithFrame:CGRectMake(0, 120, width, 0.5)];
    btnview3.backgroundColor =RGBCOLORA(102, 102, 102, 1);
    [alertview addSubview:btnview3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button4 setFrame:CGRectMake(0, 120, width, 30)];
    [button4 setTitle:@"20万" forState:UIControlStateNormal];
    [button4 setTitleColor:RGBCOLORA(102, 102, 102, 1) forState:UIControlStateNormal];
    button4.titleLabel.font = [UIFont fontWithName:@"黑体-简" size:17];
        [button4 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
    button4.tag = 2;
    [alertview addSubview:button4];
    UIView *btnview4 = [[UIView alloc]initWithFrame:CGRectMake(0, 150, width, 0.5)];
    btnview4.backgroundColor =RGBCOLORA(102, 102, 102, 1);
    [alertview addSubview:btnview4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button5 setFrame:CGRectMake(0, 150, width, 30)];
    [button5 setTitle:@"30万" forState:UIControlStateNormal];
    [button5 setTitleColor:RGBCOLORA(102, 102, 102, 1) forState:UIControlStateNormal];
    button5.titleLabel.font = [UIFont fontWithName:@"黑体-简" size:17];
        [button5 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
    button5.tag = 2;
    [alertview addSubview:button5];
    UIView *btnview5 = [[UIView alloc]initWithFrame:CGRectMake(0, 180, width, 0.5)];
    btnview5.backgroundColor =RGBCOLORA(102, 102, 102, 1);
    [alertview addSubview:btnview5];
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button6 setFrame:CGRectMake(0, 180, width, 30)];
    [button6 setTitle:@"50万" forState:UIControlStateNormal];
    [button6 setTitleColor:RGBCOLORA(102, 102, 102, 1) forState:UIControlStateNormal];
    button6.titleLabel.font = [UIFont fontWithName:@"黑体-简" size:17];
        [button6 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
    button6.tag = 2;
    [alertview addSubview:button6];
    UIView *btnview6 = [[UIView alloc]initWithFrame:CGRectMake(0, 210, width, 0.5)];
    btnview6.backgroundColor =RGBCOLORA(102, 102, 102, 1);
    [alertview addSubview:btnview6];
    
    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button7 setFrame:CGRectMake(0, 210, width, 30)];
    [button7 setTitle:@"100万" forState:UIControlStateNormal];
    [button7 setTitleColor:RGBCOLORA(102, 102, 102, 1) forState:UIControlStateNormal];
    button7.titleLabel.font = [UIFont fontWithName:@"黑体-简" size:17];
        [button7 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
    button7.tag = 2;
    [alertview addSubview:button7];
    UIView *btnview7 = [[UIView alloc]initWithFrame:CGRectMake(0, 240, width, 0.5)];
    btnview7.backgroundColor =RGBCOLORA(102, 102, 102, 1);
    [alertview addSubview:btnview7];
    
    [UIView animateWithDuration:0.2 animations:^{
        alertview.layer.frame = CGRectMake(SCREENWIDTH/2-width/2, SCREENHTIGHT/2, width, heigh);
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            alertview.layer.frame = CGRectMake(SCREENWIDTH/2-width/2, SCREENHTIGHT/2-heigh/2, width, heigh);
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                sure.layer.frame =CGRectMake(SCREENWIDTH/2-width/2+20, SCREENHTIGHT/2+heigh/2-50, 180, 30);
            } completion:^(BOOL finished) {
                
            }];
            
        }];
    }];
    
}
-(void)button1Click:(UIButton*)btn{
    
    [self.delegate ThirdMoneyViewSend:btn.titleLabel.text];
    [view1 removeFromSuperview];
    [self removeFromSuperview];
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
