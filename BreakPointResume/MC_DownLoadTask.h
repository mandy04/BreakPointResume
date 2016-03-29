//
//  MC_DownLoadTask.h
//  BreakPointResume
//
//  Created by llbt on 16/3/28.
//  Copyright © 2016年 llbt. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>




@interface MC_DownLoadTask : NSObject<NSURLSessionDownloadDelegate>

/**
 *  创建下载任务
 */
@property (nonatomic, strong)NSURLSessionDownloadTask *task;

/**
 *  创建下载任务属性
 */
@property (nonatomic, strong)NSURLSession *session;

/**
 *  保存已完成文件
 */
@property (nonatomic, strong)NSData *resumeData;


/**
 *  下载任务
 *
 *  @param url
 */
- (void)downLoadTaskWithUrl:(NSURL *)url;

/**
 *  继续下载
 */
- (void)resume1;

/**
 *  暂停
 */
- (void)pause;

@end
