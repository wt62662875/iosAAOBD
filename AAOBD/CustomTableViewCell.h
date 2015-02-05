//
//  CustomTableViewCell.h
//  AAOBD
//
//  Created by oi on 31/12/14.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView_Name;
@property (weak, nonatomic) IBOutlet UILabel *lab_name;
@property (weak, nonatomic) IBOutlet UIImageView *imageView_state;

@end
