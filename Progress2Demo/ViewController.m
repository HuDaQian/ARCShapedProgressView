//
//  ViewController.m
//  Progress2Demo
//
//  Created by Jie on 16/8/1.
//  Copyright © 2016年 com.fazhiwang. All rights reserved.
//

#import "ViewController.h"
#import "HDQCircleProgressView.h"

@interface ViewController ()<UIGestureRecognizerDelegate>

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
    UIGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)];
    tapGesture.delegate = self;
    [self.view addGestureRecognizer:tapGesture];
    
    UIView *progressBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(50, 150, 200, 200)];
    progressBackgroundView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:progressBackgroundView];

    _progressView = [[HDQCircleProgressView alloc] initWithFrame:CGRectMake(0, 0, 200, 200) start:0 end:M_PI*7/4 andDistanse:15 isReverse:YES andEndProgress:1];
    [_progressView setBackColor:[UIColor yellowColor] foreColor:[UIColor redColor]];
//    [progressView setLeadImage:[UIImage imageNamed:@"蓝色"] andSize:CGSizeMake(24, 24)];
    [progressBackgroundView addSubview:_progressView];
    
    UITextField *progressTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 400, 200, 30)];
    progressTextField.placeholder = @"修改最终进度(0-100)";
    progressTextField.tag = 2000;
    progressTextField.clearsOnBeginEditing = YES;
    progressTextField.borderStyle = UITextBorderStyleLine;
    progressTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:progressTextField];
    
    UIButton *changeProgressButton = [UIButton buttonWithType:UIButtonTypeCustom];
    changeProgressButton.frame = CGRectMake(100, 450, 80, 30);
    [changeProgressButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    changeProgressButton.tag = 1000;
    [changeProgressButton setTitle:@"修改" forState:UIControlStateNormal];
    [changeProgressButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:changeProgressButton];
    

}

#pragma mark - btnMethod
- (void)buttonClicked:(UIButton *)sender {
    switch (sender.tag) {
        case 1000: {
            NSLog(@"修改PRogress");
            UITextField *progressTextField = (UITextField *)[self.view viewWithTag:2000];
            if (progressTextField.text && [progressTextField.text isEqualToString:@""] &&[progressTextField.text integerValue] > 100) {
                [_progressView changeEndProgress:0];
            } else {
                [_progressView changeEndProgress:([progressTextField.text floatValue]/100)];
            }
        }
            break;
        default:
            break;
    }
}
- (void)tapHandle:(UIGestureRecognizer *)gesture {
    UITextField *progressTextField = (UITextField *)[self.view viewWithTag:2000];
    [progressTextField resignFirstResponder];
}
@end
