//
//  AutolayoutTableViewController.m
//  AutoLayout1
//
//  Created by ZhaoMin on 15/9/18.
//  Copyright (c) 2015年 ZhaoMin. All rights reserved.
//

#import "AutolayoutTableViewController.h"
#import "UIView+Frame.h"

CGSize CGSizeAspectFit(CGSize aspectRatio, CGSize boundingSize)
{
    float mW = boundingSize.width / aspectRatio.width;
    float mH = boundingSize.height / aspectRatio.height;
    if( mH < mW )
        boundingSize.width = boundingSize.height / aspectRatio.height * aspectRatio.width;
    else if( mW < mH )
        boundingSize.height = boundingSize.width / aspectRatio.width * aspectRatio.height;
    return boundingSize;
}

CGSize CGSizeAspectFill(CGSize aspectRatio, CGSize minimumSize)
{
    float mW = minimumSize.width / aspectRatio.width;
    float mH = minimumSize.height / aspectRatio.height;
    if( mH > mW )
        minimumSize.width = minimumSize.height / aspectRatio.height * aspectRatio.width;
    else if( mW > mH )
        minimumSize.height = minimumSize.width / aspectRatio.width * aspectRatio.height;
    return minimumSize;
}


/**
 *  AutolayoutCell
 */
@implementation AutolayoutCell

- (void)awakeFromNib {
    self.contentLabel.numberOfLines = 5;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    // Make sure the contentView does a layout pass here so that its subviews have their frames set, which we
    // need to use to set the preferredMaxLayoutWidth below.
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];

    // Set the preferredMaxLayoutWidth of the mutli-line bodyLabel based on the evaluated width of the label's frame,
    // as this will allow the text to wrap correctly, and as a result allow the label to take on the correct height.
    self.contentLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.contentLabel.frame);
}

- (void)updateConstraints {
    UIImage *image = [UIImage imageNamed:_contentImagePath];
    if (image) {
        CGSize size = CGSizeAspectFit(image.size, CGSizeMake(CGRectGetWidth(self.contentView.frame), 150));
        _imgHeightCons.constant = size.height;
        _imgWidthCons.constant = size.width;
    }else{
        _imgHeightCons.constant = 0;
    }
    [super updateConstraints];
}

@end

/**
 *  AutolayoutTableViewController
 */
@interface AutolayoutTableViewController ()
@property (strong, nonatomic) AutolayoutCell *calcCell;
@property (strong, nonatomic) NSMutableArray *contentTexts;
@property (strong, nonatomic) NSMutableArray *imagePaths;
@end

@implementation AutolayoutTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    int count = 100;
    _contentTexts = [NSMutableArray arrayWithCapacity:count];
    _imagePaths = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i++) {
        if (i % 3 == 0) {
            [_contentTexts addObject:@"[Masonry](https://github.com/Masonry/Masonry)的核心是MASConstraintMaker, 其本质是MASConstraint工厂. 而MASConstraint作为builder负责创建并添加NSLayoutConstraint. MASConstraint使用了Chaining Pattern"];
            [_imagePaths addObject:@""];
        } else if (i % 2 == 0) {
            [_contentTexts addObject:@"The ultimate API for iOS & OS X Auto Layout"];
            [_imagePaths addObject:@"home_pic"];
        } else {
            [_contentTexts addObject:@"WWDC总结：开发者需要知道的iOS 9 SDK新特性|如何搞定Autolayout，远离自动布局带给你的烦恼- 简书"];
            [_imagePaths addObject:@"imager_02"];
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _contentTexts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AutolayoutCell *cell = (AutolayoutCell *)[tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    cell.contentLabel.text = _contentTexts[indexPath.row];
    NSString *imagePath = _imagePaths[indexPath.row];
    cell.contentImagePath = imagePath;
    cell.contentImageView.image = [UIImage imageNamed:imagePath];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_calcCell == nil) {
        _calcCell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    }

    _calcCell.contentLabel.text = _contentTexts[indexPath.row];
    NSString *imagePath = _imagePaths[indexPath.row];
    _calcCell.contentImagePath = imagePath;
    [_calcCell setNeedsUpdateConstraints];
    [_calcCell updateConstraintsIfNeeded];

    _calcCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(_calcCell.bounds));
    [_calcCell setNeedsLayout];
    [_calcCell layoutIfNeeded];

    CGFloat height = [_calcCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;

    // Add an extra point to the height to account for the cell separator, which is added between the bottom
    // of the cell's contentView and the bottom of the table view cell.
    height += 1;
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
