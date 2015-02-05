//
//  TripViewController.m
//  AAOBD
//
//  Created by oi on 21/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "TripViewController.h"
#import "public.h"
#import "CustomCellCollectionViewCell.h"
#import "CustomHisCollectionViewCell.h"
@interface TripViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,CustomHisCollectionViewCellDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btn_travel;
@property (weak, nonatomic) IBOutlet UIButton *btn_System;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *view_travl;
@property (weak, nonatomic) IBOutlet UIView *view_system;

@end

@implementation TripViewController{
    NSArray *driveTitleArr;
    BOOL  _isBool;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initData];
    //注册Cell
    [self.collectionView registerClass:[CustomCellCollectionViewCell class] forCellWithReuseIdentifier:@"CustomCell"];
    [self.collectionView registerClass:[CustomHisCollectionViewCell class] forCellWithReuseIdentifier:@"hiscell"];
    _collectionView.backgroundColor = [UIColor clearColor];
}

-(void)initData{

    if (driveTitleArr == nil ) {
        driveTitleArr = @[@"最高时速",@"单次行驶",@"行驶时间",@"百公里油耗",@"总油耗"];
    }
    
    _isBool = YES;
    _view_system.hidden = YES;

}
- (IBAction)onclickNaviBtn:(UIButton *)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onclickTravelBtn:(UIButton *)sender {
    _isBool = !_isBool;
    if (_isBool) {
        [sender setTitleColor:_view_system.backgroundColor forState:UIControlStateNormal];
        sender.enabled = NO;
        _btn_System.enabled=YES;
        _view_travl.hidden =  NO;
        _view_system.hidden = YES;
        [_btn_System setTitleColor:ALLTEXTCOLOR forState:UIControlStateNormal];
    }
    driveTitleArr =@[];
    driveTitleArr =@[@"最高时速",@"单次行驶",@"行驶时间",@"百公里油耗",@"总油耗"];
    [_collectionView reloadData];
    
}
- (IBAction)onclick_SystemBtn:(UIButton *)sender {
    _isBool = !_isBool;
    if (_isBool == NO) {
        [sender setTitleColor:_view_system.backgroundColor forState:UIControlStateNormal];
        [_btn_travel setTitleColor:ALLTEXTCOLOR forState:UIControlStateNormal];
        _view_travl.hidden = YES;
        _view_system.hidden= NO;
        sender.enabled = NO;
        _btn_travel.enabled=YES;
    }
    driveTitleArr =@[];
    driveTitleArr = @[@"水温",@"进气温度",@"控制模块电压",@"节气门开度",@"三元催化剂温度",@"空气流量",@"点火提前角",@"剩余油量"];
    [_collectionView reloadData];
}
#pragma mark - UICollectionViewDataSource

#pragma mark  - UICollectionViewDateSoure
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 1) {
        return 1;
    }else{
        return driveTitleArr.count;
    }
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        static NSString *cellIdentifier = @"hiscell";
        CustomHisCollectionViewCell *cell = (CustomHisCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        cell.delegate = self;
        cell.backgroundColor = [UIColor clearColor];
        
        return cell;

    }else{
    
        static NSString *cellIdentifier = @"CustomCell";
        CustomCellCollectionViewCell *cell = (CustomCellCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        
        cell.lab_title.text = [driveTitleArr objectAtIndex:indexPath.row];
        cell.lab_title.textColor = RGBCOLORA(153, 153, 153, 1);
        
        cell.lab_sub.text = @"dasdasd";
        cell.lab_sub.textColor = RGBCOLORA(153, 153, 153, 1);
        
        cell.img_imgView.image = [UIImage imageNamed:[driveTitleArr objectAtIndex:indexPath.row]];
        cell.backgroundColor = [UIColor clearColor];
        
        return cell;

    }
//    [cell.Btn setBackgroundImage:[UIImage imageNamed:title] forState:UIControlStateNormal];
//    cell.Btn.tag = indexPath.row;
//    [cell.Btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)nextViewControllerWithIdentifier:(NSString *)Identifier{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:Identifier sender:nil];
    });
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 1) {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width-10, 40);
    }else{
    
        return  CGSizeMake(120, 120);
    }
    
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 1) {
         return UIEdgeInsetsMake(5, 0, 5, 5);
    }else{
        return UIEdgeInsetsMake(5, 30, 5, 30);
    }
   
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 10;
}
-(void)onclickBtn_hisOnDelegate{
    NSLog(@"历史数据");
    [self performSegueWithIdentifier:@"hisdata" sender:nil];
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
