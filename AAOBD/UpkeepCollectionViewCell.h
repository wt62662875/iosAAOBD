//
//  UpkeepCollectionViewCell.h
//  AAOBD
//
//  Created by oi on 22/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol UpKeepCollecttionCellDelegate <NSObject>

-(void)onclickWithEXimg:(UIButton *)sender;

@end
@interface UpkeepCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *lab_text;
@property (weak, nonatomic) IBOutlet UIButton *Btn_check;
@property(assign,nonatomic)BOOL isSelect;
@property(assign,nonatomic)id<UpKeepCollecttionCellDelegate>delegate;

@end

