//
//  HIsTableViewCell.h
//  AAOBD
//
//  Created by oi on 21/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HIsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lab_text;
@property (weak, nonatomic) IBOutlet UILabel *sub_lab;
@property (weak, nonatomic) IBOutlet UIImageView *img_end;
@property (weak, nonatomic) IBOutlet UILabel *lab_end;
@property (weak, nonatomic) IBOutlet UILabel *sub_end;

@end
