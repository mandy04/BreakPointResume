//
//  ViewController.m
//  BreakPointResume
//
//  Created by llbt on 16/3/28.
//  Copyright © 2016年 llbt. All rights reserved.
//

#import "ViewController.h"
#import "MC_DownLoadTask.h"

@interface ViewController ()
@property (nonatomic,strong)MC_DownLoadTask *downLoadTask;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 *  开始
 *
 */
- (IBAction)start:(UIButton *)sender {
    
    if (self.downLoadTask) {
        
        [self.downLoadTask resume1];
        
    }else {
    
        self.downLoadTask = [[MC_DownLoadTask alloc]init];
      
        [self.downLoadTask downLoadTaskWithUrl:[NSURL URLWithString:@"http://image.baidu.com/search/down?tn=download&word=download&ie=utf8&fr=detail&url=http%3A%2F%2Fimg.taopic.com%2Fuploads%2Fallimg%2F140714%2F234975-140G4155Z571.jpg&thumburl=http%3A%2F%2Fimg1.imgtn.bdimg.com%2Fit%2Fu%3D3342737063%2C3964532796%26fm%3D21%26gp%3D0.jpg"]];
        NSLog(@"%@",NSHomeDirectory());
        
    }
}

/**
 *  暂停
 *
 */
- (IBAction)pause:(UIButton *)sender {
    
    if (self.downLoadTask) {
        [self.downLoadTask pause];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
