//
//  LableMultiLineViewController.m
//  AutoLayout1
//
//  Created by ZhaoMin on 15/9/15.
//  Copyright (c) 2015年 ZhaoMin. All rights reserved.
//

#import "LableMultiLineViewController.h"

@interface LableMultiLineViewController ()

@end

@implementation LableMultiLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _label.numberOfLines = 4;
}

//- (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//    _label.preferredMaxLayoutWidth = _label.frame.size.width;
//    [self.view layoutIfNeeded];
//}

@end
