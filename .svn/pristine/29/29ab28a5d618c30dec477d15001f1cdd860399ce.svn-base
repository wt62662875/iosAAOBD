//
//  StatisticalView.m
//  AAOBD
//
//  Created by oi on 5/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "StatisticalView.h"
#import "public.h"
#define MJRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

@implementation StatisticalView
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    int Width = [UIScreen mainScreen].bounds.size.width/4;
    UIColor *buleColor = [UIColor blueColor];
    UIColor *greenColor = [UIColor greenColor];
    UIColor *orangeColor = [UIColor orangeColor];
    UIColor *readColor =[UIColor redColor];
    NSDictionary *dataDic = @{@"急弯":buleColor,@"急刹":greenColor,@"加速":orangeColor,@"超速":readColor};
    
    for (int i = 0; i <4; i++) {
        UIView *view = [UIView new];
//        view.backgroundColor = MJRandomColor;
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 40, 20)];
        label.text = [[dataDic allKeys] objectAtIndex:i];
        label.textColor = ALLTEXTCOLOR;
        [view addSubview:label];
        
        UIView *Subview =[[UIView alloc]initWithFrame:CGRectMake(40, 5, 30, 10)];
        Subview.backgroundColor = [dataDic objectForKey:[[dataDic allKeys]objectAtIndex:i]];
        [view addSubview:Subview];
        
        [view setFrame:CGRectMake(i*Width, 0, Width, 20)];
        [self addSubview:view];
    }
}



@end
