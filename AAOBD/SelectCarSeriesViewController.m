//
//  SelectCarSeriesViewController.m
//  AAOBD
//
//  Created by wt on 15/1/22.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "SelectCarSeriesViewController.h"
#import "SelectBrandViewController.h"
#import "CarTypeViewController.h"
@interface SelectCarSeriesViewController ()
{
    NSMutableArray *sortedArray;//品牌
    NSMutableArray *sortHeaders;//品牌头字母
    FMDatabase *db;
    NSString *CarSeries;
}

@end

@implementation SelectCarSeriesViewController
@synthesize BrandStr;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"car" ofType:@"db"];
    db = [[FMDatabase alloc]initWithPath:path];
    if (![db open]) {
        NSLog(@"打开失败");
        return;
    }else{
        NSLog(@"打开成功");
    }
    NSString *str1 = [NSString stringWithFormat:@"SELECT DISTINCT Car_series FROM Car_info WHERE Car_Brand='%@'",BrandStr];
    FMResultSet *rs = [db executeQuery:str1];
    
    NSMutableArray *mystr = [[NSMutableArray alloc]init];
    NSMutableArray *newStr = [[NSMutableArray alloc]init];
    BOOL isExist;
    while ([rs next]) {
        [mystr addObject:[rs stringForColumn:@"Car_series"]];
    }
    
    for (int i=0; i<[mystr count]; i++) {
        isExist = YES;
        for (int j=0; j<[newStr count]; j++) {
            if ([newStr[j]isEqualToString:mystr[i]]) {
                isExist = NO;
                break;
            }
        }
        if (isExist) {
            [newStr addObject:mystr[i]];
        }
    }
    sortedArray = [NSMutableArray arrayWithArray:[self getChinesArray:newStr]];
    [db close];
    

    // Do any additional setup after loading the view.
}
-(NSMutableArray*)getChinesArray:(NSMutableArray*)arrToSort
{
    //创建一个临时的变动数组
    NSMutableArray *chineseStringsArray = [NSMutableArray array];
    for(int i =0; i < arrToSort.count; i++)
    {
        
        //创建一个临时的数据模型对象
        ChineseString *chineseString=[[ChineseString alloc]init];
        //给模型赋值
        chineseString.string=[NSString stringWithString:[arrToSort objectAtIndex:i]];
        
        if(chineseString.string==nil)
        {
            chineseString.string=@"";
        }
        if(![chineseString.string isEqualToString:@""])
        {
            //join(链接) the pinYin (letter字母) 链接到首字母
            NSString *pinYinResult = [NSString string];
            
            //按照数据模型中row的个数循环
            
            for(int j =0;j < chineseString.string.length; j++)
            {
                NSString *singlePinyinLetter = [[NSString stringWithFormat:@"%c",
                                                 pinyinFirstLetter([chineseString.string characterAtIndex:j])]uppercaseString];
                pinYinResult = [pinYinResult stringByAppendingString:singlePinyinLetter];
            }
            chineseString.pinYin = pinYinResult;
            
        } else {
            chineseString.pinYin =@"";
        }
        [chineseStringsArray addObject:chineseString];
    }
    
    //sort(排序) the ChineseStringArr by pinYin(首字母)
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"pinYin"ascending:YES]];
    
    [chineseStringsArray sortUsingDescriptors:sortDescriptors];
    
    NSMutableArray *arrayForArrays = [NSMutableArray array];
    
    BOOL checkValueAtIndex=NO; //flag to check
    
    NSMutableArray *TempArrForGrouping =nil;
    
    NSMutableArray *heads = [NSMutableArray array];
    
    for(int index =0; index < [chineseStringsArray count]; index++)
    {
        ChineseString *chineseStr = (ChineseString *)[chineseStringsArray objectAtIndex:index];
        
        NSMutableString *strchar= [NSMutableString stringWithString:chineseStr.pinYin];
        //sr containing here the first character of each string  (这里包含的每个字符串的第一个字符)
        NSString *sr= [strchar substringToIndex:1];
        //here I'm checking whether the character already in the selection header keys or not  (检查字符是否已经选择头键)
        
        if(![heads containsObject:[sr uppercaseString]])
        {
            [heads addObject:[sr uppercaseString]];
            
            TempArrForGrouping = [[NSMutableArray alloc]initWithObjects:nil];
            
            checkValueAtIndex = NO;
        }
        
        if([heads containsObject:[sr uppercaseString]])
        {
            [TempArrForGrouping addObject:[chineseStringsArray objectAtIndex:index]];
            
            if(checkValueAtIndex == NO)
            {
                [arrayForArrays addObject:TempArrForGrouping];
                checkValueAtIndex = YES;
            }
        }
        
    }
    
    sortHeaders = [NSMutableArray arrayWithArray:heads];
    return arrayForArrays;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return sortHeaders.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = [sortedArray objectAtIndex:section];
    return array.count;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return sortHeaders;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //索引路径
    
    static NSString *CellIdentifier = @"Cell";
    SelectCarSeriesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[SelectCarSeriesTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = RGBCOLORA(29, 30, 34, 1);
    }
    
    NSArray *array = [sortedArray objectAtIndex:indexPath.section];
    ChineseString *china = [array objectAtIndex:indexPath.row];
    cell.lab.text = china.string;
    cell.lab.tag = indexPath.row;
    
//    cell.lab2.text = @"16个车型";
    return cell;
    
}
//获取分组标题并显示
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return sortHeaders[section];
}
//重新设置一下tableviewcell的行高为70
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = [sortedArray objectAtIndex:indexPath.section];
    ChineseString *china = [array objectAtIndex:indexPath.row];
    CarSeries = china.string;
//    NSLog(@"%@=======%@",china.string,BrandStr);
//    BrandStr = china.string;
    [self performSegueWithIdentifier:@"SelectCarSToCarType" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CarTypeViewController *ctvc = segue.destinationViewController;
    [ctvc setCarSeries:CarSeries];
    [ctvc setBrandStr:BrandStr];
    
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