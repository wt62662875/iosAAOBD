//
//  CustomHisCollectionViewCell.m
//  AAOBD
//
//  Created by oi on 26/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "CustomHisCollectionViewCell.h"

@implementation CustomHisCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    _btn_his.layer.masksToBounds = YES;
    _btn_his.layer.cornerRadius = 20;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CustomHisCollectionViewCell" owner:self options: nil];
        if(arrayOfViews.count < 1){
            return nil;
        }
        if(![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]){
            return nil;
        }
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}

- (IBAction)onclickBtn_his:(UIButton *)sender {
    [_delegate onclickBtn_hisOnDelegate];
}
@end
