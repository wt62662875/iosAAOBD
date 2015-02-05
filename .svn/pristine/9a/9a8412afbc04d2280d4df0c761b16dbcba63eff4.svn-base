//
//  ASIClientPub.h
//  AAOBD
//
//  Created by oi on 28/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "ASIClient.h"

@interface ASIClientPub : ASIClient
//内网
#define SeviceURL @"http://192.168.1.76:7776/OBD"
//外网
//#define SeviceURL @"115.29.227.57:7776 192.168.1.76:7776/OBD"

#define UserName    [[NSUserDefaults standardUserDefaults]objectForKey:@"PhoneNomber"]
#define CarId       [[NSUserDefaults standardUserDefaults]objectForKey:@"CarId"]
#define isLogin     UserName != nil ? YES:NO

//提示语
#define isNotLogin  @"没有登录"


//登陆Block
typedef void (^IsLoginNotInBlock)(BOOL progress);


//========================================================================
/*!
 @brief 故障信息
 */
#define Gethitch    @"/API/Mobile/OBD.ashx?method=gethitch&LoginName&HitchCode&Brand"

/*!
 @brief 驾驶等级
 */
#define Drivelevel  @"/API/Mobile/OBD.ashx?method=drivelevel&CarID&LoginName"
/*!
 @brief 添加导航记录
 */
#define Addnavigation  @"/API/Mobile/OBD.ashx?method=addnavigation&LoginName&ID&Carid&Pointsx&Pointsy&Address&Endtime&Startadd &Endadd&Starttime&Distance=12"
/*!
  @brief 获取导航记录
 */
#define Getnavlist  @"/API/Mobile/OBD.ashx?method=getnavlist&LoginName=15523&CarID =10"

/*!
 获取导航记录
 2015-01-23 09:00:00
 */
#define Updatetrip @"/API/Mobile/OBD.ashx?method=updatetrip&TripID&Maxspeed &Singledrive&Driveminutes&Hokof&Totalfuel&EndT ime&Endplace&LoginName"
/*!
 @brief 行为统计
 */
#define Behaviorstatistical @"/API/Mobile/OBD.ashx?method=behavi orstatistical&CarID&BeginD ate=&EndDate&LoginName"

//========================================================================


/*!
 @brief 获取故障信息
 @param  param 参数
 @param completeBlock 成功
 @param failed 失败
 */
+(void)getTroubleWithParam:(NSDictionary *)param completed:(KKCompletedBlock )completeBlock failed:(KKFailedBlock )failed andIsLogin:(IsLoginNotInBlock)islogBlock;

/*!
 @brief 驾驶等级
 @param completeBlock 成功
 @param failed 失败
 */
+(void)getDrivelevelWithcompleted:(KKCompletedBlock )completeBlock failed:(KKFailedBlock )failed andIsLogin:(IsLoginNotInBlock)islogBlock;
/*!
 @brief 添加导航记录
 @param  param 参数
 @param completeBlock 成功
 @param failed 失败
 */
+(void)addNaviRecordWithParam:(NSDictionary *)param completed:(KKCompletedBlock )completeBlock failed:(KKFailedBlock)failed andIsLogin:(IsLoginNotInBlock)islogBlock;
/*!
 @brief 获取导航记录
 @param  param 参数
 @param completeBlock 成功
 @param failed 失败
 */
+(void)getNAviListWithParam:(NSDictionary *)param completed:(KKCompletedBlock)completeBlock failed:(KKFailedBlock)failed andIsLogin:(IsLoginNotInBlock)islogBlock;
/*!
 @brief 更新行程
 @param  param 参数
 @param completeBlock 成功
 @param failed 失败
 */
+(void)UpdatetripWithParam:(NSDictionary *)param completed:(KKCompletedBlock)completeBlock failed:(KKFailedBlock)failed andIsLogin:(IsLoginNotInBlock)islogBlock;
/*!
 @brief 行为统计
 @param  param 参数
 @param completeBlock 成功
 @param failed 失败
 */
+(void)getBehaviorstatisticalWithParam:(NSDictionary *)param completed:(KKCompletedBlock)completeBlock failed:(KKFailedBlock)failed andIsLogin:(IsLoginNotInBlock)islogBlock;
@end
