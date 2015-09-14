//
//  CodeLayoutViewController.m
//  AutoLayout1
//
//  Created by ZhaoMin on 15/9/14.
//  Copyright (c) 2015年 ZhaoMin. All rights reserved.
//

#import "CodeLayoutViewController.h"

@interface CodeLayoutViewController ()

@end

@implementation CodeLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self test2];
}


-(void) test2{
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectZero];
    view1.backgroundColor = [UIColor redColor];
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectZero];
    view2.backgroundColor = [UIColor blueColor];
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:view2];
    
    
    NSDictionary *viewDict1 = NSDictionaryOfVariableBindings(view1, view2);
    
    NSArray *vConstrt1= [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[view1(100)]-8-[view2(==view1)]" options:0 metrics:nil views:viewDict1];
    [self.view addConstraints:vConstrt1];
    
    
    // @"H:|[view1]|" 等价于 @"H:|-0-[view1]-0-|"
    NSArray *hConstrt1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view1]-0-|" options:0 metrics:nil views:viewDict1];
    [self.view addConstraints:hConstrt1];
    
    

    NSArray *hConstrt2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view2]|" options:0 metrics:nil views:viewDict1];
    [self.view addConstraints:hConstrt2];
    
}

-(void) test1{
    UIButton *button1;
    UIButton *button2;

    
    button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.backgroundColor = [UIColor blueColor];
    button1.translatesAutoresizingMaskIntoConstraints = NO;
    button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.backgroundColor = [UIColor redColor];
    button2.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    
    NSDictionary *viewDict = NSDictionaryOfVariableBindings(button1, button2);
    
    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[button1(100)]-50@750-[button2(==button1)]-20@750-|" options:NSLayoutFormatAlignAllTop metrics:0 views:viewDict];
    [self.view addConstraints:hCons];
    
    NSArray *vCons = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(100)-[button1(100)]" options:0 metrics:0 views:@{ @"button1" : button1, @"button2" : button2 }];
    [self.view addConstraints:vCons];
    
    NSArray *vCons1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[button2(==50)]" options:0 metrics:0
                                                                views:viewDict];
    [self.view addConstraints:vCons1];
}

@end
