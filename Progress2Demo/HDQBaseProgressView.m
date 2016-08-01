//
//  BaseProgressView.m
//  Progress2Demo
//
//  Created by Jie on 16/8/1.
//  Copyright © 2016年 com.fazhiwang. All rights reserved.
//

#import "HDQBaseProgressView.h"

@implementation HDQBaseProgressView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = ProgressViewBackgroundColor;
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    if ((int)progress > 1.0) {
        [self removeFromSuperview];
    } else {
        [self setNeedsDisplay];
    }
}

- (void)setCenterProgressText:(NSString *)text withAttributes:(NSDictionary *)attributes {
    CGFloat xCenter = self.frame.size.width * 0.5;
    CGFloat yCenter = self.frame.size.height * 0.5;
    // 判断系统版本
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
        CGSize strSize = [text sizeWithAttributes:attributes];
        CGFloat strX = xCenter - strSize.width * 0.5;
        CGFloat strY = yCenter - strSize.height * 0.5;
        [text drawAtPoint:CGPointMake(strX, strY) withAttributes:attributes];
    } else {
        CGSize strSize;
        NSAttributedString *attrStr = nil;
        if (attributes[NSFontAttributeName]) {
            strSize = [text sizeWithFont:attributes[NSFontAttributeName]];
            attrStr = [[NSAttributedString alloc] initWithString:text attributes:attributes];
        } else {
            strSize = [text sizeWithFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
            attrStr = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:[UIFont systemFontSize]]}];
        }
        
        CGFloat strX = xCenter - strSize.width * 0.5;
        CGFloat strY = yCenter - strSize.height * 0.5;
        
        [attrStr drawAtPoint:CGPointMake(strX, strY)];
    }
}

- (void)dismiss {
    self.progress = 1.0;
}

+ (instancetype)progressView {
    return  [[self alloc] init];
}


@end
