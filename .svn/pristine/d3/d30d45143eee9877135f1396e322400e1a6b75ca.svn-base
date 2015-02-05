//
//  AppUtils
//
//
//  Created by somilk
//  Copyright (c) 2012年 somilk. All rights reserved.
//


#import "AppUtils.h"
#import "AppDelegate.h"
#import "Reachability.h"

#define SeviceURL @"http://192.168.1.76:7776/OBD"//115.29.227.57:7776 192.168.1.76:7776/OBD
//http://192.168.0.76:7776/OBD/API/Mobile/OBD.ashx?method=sendcode&LoginName
//http://115.29.227.57:7776/API/Mobile/OBD.ashx?
@implementation AppUtils


#pragma mark 得到服务器端地址[1]
+ (NSString *)callSevice
{
    return SeviceURL;
}
#pragma mark 调用电话phone[3]
+ (void) callPhone:(NSString *)number
{
    NSString * temp = [@"telprompt://" stringByAppendingString:number];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:temp]];
    static dispatch_once_t onceToken;
   
}
#pragma mark 连接成功与否
+ (BOOL)nowstate
{
    BOOL isExistenceNetwork = YES;
    Reachability *r = [Reachability reachabilityWithHostName:@"www.baidu.com"];//[NSString stringWithFormat:@"%@%@",[AppUtils callSevice],@"yqs/muser/login.do"]];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork=NO;
            break;
        case ReachableViaWWAN:
            isExistenceNetwork=YES;
            break;
        case ReachableViaWiFi:
            isExistenceNetwork=YES;
            break;
    }
    return isExistenceNetwork;
    //    return YES;
}
#pragma mark 手机号验证[8]
+ (BOOL) isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((14[5,7])|(13[0-9])|(15[0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}
#pragma mark 提示框[9]
+ (void) showAlertView:(NSString *)Titile STR:(NSString*)str BtnTxt:(NSString *)btntxt{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:Titile
                                                    message:str
                                                   delegate:nil
                                          cancelButtonTitle:btntxt
                                          otherButtonTitles:nil];
    [alert show];
}
@end

