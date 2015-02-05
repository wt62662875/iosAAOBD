//
//  CarCompatibilityViewController.m
//  AAOBD
//
//  Created by wt on 15/1/20.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "CarCompatibilityViewController.h"
#import "public.h"

@interface CarCompatibilityViewController (){
    UIImageView *imageView;
    UIImageView *imageView2;
    NSTimer *timer ;
    int timer_Time;
    CGRect rc ;
}
@property (strong, nonatomic) IBOutlet UIButton *StarDetectionBtn;
@property (strong, nonatomic) IBOutlet UIButton *NextBtn;


@end

@implementation CarCompatibilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _NextBtn.enabled = NO;
    [_NextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(204, 0, 0, 1)] forState:UIControlStateNormal];
    [_NextBtn setBackgroundImage:[self createImageWithColor:RGBCOLORA(153, 0, 0, 1)] forState:UIControlStateHighlighted];
    _NextBtn.layer.masksToBounds=YES;
    _NextBtn.layer.cornerRadius = 3;
    rc =self.view.frame;

    [self drawyuan];
//    [self drawblueyuan:-M_PI_2 end:-M_PI_2/2];
//    [self drawblueyuan:-M_PI_2/2 end:0];
//    [self drawblueyuan:0 end:M_PI_2/2];
//    [self drawblueyuan:M_PI_2/2 end:M_PI_2];

    timer_Time = 0;
//    [imageView removeFromSuperview];
    // Do any additional setup after loading the view.
}
- (IBAction)StarDetectionBtn:(id)sender {
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timer) userInfo:nil repeats:YES];
    _StarDetectionBtn.enabled = NO;
}
-(void)timer{
    timer_Time++;
    switch (timer_Time) {
        case 1:
            [self drawblueyuan:-M_PI_2 end:-M_PI_2/2];
            break;
        case 2:
            [self drawblueyuan:-M_PI_2/2 end:0];
            break;
        case 3:
            [self drawblueyuan:0 end:M_PI_2/2];
            break;
        case 4:
            [self drawblueyuan:M_PI_2/2 end:M_PI_2];
            break;
        case 5:
            [self drawblueyuan:M_PI_2 end:M_PI_2+M_PI_2/2];
            break;
        case 6:
            [self drawblueyuan:M_PI_2+M_PI_2/2 end:M_PI];
            break;
        case 7:
            [self drawblueyuan:M_PI end:M_PI+M_PI_2/2];
            break;
        case 8:
            [self drawblueyuan:M_PI+M_PI_2/2 end:M_PI+M_PI_2];
            _StarDetectionBtn.titleLabel.text = @"检测完成";
            _NextBtn.enabled = YES;
            [timer invalidate];
            timer_Time = 0;

            break;
        default:
            break;
    }

}
-(void)drawyuan{
    imageView=[[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:imageView];
    
    UIGraphicsBeginImageContextWithOptions(rc.size,NO,0);
    
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapSquare);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 4);  //线宽
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0, 0, 0, 1.0);  //颜色
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    
    CGContextAddArc(UIGraphicsGetCurrentContext(), SCREENWIDTH/2, 80, 60,-M_PI_2, M_PI+M_PI_2, 0);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    imageView.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}
-(void)drawblueyuan:(float)star end:(float)end{
    imageView2=[[UIImageView alloc] initWithFrame:rc];
    
    UIGraphicsBeginImageContextWithOptions(rc.size,NO,0);
    
    [imageView2.image drawInRect:CGRectMake(0, 0, imageView2.frame.size.width, imageView2.frame.size.height)];
    
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapSquare);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 4);  //线宽
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0/255, 153/255, 255/255, 1.0);  //颜色
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    
    CGContextAddArc(UIGraphicsGetCurrentContext(), SCREENWIDTH/2, 80, 60,star, end, 0);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    imageView2.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.view addSubview:imageView2];

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
