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
}
@property (nonatomic, strong) UIColor *unfilledColor;
@property (nonatomic, strong) UIColor *filledColor;
@property (nonatomic, strong) UIImage *leadImage;
@property (nonatomic, assign) CGSize leadImageSize;

@property (nonatomic, assign) double startPosition;
@property (nonatomic, assign) double endPosition;
@property (nonatomic, assign) BOOL isReverse;

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
        _leadImage = [UIImage imageNamed:@"橙色"];
        _leadImageSize = CGSizeMake(24, 24);
        radius = self.frame.size.height/2 - _lineWidth/2 - 9;
        _startPosition = 3*M_PI_4;
        _endPosition = M_PI_4;
        _isReverse = NO;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame start:(double)start end:(double)end isReverse:(BOOL)reverse {
    self = [self initWithFrame:frame];
    if (self) {
        _startPosition = start;
        _endPosition = end;
        _isReverse = reverse;
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
        CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, radius, _startPosition, _startPosition-((_startPosition-_endPosition)>0?(_startPosition-_endPosition):(2*M_PI-fabs(_startPosition-_endPosition)))*self.progress, 1);
    } else {
        CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, radius, _startPosition,  _startPosition+((_endPosition-_startPosition)>0?(_endPosition-_startPosition):(2*M_PI-fabs(_endPosition-_startPosition)))*self.progress, 0);
    }
    //    CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, radius, 3*M_PI_4,  3*M_PI_4+(7*M_PI_4-M_PI_4)*self.progress, 0);
    CGPoint handleCenter = CGContextGetPathCurrentPoint(ctx);
    
    [_filledColor setStroke];
    CGContextSetLineWidth(ctx, _lineWidth);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    
    CGContextSaveGState(ctx);
    //可以计算到位置也直接放在前面用方法获取
    //    CGPoint handleCenter = CGPointMake(-sin(3*M_PI_4+(M_PI_4-7*M_PI_4)*self.progress)*radius+self.frame.size.width/2, -cos(3*M_PI_4+(M_PI_4-7*M_PI_4)*self.progress)*radius+self.frame.size.height/2);
    [_leadImage drawAtPoint:CGPointMake((handleCenter.x)-(_leadImageSize.width/2),handleCenter.y-(_leadImageSize.height/2))];
    CGContextRestoreGState(ctx);
    
    //文字处理
    NSString *progressStr = [NSString stringWithFormat:@"%.0f %s",self.progress*100,"\%"];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20*ProgressViewFontScale];
    attributes[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [self setCenterProgressText:progressStr withAttributes:attributes];
}

//定制
- (void)setBackColor:(UIColor *)backColor foreColor:(UIColor *)foreColor {
    _unfilledColor = backColor;
    _filledColor = foreColor;
}

- (void)setLeadImage:(UIImage *)image andSize:(CGSize)size {
    _leadImage = image;
    _leadImageSize = size;
}

@end
