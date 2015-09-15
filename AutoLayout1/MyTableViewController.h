//
//  MyTableViewController.h
//  AutoLayout1
//
//  Created by ZhaoMin on 15/9/15.
//  Copyright (c) 2015年 ZhaoMin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
