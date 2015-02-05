//
//  ASIClientPub.m
//  AAOBD
//
//  Created by oi on 28/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "ASIClientPub.h"
#import "SVProgressHUD.h"
#import "ASIClient.h"
@implementation ASIClientPub
+(void)getTroubleWithParam:(NSDictionary *)param completed:(KKCompletedBlock)completeBlock failed:(KKFailedBlock)failed andIsLogin:(IsLoginNotInBlock)islogBlock{
   if (isLogin) {
       [self POST_Path:Gethitch params:param completed:completeBlock failed:failed];
    }else{
        [SVProgressHUD showErrorWithStatus:isNotLogin];
        islogBlock(isLogin);
    }
}
+(void)getDrivelevelWithcompleted:(KKCompletedBlock)completeBlock failed:(KKFailedBlock)failed andIsLogin:(IsLoginNotInBlock)islogBlock{
    if (isLogin) {
        
        NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:UserName,@"Loginname",CarId,@"Carid",nil];
        [self POST_Path:Drivelevel params:param completed:completeBlock failed:failed];
    }else{
        [SVProgressHUD showErrorWithStatus:isNotLogin];
        islogBlock(isLogin);
    }
    
}

+(void)addNaviRecordWithParam:(NSDictionary *)param completed:(KKCompletedBlock)completeBlock failed:(KKFailedBlock)failed andIsLogin:(IsLoginNotInBlock)islogBlock{

    if (isLogin) {
        [self POST_Path:Addnavigation params:param completed:completeBlock failed:failed];
    }else{
        [SVProgressHUD showErrorWithStatus:isNotLogin];
        islogBlock(isLogin);
    }
}

+(void)getNAviListWithParam:(NSDictionary *)param completed:(KKCompletedBlock)completeBlock failed:(KKFailedBlock)failed andIsLogin:(IsLoginNotInBlock)islogBlock{
   
    if (isLogin) {
        [self POST_Path:Getnavlist params:param completed:completeBlock failed:failed];
    }else{
        [SVProgressHUD showErrorWithStatus:isNotLogin];
        islogBlock(isLogin);
    }

}

+(void)UpdatetripWithParam:(NSDictionary *)param completed:(KKCompletedBlock)completeBlock failed:(KKFailedBlock)failed andIsLogin:(IsLoginNotInBlock)islogBlock{
    if (isLogin) {
        [self POST_Path:Updatetrip params:param completed:completeBlock failed:failed];
    }else{
        [SVProgressHUD showErrorWithStatus:isNotLogin];
        islogBlock(isLogin);
    }

}

+(void)getBehaviorstatisticalWithParam:(NSDictionary *)param completed:(KKCompletedBlock)completeBlock failed:(KKFailedBlock)failed andIsLogin:(IsLoginNotInBlock)islogBlock;{
    if (isLogin) {
        [self POST_Path:Behaviorstatistical params:param completed:completeBlock failed:failed];
    }else{
        [SVProgressHUD showErrorWithStatus:isNotLogin];
        islogBlock(isLogin);
    }


}
@end
