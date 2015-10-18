//
//  AutolayoutTableViewController.h
//  AutoLayout1
//
//  Created by ZhaoMin on 15/9/18.
//  Copyright (c) 2015年 ZhaoMin. All rights reserved.
//

#import <UIKit/UIKit.h>
#define FDLayout 1


@interface AutolayoutCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgWidthCons;

#if FDLayout
- (void)setEntity:(NSString *) imagePath contentText:(NSString*) contentText;
#else
@property (copy, nonatomic) NSString *contentImagePath;
#endif


@end




@interface AutolayoutTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
