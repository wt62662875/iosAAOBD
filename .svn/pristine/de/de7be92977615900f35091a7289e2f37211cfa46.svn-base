//
//  CustomHisCollectionViewCell.h
//  AAOBD
//
//  Created by oi on 26/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomHisCollectionViewCellDelegate <NSObject>

-(void)onclickBtn_hisOnDelegate;

@end
@interface CustomHisCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *btn_his;
- (IBAction)onclickBtn_his:(UIButton *)sender;
@property(strong,nonatomic)id<CustomHisCollectionViewCellDelegate>delegate;
@end
