//
//  MC_DownLoadTask.m
//  BreakPointResume
//
//  Created by llbt on 16/3/28.
//  Copyright © 2016年 llbt. All rights reserved.
//

#import "MC_DownLoadTask.h"

@implementation MC_DownLoadTask

-(void)downLoadTaskWithUrl:(NSURL *)url
{
    self.task = [self.session downloadTaskWithURL:url];
    //开始下载
    [self.task resume];
}

- (NSURLSession *)session
{
    if (!_session) {
        NSURLSessionConfiguration *sessionConfigure = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:sessionConfigure delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    
    return _session;
}
/**
 *  暂停
 */
- (void)pause {
 
    NSLog(@"暂停任务");
    __weak typeof(self) weakSelf = self;
    [self.task cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        weakSelf.resumeData = resumeData;
        weakSelf.task = nil;
    }];
}

/**
 *  继续下载
 */
- (void)resume1 {
    
    NSLog(@"继续下载");
    
    [self.session downloadTaskWithResumeData:self.resumeData];
    [self.task resume];
    self.resumeData = nil;
}

#pragma mark Deleagete

/**
 *  文件下载完成
 *
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    NSLog(@"下载完成！");
    //拿到caches文件夹的路径
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    
    //拿到caches文件夹和文件名
    NSString *file = [caches stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
    NSFileManager *manager = [NSFileManager defaultManager];
    
    //移动下载好的文件到指定的文件夹
    [manager moveItemAtPath:location.path toPath:file error:nil];
}

/**
 *  正在下载
 *
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    float progress = totalBytesWritten / totalBytesExpectedToWrite;

    NSLog(@"%f",progress);
}

@end
