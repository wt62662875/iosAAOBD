//
//  CarInformationTableViewCell.m
//  AAOBD
//
//  Created by wt on 15/1/21.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "CarInformationTableViewCell.h"
#import "public.h"
@implementation CarInformationTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _isBool = YES;
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 80)];
        view.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:view];
        
        self.backgroundColor = RGBCOLORA(29, 30, 34, 1);
        
        _lab1 = [[UILabel alloc]initWithFrame:CGRectMake(60, 10, 80, 30)];
        _lab1.textColor = RGBCOLORA(135, 135, 135, 1);
        _lab1.font = [UIFont boldSystemFontOfSize:12];
        [view addSubview:_lab1];
        
        _lab2 = [[UILabel alloc]initWithFrame:CGRectMake(60, 45, 200, 30)];
        _lab2.textColor = RGBCOLORA(135, 135, 135, 1);
        _lab2.font = [UIFont boldSystemFontOfSize:10];
        [view addSubview:_lab2];
        
        _carSeriesLab = [[UILabel alloc]initWithFrame:CGRectMake(130, 10, 200, 30)];
        _carSeriesLab.textColor = RGBCOLORA(135, 135, 135, 0.5);
        _carSeriesLab.font = [UIFont boldSystemFontOfSize:10];
        [view addSubview:_carSeriesLab];
        
        _qiehuan = [[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH-50, 20, 20, 20)];
        [_qiehuan setBackgroundImage:[UIImage imageNamed:@"exchange"] forState:UIControlStateNormal];
        [_qiehuan addTarget:self action:@selector(qiehuanClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:_qiehuan];
        
        _lab3 = [[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-50, 40, 30, 30)];
        _lab3.textColor = RGBCOLORA(16, 131, 255, 1);
        _lab3.font = [UIFont boldSystemFontOfSize:14];
        _lab3.text = @"切换";
        [view addSubview:_lab3];
        
        _jiantou = [[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH-90, 30, 22, 12)];
        [_jiantou setBackgroundImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
        [view addSubview:_jiantou];
        [_jiantou addTarget:self action:@selector(dianji:) forControlEvents:UIControlEventTouchUpInside];
        
        _cheneibao = [[UIButton alloc]initWithFrame:CGRectMake(30, 100, 22, 15)];
        [_cheneibao setBackgroundImage:[UIImage imageNamed:@"cheneibao"] forState:UIControlStateNormal];
        _cheneibao.hidden = YES;
        [self.contentView  addSubview:_cheneibao];
        
        _xiangqing = [[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH/2-11, 100, 22, 15)];
        [_xiangqing setBackgroundImage:[UIImage imageNamed:@"详情"] forState:UIControlStateNormal];
        _xiangqing.hidden = YES;
        [_xiangqing addTarget:self action:@selector(xiangqingClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView  addSubview:_xiangqing];
        
        _dele = [[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH-52, 95, 22, 22)];
        [_dele setBackgroundImage:[UIImage imageNamed:@"del"] forState:UIControlStateNormal];
        _dele.hidden = YES;
        [_dele addTarget:self action:@selector(dele:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView  addSubview:_dele];
        
        _cheneibaoLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 120, 50, 30)];
        _cheneibaoLab.textColor = RGBCOLORA(135, 135, 135, 1);
        _cheneibaoLab.font = [UIFont boldSystemFontOfSize:14];
        _cheneibaoLab.text = @"车内宝";
        _cheneibaoLab.hidden = YES;
        [self.contentView  addSubview:_cheneibaoLab];
        
        _xiangqingLab = [[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH/2-15, 120, 30, 30)];
        _xiangqingLab.textColor = RGBCOLORA(135, 135, 135, 1);
        _xiangqingLab.font = [UIFont boldSystemFontOfSize:14];
        _xiangqingLab.text = @"详情";
        _xiangqingLab.hidden = YES;
        [self.contentView  addSubview:_xiangqingLab];
        
        _deleLab = [[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-52, 120, 30, 30)];
        _deleLab.textColor = RGBCOLORA(135, 135, 135, 1);
        _deleLab.font = [UIFont boldSystemFontOfSize:14];
        _deleLab.text = @"删除";
        _deleLab.hidden = YES;
        [self.contentView  addSubview:_deleLab];
    }
    return self;
}
-(void)dianji:(UIButton *)sender{
   
    [_delegate oncickBtnAndSendCell:self];
}
-(void)qiehuanClick:(UIButton *)sender{
    [_delegate qiehuanBtnAndSendCell:self];
}
-(void)dele:(UIButton *)sender{
    [_delegate deleBtnAndSendCell:self];
}
-(void)xiangqingClick:(UIButton*)sender{
    [_delegate xiangqingBtnAndSendCell:self];

}
- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
