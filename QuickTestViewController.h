//
//  QuickTestViewController.h
//  AAOBD
//
//  Created by oi on 30/12/14.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol QuickTestViewControllerDelegate <NSObject>

-(void)sendGrade:(NSString *)Grade;

@end

@interface QuickTestViewController : UIViewController

@property(nonatomic,retain)id<QuickTestViewControllerDelegate> delegate;

@end
