//
//  PromptTableViewCell.h
//  AAOBD
//
//  Created by oi on 21/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PromptTableViewCellDelegate <NSObject>

-(void)didOnclickSwich:(UITableViewCell *)cell;

@end

@interface PromptTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgview;
@property (weak, nonatomic) IBOutlet UILabel *lab_text;
@property (weak, nonatomic) IBOutlet UILabel *lab_sub;
@property (weak, nonatomic) IBOutlet UISwitch *swich_status;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property(assign,nonatomic)id<PromptTableViewCellDelegate>delegate;
@end
