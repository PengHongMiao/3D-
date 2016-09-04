//
//  PHMainViewController.m
//  3D轮播图
//
//  Created by 123 on 16/9/4.
//  Copyright © 2016年 彭洪. All rights reserved.
//

#import "PHMainViewController.h"
#define PHSCREENW     [UIScreen mainScreen].bounds.size.width
#import "PH3DAnimation.h"
@interface PHMainViewController ()

@end

@implementation PHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    //添加3D广告轮播图
    PH3DAnimation *animation = [self setupADScrollView];
    [self.view addSubview:animation];
}

- (void)setUI {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_background"] forBarMetrics:UIBarMetricsDefault];
    self.title = @"3D轮播图";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    self.view.backgroundColor = [UIColor whiteColor];
}

/**
 *  3D滚动广告轮播
 */
- (PH3DAnimation *)setupADScrollView {
    PH3DAnimation *animation = [[PH3DAnimation alloc] initWithFrame:CGRectMake(0, 0, PHSCREENW, 160)];
    return animation;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





























/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
