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
 *nextStep:Label.
 */

#import "HDQBaseProgressView.h"

@interface HDQCircleProgressView : HDQBaseProgressView

@property (nonatomic) int lineWidth;

//最后一个参数 表示 是否反向 如果是YES则按照顺时针计算
- (instancetype)initWithFrame:(CGRect)frame start:(double)start end:(double)end isReverse:(BOOL)reverse;
- (instancetype)initWithFrame:(CGRect)frame start:(double)start end:(double)end andDistanse:(CGFloat)distanse isReverse:(BOOL)reverse;

- (void)setBackColor:(UIColor *)backColor foreColor:(UIColor *)color;

- (void)setLeadImage:(UIImage *)image andSize:(CGSize)size;

@end
