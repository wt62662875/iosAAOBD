//
//  CarMessageTableViewCell.m
//  AAOBD
//
//  Created by wt on 15/1/26.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "CarMessageTableViewCell.h"
#import "public.h"

@implementation CarMessageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 50, SCREENWIDTH, 0.5)];
        view.backgroundColor = RGBCOLORA(135, 135, 135, 0.5);
        [self.contentView addSubview:view];
        
        _lab = [[UILabel alloc]initWithFrame:CGRectMake(30, 10, 100, 30)];
        _lab.textColor = RGBCOLORA(135, 135, 135, 1);
        _lab.font = [UIFont boldSystemFontOfSize:14];
        [self.contentView addSubview:_lab];
        
        _lab2 = [[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-130, 10, 100, 30)];
        _lab2.textColor = RGBCOLORA(135, 135, 135, 0.5);
        _lab2.font = [UIFont boldSystemFontOfSize:14];
        _lab2.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_lab2];
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
