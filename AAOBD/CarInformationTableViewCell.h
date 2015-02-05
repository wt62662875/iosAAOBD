//
//  CarInformationTableViewCell.h
//  AAOBD
//
//  Created by wt on 15/1/21.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInformationViewController.h"

@protocol carInfomationTableCellDelegate <NSObject>

-(void)oncickBtnAndSendCell:(UITableViewCell *)cell;
-(void)qiehuanBtnAndSendCell:(UITableViewCell *)cell;
-(void)deleBtnAndSendCell:(UITableViewCell *)cell;
-(void)xiangqingBtnAndSendCell:(UITableViewCell *)cell;

@end
@interface CarInformationTableViewCell : UITableViewCell

@property (nonatomic,retain) UILabel *lab1;
@property (nonatomic,retain) UILabel *lab2;
@property (nonatomic,retain) UILabel *lab3;
@property (nonatomic,retain) UILabel *carSeriesLab;
@property (nonatomic,retain) UIButton *qiehuan;
@property (nonatomic,retain) UIButton *jiantou;

@property (nonatomic,retain) UIButton *cheneibao;
@property (nonatomic,retain) UIButton *xiangqing;
@property (nonatomic,retain) UIButton *dele;

@property (nonatomic,retain) UILabel *cheneibaoLab;
@property (nonatomic,retain) UILabel *xiangqingLab;
@property (nonatomic,retain) UILabel *deleLab;

@property(nonatomic,assign)BOOL isBool;

@property(nonatomic,assign)id<carInfomationTableCellDelegate>delegate;
@end
