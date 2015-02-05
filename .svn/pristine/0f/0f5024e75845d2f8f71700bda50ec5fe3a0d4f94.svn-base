//
//  LoveCarViewController.m
//  AAOBD
//
//  Created by oi on 30/12/14.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "LoveCarViewController.h"
#import "CustomCollectionViewCell.h"
#import "public.h"
@interface LoveCarViewController ()

@property (weak, nonatomic) IBOutlet UIButton *checkCarBtn;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@end

@implementation LoveCarViewController{
    NSArray *btnTitleArr;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化数据
    [self initDataArr];
    [self setCheckCarBtnStyle];
    //注册Cell
    [self.myCollectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"CustomCell"];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [_myCollectionView reloadData];

}

- (void)setCheckCarBtnStyle{
   
    _checkCarBtn.layer.cornerRadius = 75.0;
    _checkCarBtn.layer.borderColor = ALLBULE.CGColor;
    _checkCarBtn.layer.borderWidth = BORDERWIGHT;
    
}

- (void)initDataArr{
    
    btnTitleArr = @[@"驾驶行为",@"仪表",@"地图",@"行程",@"保养",@"提示"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//快速检测
- (IBAction)onclickClickBtn:(UIButton *)sender {
    [self performSegueWithIdentifier:@"quickTest" sender:nil];
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
-(void)btnclick:(UIButton *)sender{
    switch (sender.tag) {
        case 0:
            [self nextViewControllerWithIdentifier:@"drivingBehavior"];
            break;
            
        case 1:
            [self nextViewControllerWithIdentifier:@"Meter"];
            break;
        case 2:
            [self nextViewControllerWithIdentifier:@"mapViewController"];
         
            break;
        case 3:
            [self nextViewControllerWithIdentifier:@"trip"];
            
            break;

        case 4:
            [self nextViewControllerWithIdentifier:@"Upkeep"];
//            [[[UIAlertView alloc]initWithTitle:APPNAME message:@"保养尚未开通" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil, nil] show];
            break;
        case 5:
            [self nextViewControllerWithIdentifier:@"promp"];
            
            
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

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 10;
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
