//
//  SelectDateView.h
//  AAOBD
//
//  Created by oi on 23/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SelectDateViewDelegate <NSObject>

-(void)selectTime:(NSString *)time;

@end
@interface SelectDateView : UIView
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property(assign,nonatomic)id<SelectDateViewDelegate>delegate;
@end
