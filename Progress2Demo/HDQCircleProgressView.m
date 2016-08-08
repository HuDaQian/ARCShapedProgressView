//
//  CircleProgressView.m
//  Progress2Demo
//
//  Created by Jie on 16/8/1.
//  Copyright © 2016年 com.fazhiwang. All rights reserved.
//



#import "HDQCircleProgressView.h"


@interface HDQCircleProgressView (){
    CGFloat radius;
    CGFloat centerRadius;
    NSTimer *timer1;
}
@property (nonatomic, strong) UIColor *unfilledColor;
@property (nonatomic, strong) UIColor *filledColor;
@property (nonatomic, strong) UIImage *leadImage;
@property (nonatomic, assign) CGSize leadImageSize;

@property (nonatomic, assign) double startPosition;
@property (nonatomic, assign) double endPosition;
@property (nonatomic, assign) BOOL isReverse;
@property (nonatomic, assign) CGFloat distanse;

@property (nonatomic, assign) CGFloat endProgress;

@end

@implementation HDQCircleProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Defaults
        _lineWidth = 5;
        _unfilledColor = [UIColor grayColor];
        _filledColor = [UIColor whiteColor];
        _leadImage = [[UIImage alloc] init];
        _leadImageSize = CGSizeMake(24, 24);
        radius = self.frame.size.height/2 - _lineWidth/2 - 9;
        centerRadius = self.frame.size.height/2-9-_distanse;
        _startPosition = 3*M_PI_4;
        _endPosition = M_PI_4;
        _isReverse = NO;
        _endProgress = 1;
        self.backgroundColor = [UIColor clearColor];
        
        timer1 = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(progressSimulation:) userInfo:self repeats:YES];

    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame andEndProgress:(CGFloat)endProgress {
    self = [self initWithFrame:frame];
    if (self) {
        if (_endProgress != 0) {
            _endProgress = endProgress;
        }
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame start:(double)start end:(double)end isReverse:(BOOL)reverse andEndProgress:(CGFloat)progress {
    self = [self initWithFrame:frame andEndProgress:progress];
    if (self) {
        if (_startPosition != 0) {
            _startPosition = start;
        }
        if (_endPosition) {
            _endPosition = end;
        }
        _isReverse = reverse;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame start:(double)start end:(double)end andDistanse:(CGFloat)distanse isReverse:(BOOL)reverse andEndProgress:(CGFloat)progress{
    self = [self initWithFrame:frame andEndProgress:progress];
    if (self) {
        if (_startPosition != 0) {
            _startPosition = start;
        }
        if (_endPosition) {
            _endPosition = end;
        }
        _isReverse = reverse;
        _distanse = distanse;
        
        if (distanse<7 ||distanse>self.frame.size.height/2) {
            //数据错误
            centerRadius = 0;
        }
        centerRadius = self.frame.size.height/2-10-_distanse;
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    //背景
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //    CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, radius, M_PI_4*3, M_PI_4, 0);
    
//    if (_isReverse) {
//        CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, radius, _endPosition, _startPosition, 0);
//        } else {
    CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, radius, _startPosition, _endPosition, (int)_isReverse);
//        }

    [_unfilledColor setStroke];
    CGContextSetLineWidth(ctx, _lineWidth);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    if (_isReverse) {
        CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, centerRadius, _startPosition, _startPosition-((_startPosition-_endPosition)>0?(_startPosition-_endPosition):(2*M_PI-fabs(_startPosition-_endPosition)))*self.progress, 1);
    } else {
        CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, centerRadius, _startPosition,  _startPosition+((_endPosition-_startPosition)>0?(_endPosition-_startPosition):(2*M_PI-fabs(_endPosition-_startPosition)))*self.progress, 0);
    }
    //    CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, radius, 3*M_PI_4,  3*M_PI_4+(7*M_PI_4-M_PI_4)*self.progress, 0);
    CGPoint centerCirclePoint = CGContextGetPathCurrentPoint(ctx);
    
    [_filledColor setStroke];
    CGContextSetLineWidth(ctx, _lineWidth);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    
    if (_leadImage == nil) {
        
    } else {
        CGContextSaveGState(ctx);
        //可以计算到位置也直接放在前面用方法获取
//    CGPoint handleCenter = CGPointMake(-sin(3*M_PI_4+(M_PI_4-7*M_PI_4)*self.progress)*radius+self.frame.size.width/2, -cos(3*M_PI_4+(M_PI_4-7*M_PI_4)*self.progress)*radius+self.frame.size.height/2);
        [_leadImage drawAtPoint:CGPointMake(centerCirclePoint.x-(_leadImageSize.width/2),centerCirclePoint.y-(_leadImageSize.height/2))];
        CGContextRestoreGState(ctx);
    }
    
    //文字处理
    NSString *progressStr = [NSString stringWithFormat:@"%.0f %s",self.progress*100,"\%"];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20*ProgressViewFontScale];
    attributes[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [self setCenterProgressText:progressStr withAttributes:attributes];
}

//定制
- (void)setBackColor:(UIColor *)backColor foreColor:(UIColor *)foreColor {
    if (backColor != nil) {
        _unfilledColor = backColor;
    }
    if (foreColor != nil) {
        _filledColor = foreColor;
    }
}

- (void)setLeadImage:(UIImage *)image andSize:(CGSize)size {
    if (_leadImage != nil) {
        _leadImage = image;
        _leadImageSize = size;        
    }
}

- (void)changeEndProgress:(CGFloat)newEndProgress {
    if (timer1.isValid) {
        //计时器还存在的时候
        [timer1 invalidate];
    } else {
        //计时器不存在的时候
    }
    self.progress = 0;
    _endProgress = newEndProgress;
    timer1 = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(progressSimulation:) userInfo:self repeats:YES];
}

#pragma mark - privateMethod
- (void)progressSimulation:(id)sender {
    if (_endProgress == 0) {
        return;
    }
    if (self.progress > 1) {
        
    } else {
        self.progress += 0.001;
    }
    if (self.progress > _endProgress) {
        [timer1 invalidate];
        return;
    }
}

@end
