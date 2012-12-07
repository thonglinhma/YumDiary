//
//  YDFriendsTitleCell.h
//  YumDiary
//
//  Created by TRAN LE ANH MY on 1/12/12.
//  Copyright (c) 2012 Open AtoZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YDFriendsTitleCell : UITableViewCell
@property (nonatomic, readwrite, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, readwrite, strong) UIImage *image;
@property (nonatomic, readwrite, assign) BOOL enableSeparatorLine;
@end
