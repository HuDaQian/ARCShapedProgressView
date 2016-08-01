//
//  CircleProgressView.h
//  Progress2Demo
//
//  Created by Jie on 16/8/1.
//  Copyright © 2016年 com.fazhiwang. All rights reserved.
//

#import "HDQBaseProgressView.h"

@interface HDQCircleProgressView : HDQBaseProgressView

@property (nonatomic) int lineWidth;

//最后一个参数 表示 是否反向 如果是YES则按照顺时针计算
- (instancetype)initWithFrame:(CGRect)frame start:(double)start end:(double)end isReverse:(BOOL)reverse;

- (void)setBackColor:(UIColor *)backColor foreColor:(UIColor *)color;

- (void)setLeadImage:(UIImage *)image andSize:(CGSize)size;

@end
