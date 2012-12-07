//
//  YDFriendsTitleCell.m
//  YumDiary
//
//  Created by TRAN LE ANH MY on 1/12/12.
//  Copyright (c) 2012 Open AtoZ. All rights reserved.
//

#import "YDFriendsTitleCell.h"

@interface YDFriendsTitleCell()
@property (nonatomic, readwrite, strong) IBOutlet UIImageView *imageView2;
@end

@implementation YDFriendsTitleCell
@synthesize image = _image;

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.imageView.image = [UIImage imageNamed:@"separator_single_line"];
        UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
        selectedBackgroundView.backgroundColor = [UIColor clearColor];
        self.selectedBackgroundView = selectedBackgroundView;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(55, self.contentView.frame.size.height - 1, 220, 1);
}

- (void)setEnableSeparatorLine:(BOOL)enableSeparatorLine {
    if (enableSeparatorLine) {
        self.imageView.hidden = NO;
    } else {
        self.imageView.hidden = YES;
    }
}

- (void)setImage:(UIImage *)image {
    if (image != self.imageView2.image) {
        _image = image;
        self.imageView2.image = image;
    }
}

- (UIImage *)image {
    return _image;
}
@end
