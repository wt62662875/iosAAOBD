//
//  SelectCarSeriesViewController.h
//  AAOBD
//
//  Created by wt on 15/1/22.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "public.h"
#import "SelectCarSeriesTableViewCell.h"

@interface SelectCarSeriesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) NSString *BrandStr;

@end
