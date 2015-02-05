//
//  SetViewController.m
//  AAOBD
//
//  Created by wt on 14/12/30.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "SetViewController.h"
#import "CustomCollectionViewCell.h"
#import "Alert.h"
#import "AppUtils.h"
#import "MBHUDView.h"
#import "ASIClient.h"
#import "CarInformationViewController.h"
@interface SetViewController ()
{
    NSArray *btnTitleArr;
}
@property (strong, nonatomic) IBOutlet UICollectionView *SetCollectionView;

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据
    [self initDataArr];
    //注册Cell
    [self.SetCollectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"CustomCell"];
    // Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [_SetCollectionView reloadData];
    
}

- (void)initDataArr{
    
    btnTitleArr = @[@"个人信息",@"车辆信息",@"购买保险",@"语音提示",@"连接设置",@"车辆检测",@"离线地图",@"版本检测",@"关于车内宝",@"意见反馈"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark  - UICollectionViewDateSoure
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (btnTitleArr.count != 0) {
        return btnTitleArr.count;
    }else{
        return 0;
    }
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CustomCell";
    CustomCollectionViewCell *cell = (CustomCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    NSString *title = [btnTitleArr objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = title;
  
    cell.titleLabel.textColor = RGBCOLORA(153, 153, 153, 1);
    
    [cell.Btn setBackgroundImage:[UIImage imageNamed:title] forState:UIControlStateNormal];
    cell.Btn.tag = indexPath.row;
    [cell.Btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.backgroundColor = [UIColor clearColor];
    
    
    return cell;
    
}
//按钮点击
-(void)btnclick:(UIButton *)sender{
    switch (sender.tag) {
        case 0:
            [self nextViewControllerWithIdentifier:@"SetViewToPersonal"];
            break;
        case 1:
            [self nextViewControllerWithIdentifier:@"SetViewToCarInformation"];
            break;
        case 2:
            [self nextViewControllerWithIdentifier:@"SetViewToInsurance"];
            break;
        case 3:
            [self nextViewControllerWithIdentifier:@"SetViewToVoicePrompt"];
            break;
        case 4:
            [self nextViewControllerWithIdentifier:@"connectSetToVoicePrompt"];
            break;
        case 5:
            [self nextViewControllerWithIdentifier:@"CarCompatToVoicePrompt"];
            break;
        case 9:
            [self nextViewControllerWithIdentifier:@"SetToFeedback"];
            break;
        default:
            break;
    }
}


-(void)nextViewControllerWithIdentifier:(NSString *)Identifier{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:Identifier sender:nil];
    });
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.view.bounds.size.height > 568) {
        //ip6
        return CGSizeMake(96, 140);
    }else{
        //ip5
        return  CGSizeMake(96, 110);
        
    }
    
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}


-(void)buttonTapped:(id)sender {
    NSLog(@"Button Tapped");
}
#pragma mark - UICollectionViewDelegateFlowLayout
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 20;
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
