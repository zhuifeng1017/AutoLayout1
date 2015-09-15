//
//  WelComeViewController.m
//  AutoLayout1
//
//  Created by ZhaoMin on 15/9/14.
//  Copyright (c) 2015年 ZhaoMin. All rights reserved.
//

#import "WelComeViewController.h"

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

const BOOL USE_CODE = YES;
const BOOL USE_VFS = NO;
const BOOL USE_NSCONS = NO; // 使用NSLayoutConstraint一个个写，泪奔的感觉
const BOOL USE_Masonry = YES;

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

        if (USE_VFS) {
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
            NSArray *hConstrt2 = [NSLayoutConstraint
                constraintsWithVisualFormat:@"H:[imageView1][imageView2(==_scrollView)]"
                                    options:0
                                    metrics:nil
                                      views:viewDict1];
            [self.view addConstraints:hConstrt2];
        } else if (USE_NSCONS) {
            [self.view addConstraints:@[
                                         // view1
                                         // 宽，高相等
                                         [NSLayoutConstraint constraintWithItem:imageView1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_scrollView attribute:NSLayoutAttributeWidth multiplier:1 constant:0],
                                         [NSLayoutConstraint constraintWithItem:imageView1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_scrollView attribute:NSLayoutAttributeHeight multiplier:1 constant:0],

                                         // 上下间距0
                                         [NSLayoutConstraint constraintWithItem:imageView1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_scrollView attribute:NSLayoutAttributeTop multiplier:1 constant:0],
                                         [NSLayoutConstraint constraintWithItem:imageView1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_scrollView attribute:NSLayoutAttributeBottom multiplier:1 constant:0],

                                         // 左间距0
                                         [NSLayoutConstraint constraintWithItem:imageView1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_scrollView attribute:NSLayoutAttributeLeft multiplier:1 constant:0],

                                         // view2
                                         // 宽，高相等
                                         [NSLayoutConstraint constraintWithItem:imageView2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_scrollView attribute:NSLayoutAttributeWidth multiplier:1 constant:0],
                                         [NSLayoutConstraint constraintWithItem:imageView2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_scrollView attribute:NSLayoutAttributeHeight multiplier:1 constant:0],

                                         // 上下间距0
                                         [NSLayoutConstraint constraintWithItem:imageView2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_scrollView attribute:NSLayoutAttributeTop multiplier:1 constant:0],
                                         [NSLayoutConstraint constraintWithItem:imageView2 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_scrollView attribute:NSLayoutAttributeBottom multiplier:1 constant:0],

                                         // view2左=view1右
                                         [NSLayoutConstraint constraintWithItem:imageView2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:imageView1 attribute:NSLayoutAttributeRight multiplier:1 constant:0],
                                      ]];
        } else if (USE_Masonry) { // 代码少又好理解！
            [imageView1 makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(_scrollView);
                make.height.equalTo(_scrollView);
                make.centerX.equalTo(_scrollView);
                make.centerY.equalTo(_scrollView);
            }];

            [imageView2 makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(_scrollView);
                make.height.equalTo(_scrollView);
                make.top.equalTo(_scrollView);
                make.bottom.equalTo(_scrollView);
                make.left.equalTo(imageView1.right);
            }];
        }
    }
}

//+ (BOOL)requiresConstraintBasedLayout
//{
//    return YES;
//}

- (void)viewWillLayoutSubviews {
}

- (void)viewDidLayoutSubviews {
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width * 2, _scrollView.frame.size.height)];
}

@end
