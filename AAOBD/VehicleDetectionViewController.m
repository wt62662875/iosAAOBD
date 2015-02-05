//
//  VehicleDetectionViewController.m
//  AAOBD
//
//  Created by oi on 31/12/14.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "VehicleDetectionViewController.h"
#import "public.h"
#import "CustomTableViewCell.h"
#import "AbnormalViewController.h"
#import "ASIClientPub.h"
#import "ASIClient.h"
@interface VehicleDetectionViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *stateBtn;
@property (weak, nonatomic) IBOutlet UITableView *myTabView;
@property (weak, nonatomic) IBOutlet UIButton *naviBtn;


@end

@implementation VehicleDetectionViewController{
    
    NSArray *dataArr;
    NSArray *imgArr;
}
- (IBAction)onclickNaviBtn:(UIButton *)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [BluetoothSingleton sharedInstance].Car_medical = NO;
    [BluetoothSingleton sharedInstance].Car_Medical = NO;
    [BluetoothSingleton sharedInstance].Car_data = YES;
    [BluetoothSingleton sharedInstance].Car_Data = NO;
    [BluetoothSingleton sharedInstance].Car_check = NO;
    [BluetoothSingleton sharedInstance].Car_Check = NO;
    [BluetoothSingleton sharedInstance].Car_Other = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBtn];
    [self initData];
    
    [_myTabView setUserInteractionEnabled:YES];
    _myTabView.allowsSelection = YES;
    [_naviBtn setImage:[UIImage imageNamed:@"return-clicked.png"] forState:UIControlStateHighlighted];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)initData{
    
    dataArr = @[@"发动机系统",@"排放系统",@"进气系统",@"故障诊断系统"];
    imgArr = @[@"发动机",@"三元催化剂",@"节气门",@"错"];
}

- (void)setBtn{
    _stateBtn.layer.borderColor = ALLBULE.CGColor;
    _stateBtn.layer.borderWidth = BORDERWIGHT;
    _stateBtn.layer.cornerRadius = 75.0f;
    _stateBtn.enabled = NO;
    [_stateBtn setTitle:[NSString stringWithFormat:@"%D", [BluetoothSingleton sharedInstance].config_E2] forState:UIControlStateNormal];
    
}
-(void)getTroubleStatus:(NSInteger)row Cell:(CustomTableViewCell*)cell{
    switch (row) {
        case 0:
            if ([BluetoothSingleton sharedInstance].RPMstatus == NO) {
                cell.imageView_state.image = [UIImage imageNamed:@"warning"];
            }
            
            break;
            
        case 1:
            if ([BluetoothSingleton sharedInstance].TPSstatus == NO) {
                cell.imageView_state.image = [UIImage imageNamed:@"warning"];
            }
            
            break;
            
        case 2:
            if ([BluetoothSingleton sharedInstance].CATTEMPstatus == NO) {
                cell.imageView_state.image = [UIImage imageNamed:@"warning"];
            }
            
            break;
            
        case 3:
            if ([BluetoothSingleton sharedInstance].TPSstatus == NO) {
                cell.imageView_state.image = [UIImage imageNamed:@"warning"];
            }
            
            break;
            
        default:
            break;
    }
    
    
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *tableCellIdentifier = @"CustomCell";
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableCellIdentifier];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.lab_name.text = [dataArr objectAtIndex:indexPath.row];
    cell.imageView_Name.image = [UIImage imageNamed:[imgArr objectAtIndex:indexPath.row]];
    [self getTroubleStatus:indexPath.row Cell:cell];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return tableView.frame.size.height/dataArr.count;
}

#pragma mark -UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *loveCarStorboard = [UIStoryboard storyboardWithName:@"LoveCarStoryboard" bundle:nil];
    AbnormalViewController  *abnVC = [loveCarStorboard  instantiateViewControllerWithIdentifier:@"AbnormalViewController"];
    abnVC.title = [[dataArr objectAtIndex:indexPath.row] stringByAppendingString:@"故障"];
    switch (indexPath.row) {
            
        case 0:
            abnVC.VCtype = Engine;
            [self.navigationController pushViewController:abnVC animated:YES];
            
            break;
        case 1:
            abnVC.VCtype = Discharge;
            [self.navigationController pushViewController:abnVC animated:YES];
            
            break;
        case 2:
            abnVC.VCtype = Airinflow;
            [self.navigationController pushViewController:abnVC animated:YES];
            
            break;
        case 3:
            abnVC.VCtype = Thefault;
            [self.navigationController pushViewController:abnVC animated:YES];
            
            break;
            
        default:
            break;
    }
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
