//
//  YDFriendsSummaryCell.m
//  YumDiary
//
//  Created by TRAN LE ANH MY on 7/12/12.
//  Copyright (c) 2012 Open AtoZ. All rights reserved.
//

#import "YDFriendsSummaryCell.h"

@implementation YDFriendsSummaryCell

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
        selectedBackgroundView.backgroundColor = [UIColor clearColor];
        self.selectedBackgroundView = selectedBackgroundView;
    }
    return self;
}


@end
