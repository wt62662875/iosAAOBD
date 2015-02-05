//
//  ASIClient.m
//  ASIHTTPRequestDemo
//
//  Created by somilk on 14-1-10.
//  Copyright (c) 2014年 somilk All rights reserved.
//

#import "ASIClient.h"
#import "AppUtils.h"
#import "ASIClientPub.h"

#define kAPI_BASE_URL [AppUtils callSevice]
#define kAPI_TYPE_URL [AppUtils callDCSevice]


@implementation ASIClient

+ (instancetype)client
{
 
    static ASIClient *client = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [[ASIClient alloc]init];
    });
    return client;
}


+ (ASIHTTPRequest *)GET_Path:(NSString *)path completed:(KKCompletedBlock )completeBlock failed:(KKFailedBlock )failed
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kAPI_BASE_URL,path];
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    request.requestMethod = @"GET";
    
    [request setCompletionBlock:^{
        NSError *errorForJSON = [NSError errorWithDomain:@"请求数据解析为json格式，发出错误" code:2014 userInfo:@{@"请求数据json解析错误": @"中文",@"serial the data to json error":@"English"}];
        id jsonData = [NSJSONSerialization JSONObjectWithData:[request responseData] options:0 error:&errorForJSON];
        completeBlock(jsonData,request.responseString);
    }];
    
    [request setFailedBlock:^{
        failed([request error]);
    }];
    
    [request startAsynchronous];
    
//    kNSLog(@"ASIClient GET: %@",[request url]);
    
    return request;
}


+ (ASIHTTPRequest *)GET_Path:(NSString *)path params:(NSDictionary *)paramsDic completed:(KKCompletedBlock )completeBlock failed:(KKFailedBlock )failed
{
    NSMutableString *paramsString = [NSMutableString stringWithCapacity:1];
    [paramsDic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [paramsString appendFormat:@"%@=%@",key,obj];
        [paramsString appendString:@"&"];
    }];
    NSString *urlStr = [NSString stringWithFormat:@"%@%@?%@",kAPI_BASE_URL,path,paramsString];
    urlStr = [urlStr substringToIndex:urlStr.length-1];
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:Gethitch];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    request.requestMethod = @"GET";
    
    [request setCompletionBlock:^{
        NSError *errorForJSON = [NSError errorWithDomain:@"请求数据解析为json格式，发出错误" code:2014 userInfo:@{@"请求数据json解析错误": @"中文",@"serial the data to json error":@"English"}];
        id jsonData = [NSJSONSerialization JSONObjectWithData:[request responseData] options:0 error:&errorForJSON];
        completeBlock(jsonData,request.responseString);
    }];
    
    [request setFailedBlock:^{
        failed([request error]);
    }];
    
    [request startAsynchronous];
    
//    kNSLog(@"ASIClient GET: %@",[request url]);
    
    
    
    return request;
}


+ (ASIHTTPRequest *)POST_Path:(NSString *)path params:(NSDictionary *)paramsDic completed:(KKCompletedBlock )completeBlock failed:(KKFailedBlock )failed
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kAPI_BASE_URL,path];
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.requestMethod = @"POST";
    
    [paramsDic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [request setPostValue:obj forKey:key];
    }];
    
    [request setCompletionBlock:^{
        NSError *errorForJSON = [NSError errorWithDomain:@"请求数据解析为json格式，发出错误" code:2014 userInfo:@{@"请求数据json解析错误": @"中文",@"serial the data to json error":@"English"}];
        id jsonData = [NSJSONSerialization JSONObjectWithData:[request responseData] options:0 error:&errorForJSON];
        completeBlock(jsonData,request.responseString);
    }];
    
    [request setFailedBlock:^{
        failed([request error]);
    }];
    
    [request startAsynchronous];
    
    kNSLog(@"ASIClient POST: %@ %@",[request url],paramsDic);
    
    
    
    return request;

}

+ (ASIHTTPRequest *)GET_Path:(NSString *)path TYPE:(NSString*)type completed:(KKCompletedBlock )completeBlock failed:(KKFailedBlock )failed
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kAPI_TYPE_URL,path];
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    request.requestMethod = @"GET";
    
    NSLog(@"%@",urlStr);
    
    [request setCompletionBlock:^{
        NSError *errorForJSON = [NSError errorWithDomain:@"请求数据解析为json格式，发出错误" code:2014 userInfo:@{@"请求数据json解析错误": @"中文",@"serial the data to json error":@"English"}];
        id jsonData = [NSJSONSerialization JSONObjectWithData:[request responseData] options:0 error:&errorForJSON];
        completeBlock(jsonData,request.responseString);
    }];
    
    [request setFailedBlock:^{
        failed([request error]);
    }];
    
    [request startAsynchronous];
    
    //    kNSLog(@"ASIClient GET: %@",[request url]);
    
    return request;
}

+ (ASIHTTPRequest *)POST_Path:(NSString *)path TYPE:(NSString*)type params:(NSDictionary *)paramsDic completed:(KKCompletedBlock )completeBlock failed:(KKFailedBlock )failed
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kAPI_TYPE_URL,path];
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
     [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    request.requestMethod = @"POST";
    
    [paramsDic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [request setPostValue:obj forKey:key];
    }];
    
    [request setCompletionBlock:^{
        NSError *errorForJSON = [NSError errorWithDomain:@"请求数据解析为json格式，发出错误" code:2014 userInfo:@{@"请求数据json解析错误": @"中文",@"serial the data to json error":@"English"}];
        id jsonData = [NSJSONSerialization JSONObjectWithData:[request responseData] options:0 error:&errorForJSON];
        completeBlock(jsonData,request.responseString);
    }];
    
    [request setFailedBlock:^{
        failed([request error]);
    }];
    
    [request startAsynchronous];
    
    kNSLog(@"ASIClient POST: %@ %@",[request url],paramsDic);
    
    
    
    return request;
    
}


+ (ASIHTTPRequest *)DownFile_Path:(NSString *)path writeTo:(NSString *)destination fileName:(NSString *)name setProgress:(KKProgressBlock)progressBlock completed:(ASIBasicBlock)completedBlock failed:(KKFailedBlock )failed
{
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:path]];
    NSString *filePath = nil;
    if ([destination hasSuffix:@"/"]) {
        filePath = [NSString stringWithFormat:@"%@%@",destination,name];  
    }
    else
    {
        filePath = [NSString stringWithFormat:@"%@/%@",destination,name];
    }
    [request setDownloadDestinationPath:filePath];
    
    __block float downProgress = 0;
    [request setBytesReceivedBlock:^(unsigned long long size, unsigned long long total) {
        downProgress += (float)size/total;
        progressBlock(downProgress);
    }];
    
    [request setCompletionBlock:^{
        downProgress = 0;
        completedBlock();
    }];
    
    [request setFailedBlock:^{
        failed([request error]);
    }];
    
    [request startAsynchronous];
    
    kNSLog(@"ASIClient 下载文件：%@ ",path);
    kNSLog(@"ASIClient 保存路径：%@",filePath);
    
    
    return request;
}


+ (ASIHTTPRequest *)UploadFile_Path:(NSString *)path file:(NSString *)filePath forKey:(NSString *)fileKey params:(NSDictionary *)params SetProgress:(KKProgressBlock )progressBlock completed:(KKCompletedBlock )completedBlock failed:(KKFailedBlock )failed
{
    
    NSURL *url = [NSURL URLWithString:path];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setFile:filePath forKey:fileKey];
    if (params.count > 0) {
        [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [request setPostValue:obj forKey:key];
        }];
    }
    
    __block float upProgress = 0;
    [request setBytesSentBlock:^(unsigned long long size, unsigned long long total) {
        upProgress += (float)size/total;
        progressBlock(upProgress);
    }];
    
    [request setCompletionBlock:^{
        upProgress=0;
        NSError *errorForJSON = [NSError errorWithDomain:@"请求数据解析为json格式，发出错误" code:2014 userInfo:@{@"请求数据json解析错误": @"中文",@"serial the data to json error":@"English"}];
        id jsonData = [NSJSONSerialization JSONObjectWithData:[request responseData] options:0 error:&errorForJSON];
        completedBlock(jsonData,[request responseString]);
    }];
    
    [request setFailedBlock:^{
        failed([request error]);
    }];
    
    [request startAsynchronous];
    
    kNSLog(@"ASIClient 文件上传：%@ file=%@ key=%@",path,filePath,fileKey);
    kNSLog(@"ASIClient 文件上传参数：%@",params);
    
    
    
    return request;
}


+ (ASIHTTPRequest *)UploadData_Path:(NSString *)path fileData:(NSData *)fData forKey:(NSString *)dataKey params:(NSDictionary *)params SetProgress:(KKProgressBlock )progressBlock completed:(KKCompletedBlock )completedBlock failed:(KKFailedBlock )failed
{
    NSURL *url = [NSURL URLWithString:path];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setData:fData forKey:dataKey];
    if (params.count > 0) {
        [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [request setPostValue:obj forKey:key];
        }];
    }
    
    __block float upProgress = 0;
    [request setBytesSentBlock:^(unsigned long long size, unsigned long long total) {
        upProgress += (float)size/total;
        progressBlock(upProgress);
    }];
    
    [request setCompletionBlock:^{
        upProgress=0;
        NSError *errorForJSON = [NSError errorWithDomain:@"请求数据解析为json格式，发出错误" code:2014 userInfo:@{@"请求数据json解析错误": @"中文",@"serial the data to json error":@"English"}];
        id jsonData = [NSJSONSerialization JSONObjectWithData:[request responseData] options:0 error:&errorForJSON];
        completedBlock(jsonData,[request responseString]);
    }];
    
    [request setFailedBlock:^{
        failed([request error]);
    }];
    
    [request startAsynchronous];
    
    kNSLog(@"ASIClient 文件上传：%@ size=%.2f MB  key=%@",path,fData.length/1024.0/1024.0,dataKey);
    kNSLog(@"ASIClient 文件上传参数：%@",params);
    
    return request;

}


+ (ASIHTTPRequest *)ResumeDown_Path:(NSString *)path writeTo:(NSString *)destinationPath tempPath:(NSString *)tempPath fileName:(NSString *)name setProgress:(KKProgressBlock )progressBlock completed:(ASIBasicBlock )completedBlock failed:(KKFailedBlock )failed
{
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:path]];
    NSString *filePath = nil;
    if ([destinationPath hasSuffix:@"/"]) {
        filePath = [NSString stringWithFormat:@"%@%@",destinationPath,name];
    }
    else
    {
        filePath = [NSString stringWithFormat:@"%@/%@",destinationPath,name];
    }
    
    [request setDownloadDestinationPath:filePath];
    
    NSString *tempForDownPath = nil;
    if ([tempPath hasSuffix:@"/"]) {
        tempForDownPath = [NSString stringWithFormat:@"%@%@.download",tempPath,name];
    }
    else
    {
        tempForDownPath = [NSString stringWithFormat:@"%@/%@.download",tempPath,name];
    }
    
    [request setTemporaryFileDownloadPath:tempForDownPath];
    [request setAllowResumeForFileDownloads:YES];
    
    __block float downProgress = 0;
    downProgress = [[NSUserDefaults standardUserDefaults] floatForKey:@"ASIClient_ResumeDOWN_PROGRESS"];
    [request setBytesReceivedBlock:^(unsigned long long size, unsigned long long total) {
        downProgress += (float)size/total;
        if (downProgress >1.0) {
            downProgress=1.0;
        }
        [[NSUserDefaults standardUserDefaults] setFloat:downProgress forKey:@"ASIClient_ResumeDOWN_PROGRESS"];
        progressBlock(downProgress);
    }];
    
    [request setCompletionBlock:^{
        downProgress = 0;
        [[NSUserDefaults standardUserDefaults] setFloat:downProgress forKey:@"ASIClient_ResumeDOWN_PROGRESS"];
        completedBlock();
        if ([[NSFileManager defaultManager] fileExistsAtPath:tempForDownPath]) {
            //NSError *errorForDelete = [NSError errorWithDomain:@"删除临时文件发生错误！" code:2015 userInfo:@{@"删除临时文件发生错误": @"中文",@"delete the temp fife error":@"English"}];
            //[[NSFileManager defaultManager] removeItemAtPath:tempForDownPath error:&errorForDelete];
            kNSLog(@"l  %d> %s",__LINE__,__func__);
        }
    }];
    
    [request setFailedBlock:^{
        failed([request error]);
    }];
    
    [request startAsynchronous];
    
    kNSLog(@"ASIClient 下载文件：%@ ",path);
    kNSLog(@"ASIClient 保存路径：%@",filePath);
    if (downProgress >0 && downProgress) {
        if (downProgress >=1.0) downProgress = 0.9999;
        kNSLog(@"ASIClient 上次下载已完成：%.2f/100",downProgress*100);
    }
    
    
    return request;

}




//废弃的方法；
- (void)GET:(NSString *)path params:(NSDictionary *)params ompletionBlock:(ASIBasicBlock )completedBlock failedBlock:(ASIBasicBlock )failBlock;
{

    
    NSURL *url = [NSURL URLWithString:path];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setCompletionBlock:completedBlock];
    [request setFailedBlock:failBlock];
    [request startAsynchronous];
}



- (void)dealloc
{
    [[ASIClient client] release];
    NSLog(@"line<%d> %s release siglton",__LINE__,__func__);
    [super dealloc];
}

@end
