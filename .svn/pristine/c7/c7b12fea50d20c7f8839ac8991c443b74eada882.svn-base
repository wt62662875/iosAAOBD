//
//  HistoryViewController.m
//  AAOBD
//
//  Created by oi on 21/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "HistoryViewController.h"
#import "HIsTableViewCell.h"
@interface HistoryViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation HistoryViewController{

    NSArray *array;
    NSArray *pioArrays;
}

- (void)viewDidLoad {
    self.title = @"历史轨迹";
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINib *nib = [UINib nibWithNibName:@"HIsTableViewCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:@"cell"];
    
    
    [self initData];

}
-(void)initData{
    if (array == nil) {
        array = @[@"dsadas",@"dass",@"dsadas",@"dass",@"dsadas",@"dass"];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- tableViewDelegate && tableViewDataSou
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HIsTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.lab_text.text = [array objectAtIndex:indexPath.row];
    cell.sub_lab.text = [array objectAtIndex:indexPath.row];
    cell.lab_end.text =[array objectAtIndex:indexPath.row];
    cell.sub_end.text = [array objectAtIndex:indexPath.row];
    cell.imgView.image = [UIImage imageNamed:@"导航"];
    cell.img_end.image = [UIImage imageNamed:@"历史轨迹"];
        
       
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"maphis" sender:nil];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100.0;
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
