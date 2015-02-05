//
//  AllAlertView.h
//  AAOBD
//
//  Created by wt on 15/2/4.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AllViewdelegate <NSObject>
-(void)AllAlertSend:(NSMutableArray *)array;

@end
@interface AllAlertView : UIView
@property(nonatomic,assign)id<AllViewdelegate>delegate;

@end
