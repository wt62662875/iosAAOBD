//
//  SelectCarSeriesTableViewCell.m
//  AAOBD
//
//  Created by wt on 15/1/22.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "SelectCarSeriesTableViewCell.h"
#import "public.h"

@implementation SelectCarSeriesTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _lab = [[UILabel alloc]initWithFrame:CGRectMake(40, 20, 200, 30)];
        _lab.textColor = RGBCOLORA(135, 135, 135, 1);
        _lab.font = [UIFont boldSystemFontOfSize:17];
        [self.contentView addSubview:_lab];
        
//        _lab2 = [[UILabel alloc]initWithFrame:CGRectMake(60, 30, 200, 30)];
//        _lab2.textColor = RGBCOLORA(135, 135, 135, 0.5);
//        _lab2.font = [UIFont boldSystemFontOfSize:14];
//        [self.contentView addSubview:_lab2];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
