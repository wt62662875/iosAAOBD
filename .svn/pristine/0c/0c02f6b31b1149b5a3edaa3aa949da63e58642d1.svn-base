//
//  DrivingBehaviorViewController.m
//  AAOBD
//
//  Created by oi on 30/12/14.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//
#define BTNTITLEWHTIECOLOR   [UIColor whiteColor]
#define BTNTITLEREADCOLOR    [UIColor redColor]

#import "DrivingBehaviorViewController.h"
#import "StatisticalView.h"
#import "public.h"
#import "TableHeadView.h"
#import "DBCustomTableViewCell.h"
#import "ASIClient.h"
#import "ASIClientPub.h"
@interface DrivingBehaviorViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollerVeiw;
@property (weak, nonatomic) IBOutlet UIView *driveLevelView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *seg_dayOrWeek;

@end

@implementation DrivingBehaviorViewController{
    int dayOrWeekOrYear;

    __weak IBOutlet UIButton *btn_driveLevel;//驾驶等级
    __weak IBOutlet UIButton *btn_Statistical;//统计行为
    
    NSArray *dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setScrollViewSubViews];
    
    _driveLevelView.hidden = YES;
    
    [btn_Statistical setTitleColor:BTNTITLEREADCOLOR forState:UIControlStateNormal];
    dataArr = @[@"急刹车",@"加速",@"急转弯",@"超速"];
    

    
}

- (void)setScrollViewSubViews{
    
   
    _myScrollerVeiw.pagingEnabled =YES;
    if ([UIScreen mainScreen].bounds.size.height<568) {
     [self.myScrollerVeiw setContentSize:CGSizeMake(self.view.bounds.size.width*2,self.view.frame.size.height)];
    }else{
    [self.myScrollerVeiw setContentSize:CGSizeMake(self.view.bounds.size.width*2,_myScrollerVeiw.frame.size.height)];
    }
    _myScrollerVeiw.delegate = self;
  
    StatisticalView *lview = [[StatisticalView alloc]init];
    [lview setFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.frame.size.height-120)];
    lview.backgroundColor = [UIColor clearColor];
    [_myScrollerVeiw  addSubview:lview];
    
    [self drawScaleLine:lview];//画刻度线
    
    UITableView *lTableView = [[UITableView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width, 20, self.view.bounds.size.width, self.view.frame.size.height-120) style:UITableViewStylePlain];
    lTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    lTableView.bounces = NO;
    lTableView.delegate = (id)self;
    lTableView.dataSource  = (id)self;
    lTableView.backgroundColor = [UIColor clearColor];
    lTableView.allowsSelection =NO;
    UINib *nib = [UINib nibWithNibName:@"DBCustomTableViewCell" bundle:nil];
    [lTableView registerNib:nib forCellReuseIdentifier:@"cell"];
    [_myScrollerVeiw addSubview:lTableView];
    
    
    
}
- (void)drawScaleLine:(StatisticalView *)staView{
    UIImageView *imgView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 50, SCREENWIDTH, _myScrollerVeiw.frame.size.height-staView.frame.size.height)];
//     imgView.backgroundColor = [UIColor redColor];
    [_myScrollerVeiw addSubview:imgView];
   
    CGRect lastLabFrame ;
    //刻度
    for (int i=0 ; i<=20; i++) {
       if (i%5 == 0) {
           //刻度线
            [self drawline:40 startpoint:20+10*i endpoint:SCREENWIDTH-20 endpoint:20+10*i colorx:102 colory:102 colorz:102 linewidth:1];
           //刻度
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 85+10*i, 20, 15)];
            lab.textColor = RGBCOLORA(153, 153, 153, 1);
            lab.textAlignment = NSTextAlignmentCenter;
            lab.text =[NSString stringWithFormat:@"%d",40-i/5*10];
            lastLabFrame = lab.frame;
            [_myScrollerVeiw addSubview:lab];
        }else{
            
            [self drawline:40 startpoint:20+10*i endpoint:SCREENWIDTH-20 endpoint:20+10*i colorx:102 colory:102 colorz:102 linewidth:0.5];
        }
    }
    
    int numOfLabs ;
    
    switch (dayOrWeekOrYear) {
        case 0:
            //一天
            numOfLabs = 6;
            [self drawBottomCalibration:numOfLabs andWight:(SCREENWIDTH - 60)/numOfLabs andLab_Frame:lastLabFrame];
            
            break;
        case 1:
            //一周
            break;
        case 3:
            //一月
            break;
            
        default:
            break;
    }

}

- (CGRect)DataConversionGraphics:(int)data{
    CGRect Graphics_Frame;
    int graphics_y = data/2;
//    int graphics_x = 


    return Graphics_Frame;
}



/*!
 底部刻度
 */
- (void)drawBottomCalibration:(int)X andWight:(int)wight andLab_Frame:(CGRect)labFrame{
    for (int i = 0; i< X; i++) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(40+ i*wight, labFrame.origin.y+15, wight, 15)];
        lab.textColor = RGBCOLORA(153, 153, 153, 1);
        lab.textAlignment = NSTextAlignmentRight;
        lab.text =[NSString stringWithFormat:@"%d",i+1];
        [_myScrollerVeiw addSubview:lab];
    }


}
/*!
 @brief 画线
 @param x y 起点坐标 x y
 @param endx endy 终点坐标 endx endy
 @param colorx colory colory 颜色值
 @param linewidth 线宽
 */

-(void)drawline:(float)x startpoint:(float)y endpoint:(float)endx endpoint:(float)endy colorx:(float)colorx colory:(float)colory colorz :(float)colorz linewidth:(float)line{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0,70,self.view.frame.size.width, self.view.frame.size.height)];
    [_myScrollerVeiw addSubview:imageView];
    
//    UIGraphicsBeginImageContext(imageView.frame.size);
    
    UIGraphicsBeginImageContextWithOptions(imageView.frame.size,NO,0);
    
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapSquare);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), line);  //线宽
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), colorx, colory, colorz, 1.0);  //颜色
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), x  , y);  //起点坐标
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), endx, endy);   //终点坐标
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    imageView.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
}

//圆圈方法     圆位置x y
-(void)drawCiccle:(float)x ciccley:(float)y{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:self.view.frame];
    [_myScrollerVeiw addSubview:imageView];
    
    UIGraphicsBeginImageContext(imageView.frame.size);
    
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapSquare);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 1);  //线宽
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 153.0f, 255.0f, 1.0);  //颜色
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    
    CGContextAddArc(UIGraphicsGetCurrentContext(), x, y, 4, 0, 2*M_PI, 0);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    imageView.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}


- (IBAction)onclickLeftBarbutton:(UIButton *)sender {
    
     [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return dataArr.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    TableHeadView *lView =[[[NSBundle mainBundle]loadNibNamed:@"TableHeadView" owner:nil options:nil]firstObject];
    lView.titleLable.text = @"不良习惯";
    lView.backgroundColor = [UIColor clearColor];
    lView.titleLable.textColor = [UIColor whiteColor];
    
    return lView;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 50.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    DBCustomTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.lable_title.text =[dataArr objectAtIndex:indexPath.row];
    cell.lable_title.textColor = BTNTITLEWHTIECOLOR;
    cell.numLabel.text = @"1";
    cell.numLabel.textColor= BTNTITLEWHTIECOLOR;
    
    
    return cell;
}
- (IBAction)onclickBtns:(UIButton *)sender {
   
    switch (sender.tag) {
        case 0:{
            //行为统计
            _driveLevelView.hidden = YES;
            _seg_dayOrWeek.hidden = NO;
            [_myScrollerVeiw setContentOffset:CGPointMake(0, 0) animated:YES];
            [btn_Statistical setTitleColor:BTNTITLEREADCOLOR forState:UIControlStateNormal];
            [btn_driveLevel setTitleColor:BTNTITLEWHTIECOLOR forState:UIControlStateNormal];
           
            
            break;}
        case 1:{
            //行为统计
            _driveLevelView.hidden = NO;
            _seg_dayOrWeek.hidden = YES;
             [_myScrollerVeiw setContentOffset:CGPointMake(self.view.bounds.size.width, 0) animated:YES];
            [btn_Statistical setTitleColor:BTNTITLEWHTIECOLOR forState:UIControlStateNormal];
            [btn_driveLevel setTitleColor:BTNTITLEREADCOLOR forState:UIControlStateNormal];

            break;}
            
        default:
            break;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x == self.view.bounds.size.width) {
        _driveLevelView.hidden = NO;
        _seg_dayOrWeek.hidden = YES;
        [btn_Statistical setTitleColor:BTNTITLEWHTIECOLOR forState:UIControlStateNormal];
        [btn_driveLevel setTitleColor:BTNTITLEREADCOLOR forState:UIControlStateNormal];
        
    }else if (scrollView.contentOffset.x == 0){
        _driveLevelView.hidden = YES;
        _seg_dayOrWeek.hidden = NO;
        [btn_Statistical setTitleColor:BTNTITLEREADCOLOR forState:UIControlStateNormal];
        [btn_driveLevel setTitleColor:BTNTITLEWHTIECOLOR forState:UIControlStateNormal];

    
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
