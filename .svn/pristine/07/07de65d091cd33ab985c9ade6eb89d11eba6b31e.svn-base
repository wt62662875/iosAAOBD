//
//  HisDataViewController.m
//  AAOBD
//
//  Created by oi on 26/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "HisDataViewController.h"
#import "public.h"
@interface HisDataViewController ()
@property (weak, nonatomic) IBOutlet UIButton *naviBtn;
@property (weak, nonatomic) IBOutlet UILabel *lab_title;
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollerView;

@end

@implementation HisDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_naviBtn setImage:[UIImage imageNamed:@"return-clicked.png"] forState:UIControlStateHighlighted];
    [self drawScaleLine];
    // Do any additional setup after loading the view.
}
- (IBAction)onclickNaviBtn:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES ];
}
- (void)drawScaleLine{
    for (int i=0 ; i<=20; i++) {
        if (i%5 == 0) {
            //刻度线
            [self drawline:40 startpoint:10*i endpoint:SCREENWIDTH-20 endpoint:10*i colorx:102 colory:102 colorz:102 linewidth:1];
            //刻度
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 65+10*i, 20, 15)];
            lab.textColor = RGBCOLORA(153, 153, 153, 1);
            lab.textAlignment = NSTextAlignmentCenter;
            lab.text =[NSString stringWithFormat:@"%d",40-i/5*10];
//            lastLabFrame = lab.frame;
            [_myScrollerView addSubview:lab];
        }else{
            
            [self drawline:40 startpoint:10*i endpoint:SCREENWIDTH-20 endpoint:10*i colorx:102 colory:102 colorz:102 linewidth:0.5];
        }
    }

}

/*!
 底部刻度
 */
- (void)drawBottomCalibration:(int)X andWight:(int)wight andLab_Frame:(CGRect)labFrame{
    for (int i = 0; i< X; i++) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(40+ i*wight, labFrame.origin.y+15, wight, 15)];
        lab.textColor = RGBCOLORA(153, 153, 153, 1);
        lab.textAlignment = NSTextAlignmentRight;
        lab.text =[NSString stringWithFormat:@"%d",i+1];
        [_myScrollerView addSubview:lab];
    }
    
    
}
/*!
 @brief 画线
 @param x y 起点坐标 x y
 @param endx endy 终点坐标 endx endy
 @param colorx colory colory 颜色值
 @param linewidth 线宽
 */

-(void)drawline:(float)x startpoint:(float)y endpoint:(float)endx endpoint:(float)endy colorx:(float)colorx colory:(float)colory colorz :(float)colorz linewidth:(float)line{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0,70,self.view.frame.size.width, self.view.frame.size.height)];
    [_myScrollerView addSubview:imageView];
    
    //    UIGraphicsBeginImageContext(imageView.frame.size);
    
    UIGraphicsBeginImageContextWithOptions(imageView.frame.size,NO,0);
    
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapSquare);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), line);  //线宽
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), colorx, colory, colorz, 1.0);  //颜色
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), x  , y);  //起点坐标
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), endx, endy);   //终点坐标
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    imageView.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
}

//圆圈方法     圆位置x y
-(void)drawCiccle:(float)x ciccley:(float)y{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:self.view.frame];
    [_myScrollerView addSubview:imageView];
    
    UIGraphicsBeginImageContext(imageView.frame.size);
    
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapSquare);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 1);  //线宽
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 153.0f, 255.0f, 1.0);  //颜色
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    
    CGContextAddArc(UIGraphicsGetCurrentContext(), x, y, 4, 0, 2*M_PI, 0);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    imageView.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
