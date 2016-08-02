# ARCShapedProgressView

#圆弧形进度条

![image](https://github.com/HuDaQian/ARCShapedProgressView/blob/master/%E7%A4%BA%E4%BE%8B%E5%9B%BE.gif)

###使用方法


####//初始化的时候选择起始位置以及结束位置 后面参数是否反向指的是是否顺时针显示进度


    progressView = [[HDQCircleProgressView alloc] initWithFrame:CGRectMake(0, 0, 200, 200) start:M_PI_2 end:M_PI_4 isReverse:NO];

    
####//进度条的背景色与前景色


    [progressView setBackColor:[UIColor yellowColor] foreColor:[UIColor redColor]];

    
####//提示进度的图


    [progressView setLeadImage:[UIImage imageNamed:@"蓝色"] andSize:CGSizeMake(24, 24)];
    


2016年8月1日