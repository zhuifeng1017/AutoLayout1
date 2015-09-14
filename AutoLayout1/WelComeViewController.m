//
//  WelComeViewController.m
//  AutoLayout1
//
//  Created by ZhaoMin on 15/9/14.
//  Copyright (c) 2015年 ZhaoMin. All rights reserved.
//

#import "WelComeViewController.h"

@interface WelComeViewController ()

@end

@implementation WelComeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width*2, _scrollView.frame.size.height)];
}

- (void)viewDidLayoutSubviews
{
  [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width*2, _scrollView.frame.size.height)];
}



@end
