//
//  CarTypeViewController.m
//  AAOBD
//
//  Created by wt on 15/1/22.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "CarTypeViewController.h"
#import "SelectCarSeriesViewController.h"
#import "SelectBrandViewController.h"
#import "CarCompatibilityViewController.h"
#import "CarInformationTableViewCell.h"
#import "Alert.h"
#import "AppUtils.h"
#import "ASIClient.h"
#import "MBHUDView.h"
@interface CarTypeViewController ()
{
    NSMutableArray *sortedArray;
    NSMutableArray *Car_Model;//年款
    NSMutableArray *Car_PL;//排量
    NSMutableArray *Car_Date;//年份
    NSMutableArray *Car_Weight;//重量
    NSMutableArray *Car_Gearboxs_Type;//变速箱
    NSString *model;
    NSString *isregforcar;
}
@end

@implementation CarTypeViewController
@synthesize BrandStr,CarSeries;//品牌，车系

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.navigationController.viewControllers);
    NSString *path = [[NSBundle mainBundle]pathForResource:@"car" ofType:@"db"];
    FMDatabase *db = [[FMDatabase alloc]initWithPath:path];
    if (![db open]) {
        NSLog(@"打开失败");
        return;
    }else{
        NSLog(@"打开成功");
    }
    NSString *str1 = [NSString stringWithFormat:@"SELECT Car_model,Car_displacement,Car_publish,Car_weight,Car_gear_box FROM Car_info WHERE Car_brand='%@' and Car_series='%@' ORDER BY Car_publish",BrandStr,CarSeries];
    NSString *str2 = [NSString stringWithFormat:@"SELECT DISTINCT Car_publish FROM Car_info WHERE Car_brand='%@' and Car_series='%@' ORDER BY Car_Date",BrandStr,CarSeries];
    
    FMResultSet *rs = [db executeQuery:str1];
    FMResultSet *rs2 = [db executeQuery:str2];
    NSMutableArray *mystr1 = [[NSMutableArray alloc]init];
    NSMutableArray *mystr2 = [[NSMutableArray alloc]init];
    NSMutableArray *mystr3 = [[NSMutableArray alloc]init];
    NSMutableArray *mystr4 = [[NSMutableArray alloc]init];
    NSMutableArray *mystr5 = [[NSMutableArray alloc]init];
    
    NSMutableArray *mmstr = [[NSMutableArray alloc]init];
    while ([rs2 next]) {
        NSString *strI = [NSString stringWithFormat:@"%d",[rs2 intForColumn:@"Car_publish"]];
        [mmstr addObject:strI];
    }
    sortedArray = [NSMutableArray arrayWithArray: mmstr];
    while ([rs next]) {
        if ([rs stringForColumn:@"Car_model"]==nil) {
            [mystr1 addObject:@""];
        }else{
            [mystr1 addObject:[rs stringForColumn:@"Car_Model"]];
        }
        if ([rs stringForColumn:@"Car_displacement"]==nil) {
            [mystr2 addObject:@""];
        }else{
            NSString *strInt2 = [NSString stringWithFormat:@"%0.1f",(float)[rs intForColumn:@"Car_displacement"]/1000];
            [mystr2 addObject:strInt2];
        }
        if ([rs stringForColumn:@"Car_publish"]==nil) {
            [mystr3 addObject:@""];
        }else{
            NSString *strInt3 = [NSString stringWithFormat:@"%d",[rs intForColumn:@"Car_publish"]];
            [mystr3 addObject:strInt3];
        }
        if ([rs stringForColumn:@"Car_weight"]==nil) {
            [mystr4 addObject:@""];
        }else{
            NSString *strInt4 = [NSString stringWithFormat:@"%d",[rs intForColumn:@"Car_weight"]];
            [mystr4 addObject:strInt4];
        }
        if ([rs stringForColumn:@"Car_gear_box"]==nil) {
            [mystr5 addObject:@""];
        }else{
            [mystr5 addObject:[rs stringForColumn:@"Car_gear_box"]];
        }
        
    }
    Car_Model = [NSMutableArray arrayWithArray:mystr1];
    Car_PL = [NSMutableArray arrayWithArray:mystr2];
    Car_Date = [NSMutableArray arrayWithArray: mystr3];
    Car_Weight = [NSMutableArray arrayWithArray:mystr4];
    Car_Gearboxs_Type = [NSMutableArray arrayWithArray:mystr5];
    
    [db close];

}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Car_Model.count;
}
//获取分组标题并显示
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return sortedArray[section];
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    // Return the number of sections.
//    return sortedArray.count;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //索引路径
    
    static NSString *CellIdentifier = @"Cell";
    CarTypeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[CarTypeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row%2 == 0) {
        cell.backgroundColor = RGBCOLORA(29, 30, 34, 1);
    }else{
        cell.backgroundColor = [UIColor blackColor];
    }
    cell.lab1.text =[Car_Model objectAtIndex:indexPath.row];
    
    NSString *str2 = [NSString stringWithFormat:@"排量：%@L",[Car_PL objectAtIndex:indexPath.row]];
    cell.lab2.text = str2;
    
    NSString *str3 = [NSString stringWithFormat:@"发布年份：%@",[Car_Date objectAtIndex:indexPath.row]];
    cell.lab3.text =str3;
    
    NSString *str4 = [NSString stringWithFormat:@"整车质量：%@kg",[Car_Weight objectAtIndex:indexPath.row]];
    cell.lab4.text =str4;
    
    NSString *str5 = [NSString stringWithFormat:@"变速箱类型：%@",[Car_Gearboxs_Type objectAtIndex:indexPath.row]];
    cell.lab5.text =str5;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    model=[Car_Model objectAtIndex:indexPath.row];
    NSLog(@"%@",model);
//    [self.slCarTypedelegate selectCarType:str1];
        
    
    CarInformationViewController *rootview = [self.navigationController.viewControllers objectAtIndex:0];
    if ([rootview isKindOfClass:[CarInformationViewController class]]) {
        isregforcar = @"flase";
        [self conectFWQ];
    }else{
       isregforcar = @"true";
        [self conectFWQ];
    }
}

-(void)conectFWQ{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"car" ofType:@"db"];
    FMDatabase *db = [[FMDatabase alloc]initWithPath:path];
    NSString *thisprice;//价格
    NSString *thisDisplacement;//排量
    NSString *thisPublish;//年份
    NSString *thisWeight;//重量
    NSString *thisGear_box;//变速箱
    NSString *thisFrontwheel;//前轮型号
    NSString *thisBackwheel;//后轮
    NSString *thisFuel;//燃油型号
    NSString *thisVolume;//油箱容量
    if (![db open]) {
        NSLog(@"打开失败");
        return;
    }else{
        NSLog(@"打开成功");
    }
    NSString *str = [NSString stringWithFormat:@"SELECT * FROM Car_info WHERE Car_model='%@' AND Car_brand='%@'",model,BrandStr];
    FMResultSet *rs = [db executeQuery:str];
    while ([rs next]) {
        thisprice = [rs stringForColumn:@"Car_price"];
        thisDisplacement = [rs stringForColumn:@"Car_displacement"];
        thisPublish = [rs stringForColumn:@"Car_publish"];
        thisWeight = [rs stringForColumn:@"Car_weight"];
        thisGear_box = [rs stringForColumn:@"Car_gear_box"];
        thisFrontwheel = [rs stringForColumn:@"Car_frontwheel"];
        thisBackwheel = [rs stringForColumn:@"Car_backwheel"];
        thisFuel = [rs stringForColumn:@"Car_fuel"];
        thisVolume = [rs stringForColumn:@"Car_volume"];
        
    }
    if (thisprice == nil) {
        thisprice =@"";
    }
    if (thisDisplacement == nil) {
        thisDisplacement =@"";
    }
    if (thisPublish == nil) {
        thisPublish =@"";
    }
    if (thisWeight == nil) {
        thisWeight =@"";
    }
    if (thisGear_box == nil) {
        thisGear_box =@"";
    }if (thisFrontwheel == nil) {
        thisFrontwheel =@"";
    }
    if (thisBackwheel == nil) {
        thisBackwheel =@"";
    }
    if (thisFuel == nil) {
        thisFuel =@"";
    }
    if (thisVolume == nil) {
        thisVolume =@"";
    }
    [db close];
    
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
        
        NSDictionary * pas=[[NSDictionary alloc]initWithObjectsAndKeys:UserPhoneNomber,@"LoginName",UserID,@"UserID",thisprice,@"CarPrice",BrandStr,@"Carbrand",CarSeries,@"Carseries",model,@"Carmodel",thisDisplacement,@"Cardisplacement",thisPublish,@"Carpublish",thisWeight,@"Carweight",thisGear_box,@"Cargear_box",thisFrontwheel,@"Carfrontwheel",thisBackwheel,@"Carbackwheel",thisFuel,@"Carfuel",thisVolume,@"Carvolume",isregforcar,@"regforcar",nil];
        [ASIClient POST_Path:@"/API/Mobile/OBD.ashx?method=addsecure&LoginName&CarPrice&Carbrand&Carseries&Carmodel&Cardisplacement&Carpublish&Carweight&Cargear_box&Carfrontwheel&Carbackwheel&Carfuel&Carvolume&regforcar" params:pas completed:^(id JSON, NSString *stringData) {
            
            NSLog(@"json------------%@",JSON);
            
            //拉取数据成功
            if ([[JSON objectForKey:@"Result"] boolValue]) {
                NSLog(@"请求成功");
                if ([isregforcar isEqualToString:@"true"]) {
                    [self performSegueWithIdentifier:@"CarTypeToFristView" sender:nil];
                }else{
                    CarInformationViewController *rootview = [self.navigationController.viewControllers objectAtIndex:0];
                    [self.navigationController popToRootViewControllerAnimated:YES];
                    rootview.brandStr = BrandStr;
                    rootview.carSeries = CarSeries;
                    rootview.model = model;
                    rootview.CarId = [JSON objectForKey:@"Msg"];
                }
            }else{
                alv.image = @"error";
                alv.message = @"数据错误";
                [self.navigationController.view addSubview:alv];
            }
            [MBHUDView dismissCurrentHUD];
            
        } failed:^(NSError *error) {
            //拉取失败,更多可能服务器关闭，手机无网络
            NSLog(@"当前无网络");
            [MBHUDView dismissCurrentHUD];
            
        }];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
