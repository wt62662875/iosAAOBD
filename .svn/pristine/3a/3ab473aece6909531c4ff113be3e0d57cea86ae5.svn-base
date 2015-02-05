//
//  CarMessageViewController.m
//  AAOBD
//
//  Created by wt on 15/1/23.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "CarMessageViewController.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "FMDatabasePool.h"
#import "FMDatabaseQueue.h"
#import "FMResultSet.h"
#import "pinyin.h"
#import "ChineseString.h"
#import "public.h"
@interface CarMessageViewController ()
{
    NSString *thisBrand;//汽车品牌
    NSString *thisSeries;//车系
    NSString *thisModel;//车型
    NSString *thisDisplacement;//排量
    NSString *thisPublish;//年份
    NSString *thisWeight;//重量
    NSString *thisGear_box;//变速箱
    NSString *thisFrontwheel;//前轮型号
    NSString *thisBackwheel;//后轮
    NSString *thisFuel;//燃油型号
    NSString *thisVolume;//油箱容量
}
@property (strong, nonatomic) IBOutlet UITableView *TableView;

@end

@implementation CarMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"-=-=-=-=%@-=-=-=%@",_Model,_Brand);
    //打开数据库，获取数据
    NSString *path = [[NSBundle mainBundle]pathForResource:@"car" ofType:@"db"];
    FMDatabase *db = [[FMDatabase alloc]initWithPath:path];
    if (![db open]) {
        NSLog(@"打开失败");
        return;
    }else{
        NSLog(@"打开成功");
    }
    NSString *str = [NSString stringWithFormat:@"SELECT * FROM Car_info WHERE Car_model='%@' AND Car_brand='%@'",_Model,_Brand];
    FMResultSet *rs = [db executeQuery:str];
    while ([rs next]) {
        thisBrand = [rs stringForColumn:@"Car_brand"];
        thisSeries = [rs stringForColumn:@"Car_series"];
        thisModel = [rs stringForColumn:@"Car_model"];
        thisDisplacement = [rs stringForColumn:@"Car_displacement"];
        thisPublish = [rs stringForColumn:@"Car_publish"];
        thisWeight = [rs stringForColumn:@"Car_weight"];
        thisGear_box = [rs stringForColumn:@"Car_gear_box"];
        thisFrontwheel = [rs stringForColumn:@"Car_frontwheel"];
        thisBackwheel = [rs stringForColumn:@"Car_backwheel"];
        thisFuel = [rs stringForColumn:@"Car_fuel"];
        thisVolume = [rs stringForColumn:@"Car_volume"];

    }

    NSLog(@"====================%@",thisBrand);
    NSLog(@"====================%@",thisSeries);
    NSLog(@"====================%@",thisModel);
    NSLog(@"====================%@",thisDisplacement);
    NSLog(@"====================%@",thisPublish);
    NSLog(@"====================%@",thisWeight);
    NSLog(@"====================%@",thisGear_box);
    NSLog(@"====================%@",thisFrontwheel);
    NSLog(@"====================%@",thisBackwheel);
    NSLog(@"====================%@",thisFuel);
    NSLog(@"====================%@",thisVolume);

    
    [db close];
    
    //footview
    UIView *headView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 75)];
    headView.backgroundColor = [UIColor blackColor];
    
    UILabel *brandLab =[[UILabel alloc]initWithFrame:CGRectMake(70, 5, 80, 25)];
    brandLab.textColor = RGBCOLORA(135, 135, 135, 1);
    brandLab.font = [UIFont boldSystemFontOfSize:14];
    brandLab.text = thisBrand;
    [headView addSubview:brandLab];
    
    UILabel *SeriesLab =[[UILabel alloc]initWithFrame:CGRectMake(70, 25, 150, 25)];
    SeriesLab.textColor = RGBCOLORA(135, 135, 135, 1);
    SeriesLab.font = [UIFont boldSystemFontOfSize:12];
    SeriesLab.text = thisSeries;
    [headView addSubview:SeriesLab];
    
    UILabel *ModelLab =[[UILabel alloc]initWithFrame:CGRectMake(70, 45, 200, 25)];
    ModelLab.textColor = RGBCOLORA(135, 135, 135, 1);
    ModelLab.font = [UIFont boldSystemFontOfSize:12];
    ModelLab.text = thisModel;
    [headView addSubview:ModelLab];
    
    _TableView.tableHeaderView =  headView;
    // Do any additional setup after loading the view.
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //索引路径
    
    static NSString *CellIdentifier = @"Cell";
    CarMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CarMessageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = RGBCOLORA(29, 30, 34, 1);
    }
    
    switch (indexPath.row) {
        case 0:
            cell.lab.text = @"排量";
            cell.lab2.text = thisDisplacement;
            break;
        case 1:
            cell.lab.text = @"发布年份";
            cell.lab2.text = thisPublish;
            break;
        case 2:
            cell.lab.text = @"整车质量";
            cell.lab2.text = thisWeight;
            break;
        case 3:
            cell.lab.text = @"发变速类型";
            cell.lab2.text = thisGear_box;
            break;
        case 4:
            cell.lab.text = @"档位";
            cell.lab2.text = thisDisplacement;
            break;
        case 5:
            cell.lab.text = @"前轮胎型号";
            cell.lab2.text = thisFrontwheel;
            break;
        case 6:
            cell.lab.text = @"后轮胎型号";
            cell.lab2.text = thisBackwheel;
            break;
        case 7:
            cell.lab.text = @"燃油型号";
            cell.lab2.text = thisFuel;
            break;
        case 8:
            cell.lab.text = @"油箱容量";
            cell.lab2.text = [NSString stringWithFormat:@"%@L",thisVolume];
            break;
        case 9:
            cell.lab.text = @"当前油价";
            cell.lab2.text = @"7.08元/升";
            break;
        default:
            break;
    }
//    NSString *;//年份
//    NSString *;//重量
//    NSString *;//变速箱
//    NSString *;//前轮型号
//    NSString *;//后轮
//    NSString *;//燃油型号
//    NSString *;//油箱容量

//    NSArray *array = [sortedArray objectAtIndex:indexPath.section];
//    ChineseString *china = [array objectAtIndex:indexPath.row];
//    cell.lab.text = china.string;
//    cell.lab.tag = indexPath.row;
    
    return cell;
    
}

//重新设置一下tableviewcell的行高为70
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSArray *array = [sortedArray objectAtIndex:indexPath.section];
//    ChineseString *china = [array objectAtIndex:indexPath.row];
//    BrandStr = china.string;
//    [self performSegueWithIdentifier:@"SelectBranToSelectBrand" sender:self];
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
