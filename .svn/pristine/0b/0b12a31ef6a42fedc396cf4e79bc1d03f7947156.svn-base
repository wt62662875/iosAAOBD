//
//  ASIClient.h
//  ASIHTTPRequestDemo
//
//  Created by somilk on 14-1-10.
//  Copyright (c) 2014年 somilk All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

/**
 *  Debug_LOG信息控制；
 *
 *  IS_ENABLE_DEBUG_LOG 设置为 1 ，打印请求log基本信息；
 *  IS_ENABLE_DEBUG_LOG 设置为 0 ，不打印请求log基本信息；
 */
#define IS_ENABLE_DEBUG_LOG 1

#if IS_ENABLE_DEBUG_LOG
#define kDEBUG_LOG() NSLog(@"line:(%d),%s",__LINE__,__FUNCTION__)
#define kNSLog(...)  NSLog(__VA_ARGS__)
#else
#define kDEBUG_LOG()
#define kNSLog(...)
#endif

extern NSString *const kAPI_BASE_URL;

/**
 *  ASICLient 请求回调的块声明；
 *
 *  基本的请求完成，失败，上传及下载进度 Block回调；
 */
typedef void (^KKCompletedBlock)(id JSON,NSString *stringData);
typedef void (^KKFailedBlock)(NSError *error);
typedef void (^KKProgressBlock)(float progress);


@interface ASIClient : NSObject

//请求客户端
+ (instancetype)client;

/**
 *  一般的get请求，无参数；
 *
 *  @param path          接口路径，不能为空；
 *  @param completeBlock 请求完成块，返回 id JSON, NSString *stringData;
 *  @param failed        请求失败块，返回 NSError *error;
 *
 *  @return 返回ASIHTTPRequest的指针，可用于 NSOperationQueue操作；
 */
+ (ASIHTTPRequest *)GET_Path:(NSString *)path completed:(KKCompletedBlock )completeBlock failed:(KKFailedBlock )failed;
+ (ASIHTTPRequest *)GET_Path:(NSString *)path TYPE:(NSString*)type completed:(KKCompletedBlock )completeBlock failed:(KKFailedBlock )failed;

/**
 *  一般的GET请求，有参数；
 *
 *  @param path          接口路径，不能为空；
 *  @param paramsDic     请求的参数的字典，参数可为nil, 例如：NSDictionary *params = @{@"key":@"value"}
 *  @param completeBlock 请求完成块，返回 id JSON, NSString *stringData;
 *  @param failed        请求失败块，返回 NSError *error;
 *
 *  @return 返回ASIHTTPRequest的指针，可用于 NSOperationQueue操作
 */
+ (ASIHTTPRequest *)GET_Path:(NSString *)path params:(NSDictionary *)paramsDic completed:(KKCompletedBlock )completeBlock failed:(KKFailedBlock )failed;

+ (ASIHTTPRequest *)POST_Path:(NSString *)path TYPE:(NSString*)type params:(NSDictionary *)paramsDic completed:(KKCompletedBlock )completeBlock failed:(KKFailedBlock )failed;
/**
 *  一般的POST请求，有参数；
 *
 *  @param path          接口路径，不能为空；
 *  @param paramsDic     请求的参数的字典，参数可为nil, 例如：NSDictionary *params = @{@"key":@"value"}
 *  @param completeBlock 请求完成块，返回 id JSON, NSString *stringData;
 *  @param failed        请求失败块，返回 NSError *error;
 *
 *  @return 返回ASIHTTPRequest的指针，可用于 NSOperationQueue操作
 */
+ (ASIHTTPRequest *)POST_Path:(NSString *)path params:(NSDictionary *)paramsDic completed:(KKCompletedBlock )completeBlock failed:(KKFailedBlock )failed;

/**
 *  一般GET请求下载文件；
 *
 *  @param path           接口路径，不能为空；
 *  @param destination    下载文件保存的路径，不能为空；
 *  @param name           下载文件保存的名字，不能为空；
 *  @param progressBlock  下载文件的Progress块，返回 float progress,在此跟踪下载进度；
 *  @param completeBlock  请求完成块，无返回值；
 *  @param failed         请求失败块，返回 NSError *error;
 *
 *  @return 返回ASIHTTPRequest的指针，可用于 NSOperationQueue操作
 */
+ (ASIHTTPRequest *)DownFile_Path:(NSString *)path writeTo:(NSString *)destination fileName:(NSString *)name setProgress:(KKProgressBlock)progressBlock completed:(ASIBasicBlock)completedBlock failed:(KKFailedBlock )failed;


/**
 *  一般的POST上传文件；
 *
 *  @param path           上传接口路径，不能为空；
 *  @param filePath       要上传的文件路径，不能为空;
 *  @param fileKey        上传文件对应服务器接收的key，不能为空;
 *  @param params         请求的参数的字典，参数可为nil, 例如：NSDictionary *params = @{@"key":@"value"}
 *  @param progressBlock  上传文件的Progress块，返回 float progress,在此跟踪下载进度；
 *  @param completeBlock  请求完成块，返回 id JSON, NSString *stringData;
 *  @param failed         请求失败块，返回 NSError *error;
 *
 *  @return 返回ASIHTTPRequest的指针，可用于 NSOperationQueue操作
 */
+ (ASIHTTPRequest *)UploadFile_Path:(NSString *)path file:(NSString *)filePath forKey:(NSString *)fileKey params:(NSDictionary *)params SetProgress:(KKProgressBlock )progressBlock completed:(KKCompletedBlock )completedBlock failed:(KKFailedBlock )failed;


/**
 *  一般的POST数据Data上传；
 *
 *  @param path           上传接口路径，不能为空；
 *  @param fData          要上传的文件Data，不能为空;
 *  @param dataKey        上传的Data对应服务器接收的key，不能为空;
 *  @param params         请求的参数的字典，参数可为nil, 例如：NSDictionary *params = @{@"key":@"value"}
 *  @param progressBlock  上传文件的Progress块，返回 float progress,在此跟踪下载进度；
 *  @param completeBlock  请求完成块，返回 id JSON, NSString *stringData;
 *  @param failed         请求失败块，返回 NSError *error;
 *
 *  @return 返回ASIHTTPRequest的指针，可用于 NSOperationQueue操作
 */
+ (ASIHTTPRequest *)UploadData_Path:(NSString *)path fileData:(NSData *)fData forKey:(NSString *)dataKey params:(NSDictionary *)params SetProgress:(KKProgressBlock )progressBlock completed:(KKCompletedBlock )completedBlock failed:(KKFailedBlock )failed;


/**
 *  文件下载，支持断点续传功能；
 *
 *  @param path            接口路径，不能为空；
 *  @param destinationPath 下载文件要保存的路径，不能为空；
 *  @param tempPath        临时文件保存的路径，不能为空；
 *  @param name            下载保存的文件名，不能为空；
 *  @param progressBlock   下载文件的Progress块，返回 float progress,在此跟踪下载进度；
 *  @param completedBlock  下载完成回调块，无回返值；
 *  @param failed          下载失败回调块，返回 NSError *error;
 *
 *  @return 返回ASIHTTPRequest的指针，可用于 NSOperationQueue操作
 */
+ (ASIHTTPRequest *)ResumeDown_Path:(NSString *)path writeTo:(NSString *)destinationPath tempPath:(NSString *)tempPath fileName:(NSString *)name setProgress:(KKProgressBlock )progressBlock completed:(ASIBasicBlock )completedBlock failed:(KKFailedBlock )failed;








/*
 几个测试接口
 1: 豆瓣电影 top250  /v2/movie/top250  参数：start,count  都是int 类型；  返回 json
 2：豆瓣电影 北美票房榜 /v2/movie/us_box  无参数；    返回 json 
 3: 电影搜索 /v2/movie/search?q=张艺谋 GET /v2/movie/search?tag=喜剧   参数：q 关键词  tag 类型，start,count   返回json
 
 
 */

/*
 安装：配置
 1：所需frame.work;
 CFNetwork, SystemConfiguration, MobileCoreServices, CoreGraphics and libz.dylib  libxml2.dylib
 3: 删除 Tests文件夹里面的测试
 2: ASI Tests 需要 https://github.com/gh-unit/gh-unit/tree/master 然后导入 ：GHUnitIOS.framework
 3:bulid setting  Header search path 添加 /usr/include/libxml2
 4：在 test/ASIDataCompareTest.m中有个 NStask错误，删除文件即可；
 5: 如果使用 Test文件加里面的东西，使用 GHUnitIOS.framework http://stackoverflow.com/questions/13925437/ghunitios-ghunit-h-file-not-found-in-xcode
 
 官方文档：http://allseeing-i.com/ASIHTTPRequest/How-to-use
 
 */

@end
