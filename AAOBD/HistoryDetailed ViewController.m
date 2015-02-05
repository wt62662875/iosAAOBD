//
//  HistoryDetailed ViewController.m
//  AAOBD
//
//  Created by oi on 22/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "HistoryDetailed ViewController.h"
#import "public.h"
//#import "HistoryDeTableViewCell.h"
@interface HistoryDetailed_ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HistoryDetailed_ViewController{

    NSArray *Dataarray;
    NSArray *Dataarray1;
    NSArray *DATAarr;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    _tableView.backgroundColor = [UIColor clearColor];
    UINib *cellNib =[UINib nibWithNibName:@"HistoryDeTableViewCell" bundle:nil];
    [_tableView registerNib:cellNib forCellReuseIdentifier:@"HistoryDeTableViewCell"];
    
    
}
-(void)initData{
    if (Dataarray == nil) {
        Dataarray=@[@"费用：151RMB",@"里程：1512 KM",@"时间：2014-11-30"];
        Dataarray1 = @[@"后车制动器",@"机油滤芯器"
                                ,@"后车制动器",@"机油滤芯器"];
        DATAarr =@[@"后车制动器",@"机油滤芯器",@"后车制动器",@"机油滤芯器"];
        
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 30;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 66;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == 1) {
          return @"项目:";
    }else{
        return nil;
    }
  
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return Dataarray.count;
    }else{
        return Dataarray1.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil) {
            cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.textLabel.textColor = ALLBULE;
        cell.textLabel.text = [Dataarray objectAtIndex:indexPath.row];
        cell.backgroundColor = [UIColor clearColor];

        return cell;
    }else {
        
        NSString *cellIdentifier = [NSString stringWithFormat:@"Cell%ld%ld", (long)[indexPath section], (long)[indexPath row]];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        }
        cell.textLabel.text = [DATAarr objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [Dataarray1 objectAtIndex:indexPath.row];
        cell.textLabel.textColor = ALLTEXTCOLOR;
        cell.backgroundColor = [UIColor clearColor];
        if (indexPath.row == Dataarray1.count+1) {
            
            
        }
        
        return cell;
        
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 1) {
        return 80.0;
    }else{
        return 0.00;
    }

}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    if (section == 1) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENHTIGHT, 80)];
        view.backgroundColor = [UIColor clearColor];
        
        
       UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 40-15, 300, 30)];
//        [lab setCenter:self.view.center];
        lab.text = @"备注：300元交付的包含工时费";
        lab.textColor = ALLTEXTCOLOR;
        [view addSubview:lab];
        
        return view;
    }else{
    
        return nil;
    }
}
- (IBAction)dismissNavgationBtn:(UIButton *)sender {
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
