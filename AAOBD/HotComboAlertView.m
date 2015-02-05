//
//  HotComboAlertView.m
//  AAOBD
//
//  Created by wt on 15/2/4.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "HotComboAlertView.h"
#import "public.h"

@implementation HotComboAlertView{
    UIView *alertview;
    UIView *view1;
    UIButton *sure;
    NSMutableArray *temp;
}

- (void)drawRect:(CGRect)rect {
    temp = [[NSMutableArray alloc]init];
    self.backgroundColor = [UIColor lightGrayColor];
    self.alpha = 0.65;
    
    float width = 220;
    float heigh = 260;
    
    view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    view1.backgroundColor = [UIColor clearColor];
    [self.superview addSubview:view1];
    
    alertview = [[UIView alloc]initWithFrame:CGRectMake(SCREENWIDTH/2-width/2, 0, width, heigh)];
    alertview.backgroundColor = RGBCOLORA(228, 228, 228, 1);
    alertview.layer.cornerRadius = 4;
    alertview.alpha = 1;
    [view1 addSubview:alertview];
    
    sure = [UIButton buttonWithType:UIButtonTypeCustom];
    [sure setFrame:CGRectMake(-85, SCREENHTIGHT/2+heigh/2-50, 85, 30)];
    [sure setBackgroundImage:[self createImageWithColor:RGBCOLORA(204, 0, 0, 1)] forState:UIControlStateNormal];
    [sure setBackgroundImage:[self createImageWithColor:RGBCOLORA(153, 0, 0, 1)] forState:UIControlStateHighlighted];
    [sure setTitle:@"确定" forState:UIControlStateNormal];
    sure.titleLabel.textColor = [UIColor whiteColor];
    sure.titleLabel.font = [UIFont fontWithName:@"黑体-简" size:12];
    sure.layer.masksToBounds=YES;
    sure.layer.cornerRadius = 2;
    [sure addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
    [view1 addSubview:sure];
    
    UIButton *flase = [UIButton buttonWithType:UIButtonTypeCustom];
    [flase setFrame:CGRectMake(SCREENWIDTH+85, SCREENHTIGHT/2+heigh/2-50, 85, 30)];
    [flase setBackgroundImage:[self createImageWithColor:RGBCOLORA(102, 102, 102, 1)] forState:UIControlStateNormal];
    [flase setTitle:@"取消" forState:UIControlStateNormal];
    flase.titleLabel.textColor = [UIColor whiteColor];
    flase.titleLabel.font = [UIFont fontWithName:@"黑体-简" size:12];
    flase.layer.masksToBounds=YES;
    flase.layer.cornerRadius = 2;
    [flase addTarget:self action:@selector(flaseClick) forControlEvents:UIControlEventTouchUpInside];
    [view1 addSubview:flase];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, 30)];
    [image setImage:[UIImage imageNamed:@"alert头"]];
    [alertview addSubview:image];
    
    UILabel *lab1 = [[UILabel alloc]initWithFrame:CGRectMake(width/2-50,0 , 100, 30)];
    lab1.textColor = [UIColor whiteColor];
    [lab1 setFont:[UIFont fontWithName:@"黑体-简" size:17]];
    lab1.textAlignment = NSTextAlignmentCenter;
    lab1.text = @"热门套餐";
    [alertview addSubview:lab1];
    
    UILabel *lab2 = [[UILabel alloc]initWithFrame:CGRectMake(10,30, 150, 30)];
    lab2.textColor = RGBCOLORA(102, 102, 102, 1);
    [lab2 setFont:[UIFont fontWithName:@"黑体-简" size:12]];
    lab2.textAlignment = NSTextAlignmentLeft;
    lab2.text = @"热门型车险套餐保障范围:";
    [alertview addSubview:lab2];
    //
    UILabel *lab3 = [[UILabel alloc]initWithFrame:CGRectMake(30,50, 150, 30)];
    lab3.textColor = RGBCOLORA(102, 102, 102, 1);
    [lab3 setFont:[UIFont fontWithName:@"黑体-简" size:12]];
    lab3.textAlignment = NSTextAlignmentLeft;
    lab3.text = @"1、第三者责任保险;";
    [alertview addSubview:lab3];
    
    UILabel *lab4 = [[UILabel alloc]initWithFrame:CGRectMake(30,80, 150, 30)];
    lab4.textColor = RGBCOLORA(102, 102, 102, 1);
    [lab4 setFont:[UIFont fontWithName:@"黑体-简" size:12]];
    lab4.textAlignment = NSTextAlignmentLeft;
    lab4.text = @"2、机动车盗抢险;";
    [alertview addSubview:lab4];
    
    UILabel *lab5 = [[UILabel alloc]initWithFrame:CGRectMake(30,110, 150, 30)];
    lab5.textColor = RGBCOLORA(102, 102, 102, 1);
    [lab5 setFont:[UIFont fontWithName:@"黑体-简" size:12]];
    lab5.textAlignment = NSTextAlignmentLeft;
    lab5.text = @"3、不计免赔特约险;";
    [alertview addSubview:lab5];
    
    UILabel *lab6 = [[UILabel alloc]initWithFrame:CGRectMake(30,140, 150, 30)];
    lab6.textColor = RGBCOLORA(102, 102, 102, 1);
    [lab6 setFont:[UIFont fontWithName:@"黑体-简" size:12]];
    lab6.textAlignment = NSTextAlignmentLeft;
    lab6.text = @"4、自燃损失险;";
    [alertview addSubview:lab6];
    
    UILabel *lab7 = [[UILabel alloc]initWithFrame:CGRectMake(30,170, 150, 30)];
    lab7.textColor = RGBCOLORA(102, 102, 102, 1);
    [lab7 setFont:[UIFont fontWithName:@"黑体-简" size:12]];
    lab7.textAlignment = NSTextAlignmentLeft;
    lab7.text = @"5、交通强制保险;";
    [alertview addSubview:lab7];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setFrame:CGRectMake(10, 55, 18, 18)];
    [button1 setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [button1 setBackgroundImage:[UIImage imageNamed:@"check_Checked"] forState:UIControlStateSelected];
    [button1 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
    [alertview addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setFrame:CGRectMake(10, 85, 18, 18)];
    [button2 setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [button2 setBackgroundImage:[UIImage imageNamed:@"check_Checked"] forState:UIControlStateSelected];
    [button2 addTarget:self action:@selector(button2Click:) forControlEvents:UIControlEventTouchUpInside];
    [alertview addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setFrame:CGRectMake(10, 115, 18, 18)];
    [button3 setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [button3 setBackgroundImage:[UIImage imageNamed:@"check_Checked"] forState:UIControlStateSelected];
    [button3 addTarget:self action:@selector(button3Click:) forControlEvents:UIControlEventTouchUpInside];
    [alertview addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button4 setFrame:CGRectMake(10, 145, 18, 18)];
    [button4 setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [button4 setBackgroundImage:[UIImage imageNamed:@"check_Checked"] forState:UIControlStateSelected];
    [button4 addTarget:self action:@selector(button4Click:) forControlEvents:UIControlEventTouchUpInside];
    [alertview addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button5 setFrame:CGRectMake(10, 175, 18, 18)];
    [button5 setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [button5 setBackgroundImage:[UIImage imageNamed:@"check_Checked"] forState:UIControlStateSelected];
    [button5 addTarget:self action:@selector(button5Click:) forControlEvents:UIControlEventTouchUpInside];
    [alertview addSubview:button5];
    
    [UIView animateWithDuration:0.2 animations:^{
        alertview.layer.frame = CGRectMake(SCREENWIDTH/2-width/2, SCREENHTIGHT/2, width, heigh);
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            alertview.layer.frame = CGRectMake(SCREENWIDTH/2-width/2, SCREENHTIGHT/2-heigh/2, width, heigh);
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                sure.layer.frame =CGRectMake(SCREENWIDTH/2-width/2+15, SCREENHTIGHT/2+heigh/2-50, 85, 30);
                flase.layer.frame =CGRectMake(SCREENWIDTH/2+10, SCREENHTIGHT/2+heigh/2-50, 85, 30);
            } completion:^(BOOL finished) {
                
            }];
            
        }];
    }];
    
}
-(void)button1Click:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [temp addObject:@"1"];
    }else{
        [temp removeObject:@"1"];
    }
}
-(void)button2Click:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [temp addObject:@"3"];
    }else{
        [temp removeObject:@"3"];
    }
}
-(void)button3Click:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [temp addObject:@"5"];
    }else{
        [temp removeObject:@"5"];
    }
}
-(void)button4Click:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [temp addObject:@"8"];
    }else{
        [temp removeObject:@"8"];
    }
}
-(void)button5Click:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [temp addObject:@"10"];
    }else{
        [temp removeObject:@"10"];
    }
}
-(void)flaseClick{
    [view1 removeFromSuperview];
    [self removeFromSuperview];
}
-(void)sureClick{
    [self.delegate HotComboAlertSend:temp];

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
