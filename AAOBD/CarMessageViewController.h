//
//  CarMessageViewController.h
//  AAOBD
//
//  Created by wt on 15/1/23.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarMessageTableViewCell.h"

@interface CarMessageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) NSString * Brand;
@property (nonatomic,retain) NSString * Model;
@end
