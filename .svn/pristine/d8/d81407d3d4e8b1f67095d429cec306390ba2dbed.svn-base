//
//  AllAlertView.m
//  AAOBD
//
//  Created by wt on 15/2/4.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "AllAlertView.h"
#import "public.h"
@implementation AllAlertView{
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
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 30, width, 175)];
    scrollView.contentSize = CGSizeMake(0, 320);
    [scrollView setScrollEnabled:YES];
    scrollView.showsVerticalScrollIndicator = NO;
    [alertview addSubview:scrollView];
    
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
    lab1.text = @"全保车险";
    [alertview addSubview:lab1];
    
    UILabel *lab2 = [[UILabel alloc]initWithFrame:CGRectMake(10,0, 150, 30)];
    lab2.textColor = RGBCOLORA(102, 102, 102, 1);
    [lab2 setFont:[UIFont fontWithName:@"黑体-简" size:12]];
    lab2.textAlignment = NSTextAlignmentLeft;
    lab2.text = @"全保型车险套餐保障范围:";
    [scrollView addSubview:lab2];
    //
    UILabel *lab3 = [[UILabel alloc]initWithFrame:CGRectMake(30,20, 150, 30)];
    lab3.textColor = RGBCOLORA(102, 102, 102, 1);
    [lab3 setFont:[UIFont fontWithName:@"黑体-简" size:12]];
    lab3.textAlignment = NSTextAlignmentLeft;
    lab3.text = @"1、第三者责任保险;";
    [scrollView addSubview:lab3];
    
    UILabel *lab4 = [[UILabel alloc]initWithFrame:CGRectMake(30,50, 150, 30)];
    lab4.textColor = RGBCOLORA(102, 102, 102, 1);
    [lab4 setFont:[UIFont fontWithName:@"黑体-简" size:12]];
    lab4.textAlignment = NSTextAlignmentLeft;
    lab4.text = @"2、机动车损失保险;";
    [scrollView addSubview:lab4];
    
    UILabel *lab5 = [[UILabel alloc]initWithFrame:CGRectMake(30,80, 150, 30)];
    lab5.textColor = RGBCOLORA(102, 102, 102, 1);
    [lab5 setFont:[UIFont fontWithName:@"黑体-简" size:12]];
    lab5.textAlignment = NSTextAlignmentLeft;
    lab5.text = @"3、机动车盗抢险;";
    [scrollView addSubview:lab5];
    
    UILabel *lab6 = [[UILabel alloc]initWithFrame:CGRectMake(30,110, 150, 30)];
    lab6.textColor = RGBCOLORA(102, 102, 102, 1);
    [lab6 setFont:[UIFont fontWithName:@"黑体-简" size:12]];
    lab6.textAlignment = NSTextAlignmentLeft;
    lab6.text = @"4、车上人员责任险;";
    [scrollView addSubview:lab6];
    
    UILabel *lab7 = [[UILabel alloc]initWithFrame:CGRectMake(30,140, 150, 30)];
    lab7.textColor = RGBCOLORA(102, 102, 102, 1);
    [lab7 setFont:[UIFont fontWithName:@"黑体-简" size:12]];
    lab7.textAlignment = NSTextAlignmentLeft;
    lab7.text = @"5、不计免赔特约险;";
    [scrollView addSubview:lab7];
    
    UILabel *lab8 = [[UILabel alloc]initWithFrame:CGRectMake(30,170, 150, 30)];
    lab8.textColor = RGBCOLORA(102, 102, 102, 1);
    [lab8 setFont:[UIFont fontWithName:@"黑体-简" size:12]];
    lab8.textAlignment = NSTextAlignmentLeft;
    lab8.text = @"6、玻璃单独破碎险;";
    [scrollView addSubview:lab8];
    
    UILabel *lab9 = [[UILabel alloc]initWithFrame:CGRectMake(30,200, 150, 30)];
    lab9.textColor = RGBCOLORA(102, 102, 102, 1);
    [lab9 setFont:[UIFont fontWithName:@"黑体-简" size:12]];
    lab9.textAlignment = NSTextAlignmentLeft;
    lab9.text = @"7、自燃损失险;";
    [scrollView addSubview:lab9];
    
    UILabel *lab10 = [[UILabel alloc]initWithFrame:CGRectMake(30,230, 150, 30)];
    lab10.textColor = RGBCOLORA(102, 102, 102, 1);
    [lab10 setFont:[UIFont fontWithName:@"黑体-简" size:12]];
    lab10.textAlignment = NSTextAlignmentLeft;
    lab10.text = @"8、车身划痕损失险;";
    [scrollView addSubview:lab10];
    
    UILabel *lab11 = [[UILabel alloc]initWithFrame:CGRectMake(30,260, 150, 30)];
    lab11.textColor = RGBCOLORA(102, 102, 102, 1);
    [lab11 setFont:[UIFont fontWithName:@"黑体-简" size:12]];
    lab11.textAlignment = NSTextAlignmentLeft;
    lab11.text = @"9、交通强制保险;";
    [scrollView addSubview:lab11];
    
    UILabel *lab12 = [[UILabel alloc]initWithFrame:CGRectMake(30,290, 150, 30)];
    lab12.textColor = RGBCOLORA(102, 102, 102, 1);
    [lab12 setFont:[UIFont fontWithName:@"黑体-简" size:12]];
    lab12.textAlignment = NSTextAlignmentLeft;
    lab12.text = @"10、车船使用税;";
    [scrollView addSubview:lab12];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setFrame:CGRectMake(10, 25, 18, 18)];
    [button1 setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [button1 setBackgroundImage:[UIImage imageNamed:@"check_Checked"] forState:UIControlStateSelected];
    [button1 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setFrame:CGRectMake(10, 55, 18, 18)];
    [button2 setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [button2 setBackgroundImage:[UIImage imageNamed:@"check_Checked"] forState:UIControlStateSelected];
    [button2 addTarget:self action:@selector(button2Click:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setFrame:CGRectMake(10, 85, 18, 18)];
    [button3 setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [button3 setBackgroundImage:[UIImage imageNamed:@"check_Checked"] forState:UIControlStateSelected];
    [button3 addTarget:self action:@selector(button3Click:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button4 setFrame:CGRectMake(10, 115, 18, 18)];
    [button4 setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [button4 setBackgroundImage:[UIImage imageNamed:@"check_Checked"] forState:UIControlStateSelected];
    [button4 addTarget:self action:@selector(button4Click:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button5 setFrame:CGRectMake(10, 145, 18, 18)];
    [button5 setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [button5 setBackgroundImage:[UIImage imageNamed:@"check_Checked"] forState:UIControlStateSelected];
    [button5 addTarget:self action:@selector(button5Click:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button5];
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button6 setFrame:CGRectMake(10, 175, 18, 18)];
    [button6 setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [button6 setBackgroundImage:[UIImage imageNamed:@"check_Checked"] forState:UIControlStateSelected];
    [button6 addTarget:self action:@selector(button6Click:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button6];
    
    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button7 setFrame:CGRectMake(10, 205, 18, 18)];
    [button7 setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [button7 setBackgroundImage:[UIImage imageNamed:@"check_Checked"] forState:UIControlStateSelected];
    [button7 addTarget:self action:@selector(button7Click:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button7];
    
    UIButton *button8 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button8 setFrame:CGRectMake(10, 235, 18, 18)];
    [button8 setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [button8 setBackgroundImage:[UIImage imageNamed:@"check_Checked"] forState:UIControlStateSelected];
    [button8 addTarget:self action:@selector(button8Click:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button8];
    
    UIButton *button9 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button9 setFrame:CGRectMake(10, 265, 18, 18)];
    [button9 setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [button9 setBackgroundImage:[UIImage imageNamed:@"check_Checked"] forState:UIControlStateSelected];
    [button9 addTarget:self action:@selector(button9Click:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button9];
    
    UIButton *button10 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button10 setFrame:CGRectMake(10, 295, 18, 18)];
    [button10 setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [button10 setBackgroundImage:[UIImage imageNamed:@"check_Checked"] forState:UIControlStateSelected];
    [button10 addTarget:self action:@selector(button10Click:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button10];
    
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
        [temp addObject:@"2"];
    }else{
        [temp removeObject:@"2"];
    }
}
-(void)button3Click:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [temp addObject:@"3"];
    }else{
        [temp removeObject:@"3"];
    }
}
-(void)button4Click:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [temp addObject:@"4"];
    }else{
        [temp removeObject:@"4"];
    }
}
-(void)button5Click:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [temp addObject:@"5"];
    }else{
        [temp removeObject:@"5"];
    }
}
-(void)button6Click:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [temp addObject:@"6"];
    }else{
        [temp removeObject:@"6"];
    }
}
-(void)button7Click:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [temp addObject:@"8"];
    }else{
        [temp removeObject:@"8"];
    }
}
-(void)button8Click:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [temp addObject:@"9"];
    }else{
        [temp removeObject:@"9"];
    }
}
-(void)button9Click:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [temp addObject:@"10"];
    }else{
        [temp removeObject:@"10"];
    }
}
-(void)button10Click:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [temp addObject:@"11"];
    }else{
        [temp removeObject:@"11"];
    }
}

-(void)flaseClick{
    [view1 removeFromSuperview];
    [self removeFromSuperview];
}
-(void)sureClick{
    [self.delegate AllAlertSend:temp];

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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
