//
//  BluetoothSingleton.m
//  AAOBD
//
//  Created by oi on 30/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "BluetoothSingleton.h"
static BluetoothSingleton *sharedCLDelegate = nil;
@implementation BluetoothSingleton

+(BluetoothSingleton *)sharedInstance{
    @synchronized(self) {
        if(sharedCLDelegate == nil) {
          sharedCLDelegate =  [[[BluetoothSingleton class] alloc] init]; //   assignment   not   done   here
        }
    }
    return sharedCLDelegate;
}

- (id)init
{
    self=[super init];
    if (self) {
        
        
        self.carInfo =[[carInfo alloc]init];
        _Cmd1 = [[NSArray alloc]init];
        _Cmd2 = [[NSArray alloc]init];
        _Cmd3 = [[NSArray alloc]init];
        _Cmd4 = [[NSArray alloc]init];
        
    }
    return self;
}
@end
