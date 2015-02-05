//
//  NaviAndHisView.h
//  AAOBD
//
//  Created by oi on 20/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NaviAndHisViewDelegate <NSObject>

-(void)onclickHisBtn:(NSArray *)hisArr AndNavi:(NSArray *)naviArr;
-(void)onclickNaviBtn:(NSArray *)hisBtn AndNavi:(NSArray *)naviArr;

@end

@interface NaviAndHisView : UIView
- (IBAction)onclockHisBtn:(UIButton *)sender;
- (IBAction)onclickNaviBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *lab_Navi;
@property (weak, nonatomic) IBOutlet UILabel *lab_His;

@property (weak, nonatomic) IBOutlet UIImageView *img_Navi;
@property (weak, nonatomic) IBOutlet UIImageView *img_His;

@property (weak, nonatomic) IBOutlet UIView *view_His;
@property (weak, nonatomic) IBOutlet UIView *view_Navi;


@property(assign,nonatomic)id<NaviAndHisViewDelegate> delegate;
@end
