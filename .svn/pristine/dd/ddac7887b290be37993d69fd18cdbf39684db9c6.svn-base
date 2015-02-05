//
//  UpkeepViewController.m
//  AAOBD
//
//  Created by oi on 22/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "UpkeepViewController.h"
#import "UpkeepCollectionViewCell.h"
#import "UpkeepCollectionViewCell2.h"
#import "public.h"
#import "SelectDateView.h"
@interface UpkeepViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITextFieldDelegate,SelectDateViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITextField *tf_KM;
@property (weak, nonatomic) IBOutlet UITextField *tef_money;
@property (weak, nonatomic) IBOutlet UIButton *dateBtn;

@end

@implementation UpkeepViewController{


    NSArray *btnTitleArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    //注册Cell
//    [self.collectionView registerClass:[UpkeepCollectionViewCell class] forCellWithReuseIdentifier:@"CustomCell"];
//    [self.collectionView registerClass:[UpkeepCollectionViewCell2 class] forCellWithReuseIdentifier:@"CustomCell1"];
    _collectionView.userInteractionEnabled = YES;
    
    _tef_money.layer.borderWidth = 1.0;
    _tef_money.layer.borderColor = ALLTEXTCOLOR.CGColor;
    
    _tf_KM.layer.borderWidth = 1.0;
    _tf_KM.layer.borderColor = ALLTEXTCOLOR.CGColor;
    
    [self setNextDay];
    // Do any additional setup after loading the view.
}
- (IBAction)onclickDateBtn:(UIButton *)sender {
    
    SelectDateView *dateView = [[[NSBundle mainBundle]loadNibNamed:@"SelectDateView" owner:self options:nil] objectAtIndex:0];
    dateView.delegate = self;
    [dateView setFrame:CGRectMake(0, self.view.bounds.size.height- dateView.frame.size.height, self.view.bounds.size.width, 200)];
//    [dateView.datePicker setMaximumDate:[NSDate date]];
    [self.view addSubview:dateView];
    [self.view bringSubviewToFront:dateView];

}
//确认
- (IBAction)onclickOKBtn:(UIButton *)sender {
    
}

-(void)setNextDay{
    NSDate * lDtae =[NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *fromdate=[dateFormatter stringFromDate:lDtae];
    NSString *fromdate1 =[NSString  stringWithFormat:@"< %@ >",fromdate];
    [_dateBtn setTitle:fromdate1 forState:UIControlStateNormal];
    [_dateBtn setTitleColor:ALLTEXTCOLOR forState:UIControlStateNormal];
//    NSDate *newDate = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([lDtae timeIntervalSinceReferenceDate] + 24*3600)];
//    NSString *  reportDate = [dateFormatter stringFromDate:newDate];
  }
-(void)initData{
    if (btnTitleArr == nil) {
        btnTitleArr =@[@"发动机油",@"后制动器",@"机油滤芯器",@"四轮定位",@"空气滤芯器",@"动平衡",@"燃油滤芯器",@"清洗节气门",@"空调滤芯器",@"清洗喷油嘴",@"火花塞",@"清洗油路",@"转向助力液",@"整车制动液",@"变速箱油",@"蓄电池",@"冷却液",@"发动机套件",@"前制动器",@"轮胎"];
    }

}
#pragma mark  - UICollectionViewDateSoure
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0)
        return [self returnNumOfSectionFrist];
    else {
        return 1;
       }
}
//返回第一组的section
-(int)returnNumOfSectionFrist{
    if (btnTitleArr.count > 0) {
        return (int)btnTitleArr.count;
    }else{
        return 0;
    }


}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [self returnUpkeepCollectionViewCell2:indexPath andCollectionView:collectionView];
    }else{
        return [self returnUpkeepCollectionViewCell:indexPath andCollectionView:collectionView];
    }
}
//返回第2组的cell
-(UICollectionViewCell *)returnUpkeepCollectionViewCell:(NSIndexPath *)indexPath andCollectionView:(UICollectionView *)collectionView {
    

    NSString *cellIdentifier = [NSString stringWithFormat:@"CustomCell1%ld%ld",indexPath.row,indexPath.section];
    [self.collectionView registerClass:[UpkeepCollectionViewCell2 class] forCellWithReuseIdentifier:cellIdentifier];
    UpkeepCollectionViewCell2 *cell = (UpkeepCollectionViewCell2 *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];

    return cell;


}
//返回第一组的cell
-(UICollectionViewCell *)returnUpkeepCollectionViewCell2:(NSIndexPath *)indexPath andCollectionView:(UICollectionView *)collectionView {
    

    NSString *cellIdentifier = [NSString stringWithFormat:@"CustomCell%ld%ld",indexPath.row,indexPath.section];
    [self.collectionView registerClass:[UpkeepCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    UpkeepCollectionViewCell *cell = (UpkeepCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];

    cell.backgroundColor = [UIColor clearColor];
    cell.lab_text.text = [btnTitleArr objectAtIndex:indexPath.row];
    cell.lab_text.textColor =  ALLTEXTCOLOR;
    cell.Btn_check.tag = indexPath.row;

    return cell;
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
      return   [self returnCollectionViewFrist];
    }else{
        return [self returnCollectionViewtwo];
        
    }
    
}
//第一组
-(CGSize)returnCollectionViewFrist{
    
    if (self.view.bounds.size.width  == 375) {
        //ip6
        return CGSizeMake(150.0, 60);
    }else if (self.view.bounds.size.width >375) {
        //ip6+
         return CGSizeMake(150, 60);
    }else{
        //ip5
        return  CGSizeMake(150, 60);
        
    }
}
//第2组
-(CGSize)returnCollectionViewtwo{
    if (self.view.bounds.size.width == 375) {
        //ip6
        return CGSizeMake(350, 50);
    }else if (self.view.bounds.size.width >375) {
        //ip6+
        return CGSizeMake(520, 50);
    }else{
        //ip5
        return  CGSizeMake(300, 50);
        
    }

}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 10;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        [self didSelectUpkeepCollectionCell:collectionView andSelectItemAtIndexPath:indexPath];
    }else{
        [self didSelectUpkeepCollectionCell1:collectionView andSelectItemAtIndexPath:indexPath];
    
    }
    

}
//第一组CELL
-(void)didSelectUpkeepCollectionCell:(UICollectionView *)collectionView andSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UpkeepCollectionViewCell *cell =(UpkeepCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (cell == nil) {
        return;
    }
    cell.isSelect = !cell.isSelect;
    if (cell.isSelect) {
        [cell.Btn_check setImage:[UIImage imageNamed:@"check_Checked.png"] forState:UIControlStateNormal];
        
    }else{
        [cell.Btn_check setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
    }

}
//第二组
-(void)didSelectUpkeepCollectionCell1:(UICollectionView *)collectionView andSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"save data");
    [self performSegueWithIdentifier:@"historyUpKeep" sender:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)naviBackBtn:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onclickSaveBtn:(UIButton *)sender {
    NSLog(@"save");
}

-(void)selectTime:(NSString *)time{

    [_dateBtn setTitle:time forState:UIControlStateNormal];

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
