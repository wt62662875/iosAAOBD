//
//  HotComboAlertView.h
//  AAOBD
//
//  Created by wt on 15/2/4.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HotComboViewdelegate <NSObject>
-(void)HotComboAlertSend:(NSMutableArray *)array;

@end

@interface HotComboAlertView : UIView

@property(nonatomic,assign)id<HotComboViewdelegate>delegate;

@end
