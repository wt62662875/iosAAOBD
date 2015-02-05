//
//  UpkeepCollectionViewCell.m
//  AAOBD
//
//  Created by oi on 22/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "UpkeepCollectionViewCell.h"

@implementation UpkeepCollectionViewCell
- (void)awakeFromNib {
    // Initialization code
    _Btn_check.enabled = NO;
    _isSelect = NO;

   
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"UpkeepCollectionViewCell" owner:self options: nil];
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

@end
