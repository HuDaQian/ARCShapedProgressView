# ARCShapedProgressView

#圆弧形进度条

![image](https://github.com/HuDaQian/ARCShapedProgressView/blob/master/%E7%A4%BA%E4%BE%8B%E5%9B%BE.gif)

##更新信息
2016-8-5

1.删除了main.sb，低版本xcode的小伙伴可以看了

2.修改了实现方法，更容易的使用了

3.增加了参数判断，如果小伙伴们不知道需要传什么参数的话，可以先传0传nil来看下效果

###使用方法


####//初始化的时候选择起始位置以及结束位置 后面参数是否反向指的是是否顺时针显示进度


    progressView = [[HDQCircleProgressView alloc] initWithFrame:CGRectMake(0, 0, 200, 200) start:M_PI_2 end:M_PI_4 isReverse:NO];

    
####//进度条的背景色与前景色


    [progressView setBackColor:[UIColor yellowColor] foreColor:[UIColor redColor]];

    
####//提示进度的图


    [progressView setLeadImage:[UIImage imageNamed:@"蓝色"] andSize:CGSizeMake(24, 24)];
    


2016年8月1日