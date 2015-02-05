//
//  CustomCollectionViewCell.m
//  AAOBD
//
//  Created by oi on 30/12/14.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "CustomCollectionViewCell.h"
#import "Animation.h"
@implementation CustomCollectionViewCell

- (void)awakeFromNib {
    [_Btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}
-(void)click{
        [Animation btnclick:_Btn rippleX:15 rippleY:15 ];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CustomCollectionViewCell" owner:self options: nil];
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
