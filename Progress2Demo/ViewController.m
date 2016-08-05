//
//  ViewController.m
//  Progress2Demo
//
//  Created by Jie on 16/8/1.
//  Copyright © 2016年 com.fazhiwang. All rights reserved.
//

#import "ViewController.h"
#import "HDQCircleProgressView.h"

@interface ViewController ()

@property (nonatomic, strong) HDQCircleProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
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

    _progressView = [[HDQCircleProgressView alloc] initWithFrame:CGRectMake(0, 0, 200, 200) start:M_PI_2 end:M_PI_4 andDistanse:15 isReverse:NO andEndProgress:1];
    [_progressView setBackColor:[UIColor yellowColor] foreColor:[UIColor redColor]];
//    [progressView setLeadImage:[UIImage imageNamed:@"蓝色"] andSize:CGSizeMake(24, 24)];
    [view addSubview:_progressView];
}



@end
