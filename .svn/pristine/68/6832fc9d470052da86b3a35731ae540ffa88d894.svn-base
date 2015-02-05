//
//  PickerDateView.h
//  AAOBD
//
//  Created by wt on 15/1/2.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PickDateViewDelegate <NSObject>

-(void)sendtime:(NSString *)time;

@end

@interface PickerDateView : UIView
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property(nonatomic,retain)id<PickDateViewDelegate> delegate;

@end
