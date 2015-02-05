//
//  CustomCellCollectionViewCell.m
//  AAOBD
//
//  Created by oi on 23/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "CustomCellCollectionViewCell.h"

@implementation CustomCellCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CustomCellCollectionViewCell" owner:self options: nil];
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
