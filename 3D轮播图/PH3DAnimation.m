//
//  PH3DAnimation.m
//  3D轮播图
//
//  Created by 123 on 16/9/4.
//  Copyright © 2016年 彭洪. All rights reserved.
//

#import "PH3DAnimation.h"

@implementation PH3DAnimation

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //调用显示3D广告
        [self show3DBannerView];
        
        //定时器
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeImageAction:) userInfo:nil repeats:YES];
    }
    return self;
}

//创建页码器
- (void)createPageControl:(NSUInteger)page {
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height-25, self.frame.size.width, 25)];
    self.pageControl.center = CGPointMake(self.frame.size.width/2, self.pageControl.center.y);
    self.pageControl.numberOfPages  = page;
    self.pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:1.00 green:0.00 blue:0.502 alpha:1.0];//当前点的颜色
    self.pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:0.6 alpha:1.0];//设置其它点颜色
    self.pageControl.userInteractionEnabled = NO;
    [self addSubview:self.pageControl];
}

//实现定时器方法
- (void)changeImageAction:(NSTimer *)sender {
    [self transitionAnimation:YES AnimationMode:7];
}


- (void)show3DBannerView {
    _imageArr = @[@"0.jpg",@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg"];
    
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    
    [self addSubview:_imageView];
    
    UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipe:)];
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:leftSwipeGesture];
    
    UISwipeGestureRecognizer *rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipe:)];
    rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:rightSwipeGesture];
    
    [self createPageControl:_imageArr.count];
}

/**
 *  向左滑动浏览下一张图片
 *
 *  @param gesture
 */
- (void)leftSwipe:(UISwipeGestureRecognizer *)gesture {
    [self transitionAnimation:YES AnimationMode:4];
}

/**
 *  向右滑动浏览上一张图片
 *
 *  @param gestrue
 */
- (void)rightSwipe:(UISwipeGestureRecognizer *)gestrue {
    [self transitionAnimation:NO AnimationMode:5];
}
/**
 *  转场动画
 *
 *  @param isNext
 *  @param mode
 */
- (void)transitionAnimation:(BOOL)isNext AnimationMode:(NSInteger)mode {
    //动画模式
    _animationModeArr = @[@"cube",@"moveIn",@"reveal",@"fade",@"pageCurl",@"pageUnCurl",@"suckEffect",@"rippleEffect",@"oglFlip"];
    
    CATransition *transition = [[CATransition alloc] init];
    transition.type = _animationModeArr[mode];
    
    //设置子类型 (动画方向)
    if (isNext) {
        transition.subtype = kCATransitionFromRight;
    }
    else {
        transition.subtype = kCATransitionFromLeft;
    }
    transition.duration = 1.0f;
    //设置转场后新试图添加专场动画
    _imageView.image = [self getImage:isNext];
    
    //加载动画
    [_imageView.layer addAnimation:transition forKey:@"KCTransitionAnimation"];
}

- (UIImage *)getImage:(BOOL)isNext {
    if (isNext) {
        _currentIndex = (_currentIndex+1)%_imageArr.count;
        self.pageControl.currentPage = _currentIndex;
    }
    else {
        _currentIndex = (_currentIndex-1+_imageArr.count)%(NSInteger)_imageArr.count;
        self.pageControl.currentPage = _currentIndex;
    }
    NSString *imageName = [_imageArr objectAtIndex:_currentIndex];
    return [UIImage imageNamed:imageName];
}

@end




















































