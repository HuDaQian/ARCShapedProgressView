//
//  ViewController.m
//  Progress2Demo
//
//  Created by Jie on 16/8/1.
//  Copyright © 2016年 com.fazhiwang. All rights reserved.
//

#import "ViewController.h"
#import "HDQCircleProgressView.h"

@interface ViewController (){
    NSTimer *time1;
}
@property (nonatomic, strong) HDQCircleProgressView *progressView;
@property (nonatomic, assign) CGFloat progress1;

@end

@implementation ViewController
@synthesize progress1;
@synthesize progressView;

- (void)viewDidLoad {
    [super viewDidLoad];
    progress1 = 0.5;
    [self createView];
    time1 = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(progressSimulation:) userInfo:self repeats:YES];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - createView
- (void)createView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 150, 200, 200)];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
//    progressView = [[HDQCircleProgressView alloc] initWithFrame:CGRectMake(0, 0, 200, 200) start:M_PI_2 end:M_PI_4 isReverse:NO];
    progressView = [[HDQCircleProgressView alloc] initWithFrame:CGRectMake(0, 0, 200, 200) start:M_PI_2 end:M_PI_4 andDistanse:7 isReverse:NO];

    [progressView setBackColor:[UIColor yellowColor] foreColor:[UIColor redColor]];
//    [progressView setLeadImage:[UIImage imageNamed:@"蓝色"] andSize:CGSizeMake(24, 24)];
    
//    progressView = [[HalfCircleProgressView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [view addSubview:progressView];
}

#pragma mark - privateMethod

- (void)progressSimulation:(id)sender {
    static CGFloat progress = 0;
        if (progress > 1) {
            
        } else {
            progress += 0.01;
        }
        if (progress > progress1+0.01) {
            [time1 invalidate];
            return;
        }
        progressView.progress = progress;
}


@end
