//
//  CarInformationViewController.m
//  AAOBD
//
//  Created by wt on 15/1/9.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "CarInformationViewController.h"
#import "CarMessageViewController.h"
#import "public.h"
#import "Alert.h"
#import "AppUtils.h"
#import "MBHUDView.h"
#import "ASIClient.h"
@interface CarInformationViewController ()<carInfomationTableCellDelegate>
{
    NSInteger tag;
    NSInteger qiehuanTag;
    BOOL isBool2;
    BOOL isUpDown;
    NSMutableArray *NewBrandStr;
    NSMutableArray *NewCarSeries;
    NSMutableArray *NewModel;
    NSMutableArray *sendArray;
    NSMutableArray *CarIdArray;
    
    NSString *thisCarId;
    NSString * sendBrand;
    NSString *sendModel;
    
    int CheckState;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,retain) NSMutableArray *BrandAry;

@end

@implementation CarInformationViewController
@synthesize getArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    tag = -100;
    qiehuanTag = -100;
    isUpDown = YES;
    NewBrandStr = [[NSMutableArray alloc]init];
    NewCarSeries = [[NSMutableArray alloc]init];
    NewModel = [[NSMutableArray alloc]init];
    CarIdArray = [[NSMutableArray alloc]init];

    [self getCarMessage];
    NSLog(@"-=-=-=-=-=-=-=-=-=-=-=-%@",getArray);
    
}
-(void)viewWillAppear:(BOOL)animated{
   

    if (_brandStr != nil) {
        [NewBrandStr addObject:_brandStr];
        [NewCarSeries addObject:_carSeries];
        [NewModel addObject:_model];
        [CarIdArray addObject:_CarId];
    }
    [_tableView reloadData];

}
-(void)viewDidDisappear:(BOOL)animated{

    _model= nil;
    _carSeries = nil;
    _brandStr = nil;
    _CarId = nil;

}
-(void)getCarMessage{
    Alert *alv = [[Alert alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    
    if (![AppUtils nowstate]) {
        alv.image = @"error";
        alv.message = @"暂无网络连接";
        [self.navigationController.view addSubview:alv];
    }else{
        [MBHUDView hudWithBody:@"正在加载..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:0 show:YES];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *UserPhoneNomber = [userDefaults stringForKey:@"UserPhoneNomber"];
        NSString *UserID = [userDefaults stringForKey:@"UserID"];
        
        NSDictionary * pas=[[NSDictionary alloc]initWithObjectsAndKeys:UserPhoneNomber,@"LoginName",UserID,@"UserID", nil];
        [ASIClient POST_Path:@"/API/Mobile/OBD.ashx?method=getsecureinfo&LoginName&UserID" params:pas completed:^(id JSON, NSString *stringData) {
            
            NSLog(@"%@",JSON);
            //拉取数据成功
            if (JSON != nil) {
                NSLog(@"请求成功");
                sendArray = JSON;
                if (sendArray.count != 0) {
                    for (int i=0; i < sendArray.count-1; i++) {
                        [sendArray[i+1] objectForKey:@"Carbrand"];
                        [NewBrandStr addObject:[sendArray[i+1] objectForKey:@"Carbrand"]];
                        [NewCarSeries addObject:[sendArray[i+1] objectForKey:@"Carseries"]];
                        [NewModel addObject:[sendArray[i+1] objectForKey:@"Carmodel"]];
                        [CarIdArray addObject:[sendArray[i+1] objectForKey:@"ID"]];
                        
                        if ([[sendArray[i+1] objectForKey:@"CheckState"] boolValue]) {
                            qiehuanTag =i;
                            thisCarId = [sendArray[i+1] objectForKey:@"ID"];
                        }
                        
                    }
                }
                
                NSLog(@"%@",sendArray);
                
                [_tableView reloadData];

            }else{
                
            }
            [MBHUDView dismissCurrentHUD];
            
        } failed:^(NSError *error) {
            //拉取失败,更多可能服务器关闭，手机无网络
            NSLog(@"当前无网络");
            [MBHUDView dismissCurrentHUD];
            
        }];
    }
    
}


#pragma mark CELL的row数量
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [NewBrandStr count];
}

#pragma mark CELL的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

        if (indexPath.row == tag) {
            if (isUpDown) {
                return 80;
            }else{
                return 160;
            }
        }else {
            return 80;
        }

}


#pragma 填充内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"Cell";
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%ld%ld", (long)[indexPath section], (long)[indexPath row]];//以indexPath来唯一确定cell
    //创建cell，指定标识符是CellIdentifier字符串
    CarInformationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        
        cell = [[CarInformationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.delegate = self;
        
    }
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
   
    cell.jiantou.tag = indexPath.row;
    cell.qiehuan.tag = indexPath.row;
    cell.dele.tag = indexPath.row;
    cell.xiangqing.tag = indexPath.row;
    
    cell.lab1.text = NewBrandStr[indexPath.row];
    cell.lab2.text = NewModel[indexPath.row];
    cell.carSeriesLab.text = NewCarSeries[indexPath.row];
//    if (indexPath.row == CheckState) {
//        [cell.qiehuan setBackgroundImage:[UIImage imageNamed:@"exchange"] forState:UIControlStateNormal];
//        cell.lab3.textColor = [UIColor blueColor];
//    }else{
//    [cell.qiehuan setBackgroundImage:[UIImage imageNamed:@"选"] forState:UIControlStateNormal];
//        cell.lab3.textColor = RGBCOLORA(135, 135, 135, 1);
//    }
    [cell.qiehuan setBackgroundImage:[UIImage imageNamed:@"选"] forState:UIControlStateNormal];
    cell.lab3.textColor = RGBCOLORA(135, 135, 135, 1);
    
    [cell.cheneibao addTarget:self action:@selector(cheneibaoClick:) forControlEvents:UIControlEventTouchUpInside];

    
    cell.cheneibao.hidden = YES;
    cell.xiangqing.hidden = YES;
    cell.dele.hidden = YES;
    cell.cheneibaoLab.hidden = YES;
    cell.xiangqingLab.hidden = YES;
    cell.deleLab.hidden = YES;
    
    [cell.jiantou setBackgroundImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    if (indexPath.row == qiehuanTag) {
        cell.lab3.textColor = [UIColor blueColor];
        [cell.qiehuan setBackgroundImage:[UIImage imageNamed:@"exchange"] forState:UIControlStateNormal];
    }
    if (indexPath.row==tag) {
            cell.cheneibao.hidden = NO;
            cell.xiangqing.hidden = NO;
            cell.dele.hidden = NO;
            cell.cheneibaoLab.hidden = NO;
            cell.xiangqingLab.hidden = NO;
            cell.deleLab.hidden = NO;
        [cell.jiantou setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        isUpDown = NO;
    }else {
        isUpDown = YES;
    }
    
    return cell;
}
-(void)xiangqingBtnAndSendCell:(UITableViewCell *)cell{
    CarInformationTableViewCell *lcell =  (CarInformationTableViewCell *)cell;
    sendBrand = NewBrandStr[lcell.xiangqing.tag];
    sendModel = NewModel[lcell.xiangqing.tag];
    
    [self performSegueWithIdentifier:@"CarInforMationToCarMessageView" sender:self];

}

-(void)cheneibaoClick:(UIButton*)btn{
    
    [self performSegueWithIdentifier:@"CarInforMationToUserDevice" sender:self];

}
-(void)deleBtnAndSendCell:(UITableViewCell *)cell{
    
    CarInformationTableViewCell *lcell =  (CarInformationTableViewCell *)cell;
    [NewBrandStr removeObjectAtIndex:lcell.dele.tag];
    [_tableView reloadData];
    Alert *alv = [[Alert alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];

    if (![AppUtils nowstate]) {
        alv.image = @"error";
        alv.message = @"暂无网络连接";
        [self.navigationController.view addSubview:alv];
    }else{
        [MBHUDView hudWithBody:@"正在加载..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:0 show:YES];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *UserPhoneNomber = [userDefaults stringForKey:@"UserPhoneNomber"];
        
        NSDictionary * pas=[[NSDictionary alloc]initWithObjectsAndKeys:UserPhoneNomber,@"LoginName",CarIdArray[lcell.dele.tag],@"CarID", nil];
        [ASIClient POST_Path:@"/API/Mobile/OBD.ashx?method=deletesecure&LoginName&CarID" params:pas completed:^(id JSON, NSString *stringData) {
            
            NSLog(@"%@",JSON);
            //拉取数据成功
            if (JSON != nil) {
                NSLog(@"请求成功");
                thisCarId = CarIdArray[lcell.qiehuan.tag];
            }else{
                
            }
            [MBHUDView dismissCurrentHUD];
            
        } failed:^(NSError *error) {
            //拉取失败,更多可能服务器关闭，手机无网络
            NSLog(@"当前无网络");
            [MBHUDView dismissCurrentHUD];
            
        }];
    }

}

-(void)qiehuanBtnAndSendCell:(UITableViewCell *)cell{
    CarInformationTableViewCell *lcell =  (CarInformationTableViewCell *)cell;
    [lcell.qiehuan setBackgroundImage:[UIImage imageNamed:@"exchange"] forState:UIControlStateNormal];
    qiehuanTag = lcell.qiehuan.tag;
    [_tableView reloadData];
    
    Alert *alv = [[Alert alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHTIGHT)];
    
    if (![AppUtils nowstate]) {
        alv.image = @"error";
        alv.message = @"暂无网络连接";
        [self.navigationController.view addSubview:alv];
    }else{
        [MBHUDView hudWithBody:@"正在加载..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:0 show:YES];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *UserPhoneNomber = [userDefaults stringForKey:@"UserPhoneNomber"];
        
        NSDictionary * pas=[[NSDictionary alloc]initWithObjectsAndKeys:UserPhoneNomber,@"LoginName",thisCarId,@"HideID",CarIdArray[lcell.qiehuan.tag],@"ShowID", nil];
        [ASIClient POST_Path:@"/API/Mobile/OBD.ashx?method=updatesecure&LoginName&HideID&ShowID" params:pas completed:^(id JSON, NSString *stringData) {
            
            NSLog(@"%@",JSON);
            //拉取数据成功
            if (JSON != nil) {
                NSLog(@"请求成功");
                thisCarId = CarIdArray[lcell.qiehuan.tag];
                
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                [userDefaults setObject:thisCarId forKey:@"Cheqckedcarid"];
            }else{
                
            }
            [MBHUDView dismissCurrentHUD];
            
        } failed:^(NSError *error) {
            //拉取失败,更多可能服务器关闭，手机无网络
            NSLog(@"当前无网络");
            [MBHUDView dismissCurrentHUD];
            
        }];
    }
}

-(void)oncickBtnAndSendCell:(UITableViewCell *)cell{
    
    CarInformationTableViewCell *lcell =  (CarInformationTableViewCell *)cell;
    lcell.isBool = !lcell.isBool;
    isBool2 = lcell.isBool;
    if (!lcell.isBool) {
        [lcell.jiantou setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    }else{
        [lcell.jiantou setBackgroundImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    }
    tag = lcell.jiantou.tag;
    lcell.cheneibao.hidden = isBool2;
    lcell.cheneibaoLab.hidden = isBool2;
    lcell.xiangqing.hidden = isBool2;
    lcell.xiangqingLab.hidden = isBool2;
    lcell.dele.hidden = isBool2;
    lcell.deleLab.hidden = isBool2;
    
    [_tableView reloadData];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"CarInforMationToCarMessageView"]) {

        CarMessageViewController *cmvv = segue.destinationViewController;
        [cmvv setBrand:sendBrand];
        [cmvv setModel:sendModel];
    }
    
    
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
