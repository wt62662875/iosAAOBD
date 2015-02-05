//
//  PromptViewController.m
//  AAOBD
//
//  Created by oi on 21/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "PromptViewController.h"
#import "PromptTableViewCell.h"
@interface PromptViewController ()<UITableViewDataSource,UITableViewDelegate,PromptTableViewCellDelegate>

@end

@implementation PromptViewController{

    NSArray *dataArray;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    UINib *nib = [UINib nibWithNibName:@"PromptTableViewCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:@"cell"];
    _tableView.backgroundColor = [UIColor clearColor];
    // Do any additional setup after loading the view.
}

-(void)initData{
    if (dataArray == nil) {
        dataArray = @[@"车辆年检提醒",@"驾照年审提醒",@"驾照换证提醒",@"车辆续保提醒"];
    }

}
- (IBAction)naviBackBtn:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- tableViewDatasouth && tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PromptTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.delegate = self;
    [cell setBackgroundColor:[UIColor clearColor]];

    cell.lab_text.text = [dataArray objectAtIndex:indexPath.row];
    cell.imgview.image = [UIImage imageNamed:[dataArray objectAtIndex:indexPath.row]];
    cell.swich_status.tag = indexPath.row;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100.0;
}
#pragma mark -PromptTableViewCellDelegate
-(void)didOnclickSwich:(UITableViewCell *)cell{
    PromptTableViewCell *lcell = (PromptTableViewCell *)cell;
    switch (lcell.swich_status.tag) {
        case 0:
            //车辆年检
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
