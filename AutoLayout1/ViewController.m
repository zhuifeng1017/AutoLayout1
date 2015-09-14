//
//  ViewController.m
//  AutoLayout1
//
//  Created by ZhaoMin on 15/9/14.
//  Copyright (c) 2015年 ZhaoMin. All rights reserved.
//

#import "ViewController.h"
#import "CodeLayoutViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btnClick:(id)sender {
    CodeLayoutViewController *vc = [[CodeLayoutViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
