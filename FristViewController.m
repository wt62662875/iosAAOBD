//
//  FristViewController.m
//  AAOBD
//
//  Created by wt on 14/12/26.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "FristViewController.h"
#import "public.h"
#import "AppUtils.h"

@interface FristViewController ()
{
    UIButton *Btn1;
    UIButton *Btn2;
    UIButton *Btn3;
    UIImageView *image1;
    UIImageView *image2;
    UIImageView *image3;
    UIView *Circle;
    UIView * bottomView;\
    UIView * tabbar;
    
    }

@end

@implementation FristViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.tabBar.hidden = YES;
    bottomView = [[UIView alloc]init];
    [bottomView setFrame:CGRectMake(0, SCREENHTIGHT-74, SCREENWIDTH, 74)];
    bottomView.backgroundColor = [UIColor clearColor];
    
    tabbar = [[UIView alloc]init];
    [tabbar setFrame:CGRectMake(0, SCREENHTIGHT-50, SCREENWIDTH, 50)];
    tabbar.backgroundColor = [UIColor blackColor];
    
    Btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn1.frame = CGRectMake(0, 0, SCREENWIDTH/3, 49);
    Btn1.backgroundColor =[UIColor clearColor];
    [Btn1 setTitle:@"省钱" forState:UIControlStateNormal];
    [Btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    Btn1.titleLabel.font=[UIFont systemFontOfSize:13];
    [Btn1 addTarget:self action:@selector(btn1click:) forControlEvents:UIControlEventTouchUpInside];
//    self.selectedIndex = 0;
    
    Btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn2.frame = CGRectMake(SCREENWIDTH/3, 0, SCREENWIDTH/3, 49);
    [Btn2 setTitle:@"爱车" forState:UIControlStateNormal];
    [Btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    Btn2.backgroundColor = [UIColor clearColor];
    Btn2.titleLabel.font=[UIFont systemFontOfSize:13];
    [Btn2 addTarget:self action:@selector(btn2click:) forControlEvents:UIControlEventTouchUpInside];

    
    Btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn3.frame = CGRectMake(SCREENWIDTH/3*2, 0, SCREENWIDTH/3, 49);
    [Btn3 setTitle:@"设置" forState:UIControlStateNormal];
    [Btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    Btn3.backgroundColor = [UIColor clearColor];
    Btn3.titleLabel.font=[UIFont systemFontOfSize:13];
    [Btn3 addTarget:self action:@selector(btn3click:) forControlEvents:UIControlEventTouchUpInside];


    [bottomView setUserInteractionEnabled:YES];
    [tabbar setUserInteractionEnabled:YES];
    [Btn1 setUserInteractionEnabled:YES];
    
   
    [self.view addSubview:bottomView];
    [self.view addSubview:tabbar];
    
    image1 = [[UIImageView alloc]init];
    [image1 setFrame:CGRectMake(4, 4, 32, 32)];
    [image1 setImage:[UIImage imageNamed:@"money"]];
    image2 = [[UIImageView alloc]init];
    [image2 setFrame:CGRectMake(4, 4, 32, 32)];
    [image2 setImage:[UIImage imageNamed:@"car"]];
    image3 = [[UIImageView alloc]init];
    [image3 setFrame:CGRectMake(4, 4, 32, 32)];
    [image3 setImage:[UIImage imageNamed:@"set"]];
    
    [self drawcircle: (SCREENWIDTH/3/2)-20 and:tabbar two:image1];


    [tabbar addSubview:Btn1];
    [tabbar addSubview:Btn2];
    [tabbar addSubview:Btn3];
    
    UIStoryboard *secondStoryBoard = [UIStoryboard storyboardWithName:@"LoveCarStoryboard" bundle:nil];
     UIStoryboard *MianStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* SaveMoneyVC = [MianStoryBoard instantiateViewControllerWithIdentifier:@"SaveMoney"];
    UIViewController* loveCarVC = [secondStoryBoard instantiateViewControllerWithIdentifier:@"loveCar"];
    UIViewController* setVC = [MianStoryBoard instantiateViewControllerWithIdentifier:@"SetView"];
    
    [self setViewControllers:@[SaveMoneyVC,loveCarVC,setVC]];
   
    // Do any additional setup after loading the view.
    
   
}
-(void)btn1click:(UIButton*)sender{
    [Circle removeFromSuperview];
    [self drawcircle: (SCREENWIDTH/3/2)-20 and:tabbar two:image1];
    self.selectedIndex = 0;
    [Btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [Btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

}
-(void)btn2click:(UIButton*)sender{
    self.selectedIndex = 1;
    [Circle removeFromSuperview];
    [self drawcircle: (SCREENWIDTH/2)-20 and:tabbar two:image2];
    [Btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [Btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

}
-(void)btn3click:(UIButton*)sender{
    self.selectedIndex = 2;
    [Circle removeFromSuperview];
    [self drawcircle: (SCREENWIDTH-(SCREENWIDTH/3/2)-20) and:tabbar two:image3];
    [Btn3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [Btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

}
-(void)drawcircle:(CGFloat )x and:(UIView *)view two:(UIImageView *)iimage{
    Circle = [[UIView alloc]initWithFrame:CGRectMake(x, -22, 40, 40)];
    Circle.layer.cornerRadius = 19;
    Circle.backgroundColor = [UIColor blackColor];
    [view insertSubview:Circle aboveSubview:view];
    [Circle addSubview:iimage];
    [view addSubview:Circle];
    
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
