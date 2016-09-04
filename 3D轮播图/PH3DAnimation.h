//
//  PH3DAnimation.h
//  3D轮播图
//
//  Created by 123 on 16/9/4.
//  Copyright © 2016年 彭洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ClickImageDelegate <NSObject>

- (void)clickImage:(NSInteger)index;//点击图片

@end

@interface PH3DAnimation : UIView

@property (nonatomic,assign) NSInteger currentIndex;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) NSArray    *imageArr;
@property (nonatomic,assign) id<ClickImageDelegate>delegate;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) NSArray    *animationModeArr;

- (void)show3DBannerView;//显示3D广告

@end











































