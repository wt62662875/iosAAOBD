//
//  HistoryUpKeepViewController.m
//  AAOBD
//
//  Created by oi on 22/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "HistoryUpKeepViewController.h"
#import "public.h"
@interface HistoryUpKeepViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HistoryUpKeepViewController{

    NSArray *dataArray;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
}
-(void)initData{
    if (dataArray == nil) {
        dataArray =@[@"2555公里保养",@"2555公里保养",@"2555公里保养",@"2555公里保养"];
    }
    _tableView.backgroundColor = [UIColor clearColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dismissNaviBtn:(UIButton *)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell ==nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        }
    cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"2014-10-30";
    cell.textLabel.textColor = ALLTEXTCOLOR;
    cell.detailTextLabel.textColor = ALLTEXTCOLOR;
    cell.backgroundColor = [UIColor clearColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"HistoryDetailed" sender:nil];
    
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
