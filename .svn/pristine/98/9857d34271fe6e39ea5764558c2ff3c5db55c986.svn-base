//
//  Animation.m
//  AAOBD
//
//  Created by wt on 14/12/31.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "Animation.h"
#import "public.h"
@interface Animation ()
{
    UIView *alertview;
    UIView *view;
}
@end

@implementation Animation

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//按钮点击水波纹效果 参数：按钮    水波纹出现坐标x y
+(void)btnclick:(UIButton*)btn rippleX:(float)x rippleY:(float)y{
    CALayer *waveLayer=[CALayer layer];
    waveLayer.frame = CGRectMake(x, y, 30, 30);
    waveLayer.borderWidth =0.5;
    waveLayer.cornerRadius =15.0;
    waveLayer.borderColor =[UIColor redColor].CGColor;
    
    [btn.layer addSublayer:waveLayer];
    [self scaleBegin:waveLayer];
}
+(void)scaleBegin:(CALayer *)aLayer
{
    const float maxScale=6;
    if (aLayer.transform.m11<maxScale) {
        if (aLayer.transform.m11==1.0) {
            [aLayer setTransform:CATransform3DMakeScale( 1.1, 1.1, 1.0)];
            
        }else{
            [aLayer setTransform:CATransform3DScale(aLayer.transform, 1.1, 1.1, 1.0)];
        }
        [self performSelector:_cmd withObject:aLayer afterDelay:0.02];
    }else [aLayer removeFromSuperlayer];
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
