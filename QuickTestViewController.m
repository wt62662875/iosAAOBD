//
//  QuickTestViewController.m
//  AAOBD
//
//  Created by oi on 30/12/14.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "QuickTestViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "BluetoothSingleton.h"
#import "VehicleDetectionViewController.h"
#define TIMEDURATION 0.5
@interface QuickTestViewController ()<UITableViewDataSource,UITableViewDelegate>
//进度条
@property (weak, nonatomic) IBOutlet UIProgressView *myProgressView;
//光ImageView
@property (weak, nonatomic) IBOutlet UIImageView *lightImgView;
//旋转ImageView
@property (weak, nonatomic) IBOutlet UIImageView *rotateImgView;
@property (weak, nonatomic) IBOutlet UITableView *myTabView;
@property (weak, nonatomic) IBOutlet UIButton *navi_Btn;

@end

@implementation QuickTestViewController{
    
    NSTimer *_timer;
    double time;
    NSMutableArray *dataAarr;
    NSArray *receiveDataArr;//接收到的数据
    
    BOOL isBool;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(isFullData:) name:@"isFullData" object:nil];
    isBool = YES;
    
    [BluetoothSingleton sharedInstance].Car_medical = YES;
    [BluetoothSingleton sharedInstance].Car_data = NO;
    [BluetoothSingleton sharedInstance].Car_Data = NO;
    [BluetoothSingleton sharedInstance].Car_check = NO;
    [BluetoothSingleton sharedInstance].Car_Check = NO;
    
    _myTabView.userInteractionEnabled = NO;
    [_navi_Btn setImage:[UIImage imageNamed:@"return-clicked.png"] forState:UIControlStateHighlighted];
    
    [self initData];
    [self setTimer];
    [self setProgressView];
    
}
- (void)viewWillUnload{
    [self viewWillUnload];
    //    [self removeObserver:self forKeyPath:@"isFullData"];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"isFullData" object:nil];
    
}
- (void)initData{
    time = 0;
    NSString *dataStr=@"利用滚动视图的这个协议方法应该可以";
    if (dataAarr ==nil) {
        dataAarr = [[NSMutableArray alloc]init];
        
        if (dataAarr.count != 0) {
            [dataAarr removeAllObjects];
        }
        
        [dataAarr addObject:dataStr];
        [dataAarr addObject:dataStr];
        [dataAarr addObject:dataStr];
        [dataAarr addObject:dataStr];
        
        
    }
    
}

-(void)isFullData:(NSNotification *)notfiti{
    NSLog(@"fullarry =========%@",notfiti.object);
    NSArray *arr = notfiti.object;
    
    if (arr!=nil&&arr.count>3) {
        
        [_myProgressView setProgress:1];
        [_timer invalidate];
        if (self.navigationController!=nil) {
            
            UIStoryboard *loveCarStorB =[UIStoryboard storyboardWithName:@"LoveCarStoryboard" bundle:nil];
            
            VehicleDetectionViewController *vehcleVC =[loveCarStorB instantiateViewControllerWithIdentifier:@"Vehicle"];
            [self.navigationController pushViewController:vehcleVC animated:YES];
            
        }
        
    }
    
}

- (void)refreshData{
    
    if (dataAarr.count != 0) {
        [dataAarr removeObjectAtIndex:0];
    }
    [dataAarr addObjectsFromArray:@[@"哈哈哈哈哈",]];
    [_myTabView reloadData];
    
    
    
}
- (void)setProgressView{
    [_myProgressView setProgress:0.f];
    _myProgressView.layer.masksToBounds = YES;
    _myProgressView.layer.cornerRadius = 5.0f;
    
}

- (void)setTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:TIMEDURATION target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    
}
- (void)timerAction:(NSTimer *)sendr{
    time+=1.0;
    if (time > dataAarr.count-1) {
        //        [_timer invalidate];
        //        _lightImgView.hidden = YES;
        //        [self performSegueWithIdentifier:@"VehicleDetection" sender:nil];
        [_myProgressView setProgress:(0.8)];
        [self moveLight];//平移
        [self rotate];//旋转
        [self refreshData];
        
    }else{
        [_myProgressView setProgress:(time/dataAarr.count)];//进度
        [self moveLight];//平移
        [self rotate];//旋转
        [self refreshData];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onclickLeftBarbutton:(UIButton *)sender {
    [_timer invalidate];
    [dataAarr removeAllObjects];
    [self dismissViewControllerAnimated:YES completion:^{
        [BluetoothSingleton sharedInstance].Car_medical = NO;
        [BluetoothSingleton sharedInstance].Car_Medical = NO;
        [BluetoothSingleton sharedInstance].Car_data = YES;
        [BluetoothSingleton sharedInstance].Car_Data = NO;
        [BluetoothSingleton sharedInstance].Car_check = NO;
        [BluetoothSingleton sharedInstance].Car_Check = NO;
        [BluetoothSingleton sharedInstance].Car_Other = NO;
    }];
}

//平移动画
- (void)moveLight{
    
    CGAffineTransform  transForm =  CGAffineTransformMakeTranslation(0,0);
    if ((_lightImgView.transform.tx == transForm.tx)) {
        
        [UIView animateWithDuration:TIMEDURATION animations:^{
            [_lightImgView setTransform:(CGAffineTransformMakeTranslation(280,0))];
        }
         ];
        
    }else{
        
        [UIView animateWithDuration:TIMEDURATION animations:^{
            [_lightImgView setTransform:(CGAffineTransformMakeTranslation(0,0))];
        }
         ];
    }
    
}

//旋转动画
-(void)rotate{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.delegate = self;
    
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0 , 0, 0 , 1.0)]; // 起始角度
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI , 0, 0 , 1.0)];
    animation.duration = 0.5;
    animation.cumulative = YES;
    animation.repeatCount = 1;
    // 动画终了后不返回初始状态
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [_rotateImgView.layer addAnimation:animation forKey:@"animation"];
    
    
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataAarr.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *tableCellIdentifier = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableCellIdentifier];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [dataAarr objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
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
