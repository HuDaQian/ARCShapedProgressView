//
//  CircleProgressView.h
//  Progress2Demo
//
//  Created by Jie on 16/8/1.
//  Copyright © 2016年 com.fazhiwang. All rights reserved.
//

/*
 *Tips:
 *本demo部分数据为本人测试过看起来效果不错的，如果有需要可以作修改：
 *radius,centerRadius的判定数据等。
 *
 *version:0.0.2
 *newFeature:
 *The lines can have distance, and u needn't set image.
 *
 *version:0.0.3
 *newFeature:
 *1.U can give 0 or nil for create view.
 *
 *version:0.1.0
 *newFeature:
 *1.Add a Method to change endProgress.
 *2.Change the timer method.
 *
 *关于参数中isReverse的说明:
 *当设定了起点和终点之后，起点终点是不会变的，正反向仅仅代表顺逆时针。
 *
 *nextStep:Label.
 */

#import "HDQBaseProgressView.h"

typedef void(^ChangeAgain)();

@interface HDQCircleProgressView : HDQBaseProgressView

@property (nonatomic) int lineWidth;


@property (nonatomic, copy) ChangeAgain changeAgain;

//isReverse 表示是否反向 如果是YES则按照顺时针计算
//参数为空处理

///根据尺寸 开始位置和结束位置来初始化progressView   isReverse表示是否反向 如果是YES则按照顺时针计算 如果不知道参数如何填写的话，可以写成0 或者nil
- (instancetype)initWithFrame:(CGRect)frame start:(double)start end:(double)end isReverse:(BOOL)reverse andEndProgress:(CGFloat)progress;

///根据尺寸 开始位置和结束位置 两条线的间距来初始化progressView   isReverse表示是否反向 如果是YES则按照顺时针计算 如果不知道参数如何填写的话，可以写成0 或者nil
- (instancetype)initWithFrame:(CGRect)frame start:(double)start end:(double)end andDistanse:(CGFloat)distanse isReverse:(BOOL)reverse andEndProgress:(CGFloat)progress;

///设定进度线的颜色和尺度线的颜色
- (void)setBackColor:(UIColor *)backColor foreColor:(UIColor *)color;

///设定指示图片
- (void)setLeadImage:(UIImage *)image andSize:(CGSize)size;

///设定新的终点
- (void)changeEndProgress:(CGFloat)newEndProgress;

@end
