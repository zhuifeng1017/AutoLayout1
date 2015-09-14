//
//  WelComeViewController.m
//  AutoLayout1
//
//  Created by ZhaoMin on 15/9/14.
//  Copyright (c) 2015年 ZhaoMin. All rights reserved.
//

#import "WelComeViewController.h"

const BOOL USE_CODE = YES;

@interface WelComeViewController ()

@end

@implementation WelComeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 在这里设置是没有用的，需要在viewDidLayoutSubviews设置
    //  [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width*2, _scrollView.frame.size.height)];
    if (USE_CODE) {
        [_scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

        UIImageView *imageView1 = [[UIImageView alloc] init];
        imageView1.translatesAutoresizingMaskIntoConstraints = NO;
        imageView1.image = [UIImage imageNamed:@"imager_01"];
        [_scrollView addSubview:imageView1];

        UIImageView *imageView2 = [[UIImageView alloc] init];
        imageView2.translatesAutoresizingMaskIntoConstraints = NO;
        imageView2.image = [UIImage imageNamed:@"imager_02"];
        [_scrollView addSubview:imageView2];

        NSDictionary *viewDict1 = NSDictionaryOfVariableBindings(imageView1, imageView2, _scrollView);

        // imageView1与父视图上下间距0，高度相等
        NSArray *vConstrt1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView1(==_scrollView)]|" options:0 metrics:nil views:viewDict1];
        [self.view addConstraints:vConstrt1];

        // imageView2与父视图上下间距0，高度相等
        NSArray *vConstrt2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView2(==_scrollView)]|" options:0 metrics:nil views:viewDict1];
        [self.view addConstraints:vConstrt2];

        // imageView1与父视图左间距0, 宽度相等
        NSArray *hConstrt1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView1(==_scrollView)]|" options:0 metrics:nil views:viewDict1];
        [self.view addConstraints:hConstrt1];

        // imageView2与imageView1左间距0, 宽度等于父视图
        NSArray *hConstrt2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[imageView1]-0-[imageView2(==_scrollView)]" options:0 metrics:nil views:viewDict1];
        [self.view addConstraints:hConstrt2];
    }
}

- (void)viewWillLayoutSubviews {
}

- (void)viewDidLayoutSubviews {
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width * 2, _scrollView.frame.size.height)];
}

@end
