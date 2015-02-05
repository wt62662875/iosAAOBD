//
//  AbnormalViewController.m
//  AAOBD
//
//  Created by oi on 2/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "AbnormalViewController.h"
#import "CellHeadView.h"
#import "ASIClientPub.h"
#import "ASIClient.h"
#import "public.h"
#import "AppUtils.h"
#import "SVProgressHUD.h"

@interface AbnormalViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UITableView *groupTableView;
@property (weak, nonatomic) IBOutlet UIImageView *stateImageView;

@end

@implementation AbnormalViewController{
    
    NSArray *imgArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self setStateImgView];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self hideTableView];
}
- (void)initData{
    _myTableView.backgroundColor = [UIColor whiteColor];
    _groupTableView.hidden = YES;
    imgArr = @[@"发动机",@"三元催化剂",@"节气门",@"错"];
    
}
//设置图片
- (void)setStateImgView{
    UIImage *stateImage  = [UIImage imageNamed:[imgArr objectAtIndex:self.VCtype]];
    _stateImageView.image = stateImage;
}

- (void)hideTableView{
    if (self.VCtype == Thefault) {
        //故障系统
        _groupTableView.hidden = NO;
        _myTableView.hidden = YES;
        
        
        if ([AppUtils nowstate]) {
            
            NSDictionary * param =[[NSDictionary alloc]initWithObjectsAndKeys:UserName,@"Loginname",[[BluetoothSingleton sharedInstance].Troublearr objectAtIndex:1],@"HitchCode",@"沃尔沃",@"Brand",nil ];
            
            [SVProgressHUD showWithStatus:@"加载数据中。。。"];
            [ASIClientPub getTroubleWithParam:param completed:^(id Json,NSString* strData){
                NSLog(@"json------------%@",[Json objectForKey:@"Hitchvalue"]);
                [SVProgressHUD dismiss];
                
            }
                                       failed:^(NSError *err){
                                           NSLog(@"服务器");
                                           
                                       }
                                   andIsLogin:^(BOOL isBool){
                                       NSLog(@"请登录");
                                       
                                   }];
            
        }else{
            [[[UIAlertView alloc]initWithTitle:APPNAME message:@"没有网络" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil, nil] show ];
            
        }
    }else{
        _groupTableView.hidden = YES;
        _myTableView.hidden = NO;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == _myTableView) {
        return 1;
    }else{
        return 2;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _myTableView) {
        return 5;
    }else{
        return [[[BluetoothSingleton sharedInstance].Troublearr firstObject] integerValue];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == _groupTableView) {
        return 50;
    }else{
        return 0;
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (tableView == _groupTableView) {
        
        return  [self CellHeadView:section];
    }else{
        
        return nil;
    }
    
    
}

- (CellHeadView *)CellHeadView:(NSInteger)section{
    
    CellHeadView *cellHeadV = [[[NSBundle mainBundle]loadNibNamed:@"CellHeadView" owner:nil options:nil] objectAtIndex:0];
    switch (section) {
        case 0:
            cellHeadV.textLabel.text = @"故障码";
            break;
        case 1:
            cellHeadV.textLabel.text = @"故障描述";
            break;
            
        default:
            break;
    }
    
    return cellHeadV;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndenfine = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndenfine];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndenfine];
    }
    
    if (tableView == _groupTableView) {
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.backgroundColor = [UIColor clearColor];
        //        cell.textLabel.text = [[BluetoothSingleton sharedInstance].Troublearr objectAtIndex:1];
    }else{
        
        cell.textLabel.text = @"故障";
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
