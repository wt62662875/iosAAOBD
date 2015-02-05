//
//  AlertView.h
//  AAOBD
//
//  Created by wt on 15/1/8.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AlertViewdelegate <NSObject>

-(void)AlertViewSend:(NSMutableArray *)array;
@end
@interface AlertView : UIView

@property(nonatomic,assign)id<AlertViewdelegate>delegate;

@end
