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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBtn];
    [self initData];
    
    [_myTabView setUserInteractionEnabled:YES];
    _myTabView.allowsSelection = YES;
    [_naviBtn setImage:[UIImage imageNamed:@"return-clicked.png"] forState:UIControlStateHighlighted];


    

    
    NSDictionary * param =[[NSDictionary alloc]initWithObjectsAndKeys:UserName,@"Loginname",@"P1117",@"HitchCode",@"沃尔沃",@"Brand",nil ];

//    
//    [ASIClient POST_Path:@"/API/Mobile/OBD.ashx?method=gethitch&LoginName&HitchCode&Brand" params:asd completed:^(id JSON, NSString *stringData) {
//        
//        NSLog(@"json------------%@",[JSON objectForKey:@"Hitchvalue"]);
//        
//        //拉取数据成功
//        
//    } failed:^(NSError *error) {
//        //拉取失败,更多可能服务器关闭，手机无网络
//        NSLog(@"当前无网络");
//        ;
//        
//    }];
    
    [ASIClientPub getTroubleWithParam:param completed:^(id Json,NSString* strData){
        NSLog(@"json------------%@",[Json objectForKey:@"Hitchvalue"]);
    
    }
    failed:^(NSError *err){
        NSLog(@"服务器");
    }
    andIsLogin:^(BOOL isBool){
        NSLog(@"请登录");
    
    }];
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
