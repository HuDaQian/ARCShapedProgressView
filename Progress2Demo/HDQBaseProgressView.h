//
//  BaseProgressView.h
//  Progress2Demo
//
//  Created by Jie on 16/8/1.
//  Copyright © 2016年 com.fazhiwang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ColorMaker(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]
#define ProgressViewItemMargin 10
#define ProgressViewFontScale (MIN(self.frame.size.width, self.frame.size.height) / 100.0)
#define ProgressViewBackgroundColor ColorMaker(240, 240, 240, 1)

@interface HDQBaseProgressView : UIView

@property (nonatomic, assign) CGFloat progress;

+ (id)progressView;
- (void)setCenterProgressText:(NSString *)text withAttributes:(NSDictionary *)attributes;
- (void)dismiss;

@end
