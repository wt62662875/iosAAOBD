//
//  AbnormalViewController.h
//  AAOBD
//
//  Created by oi on 2/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VCtype) {
    Engine,//发动机故障
    Discharge,//排放系统
    Airinflow,//进气系统
    Thefault//故障系统
    
};
@interface AbnormalViewController : UIViewController
@property(nonatomic,retain)NSString *titleStr;
@property(nonatomic,assign)VCtype  VCtype;
@end
