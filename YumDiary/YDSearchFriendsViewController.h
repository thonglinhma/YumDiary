//
//  YDSearchFriendsViewController.h
//  YumDiary
//
//  Created by TRAN LE ANH MY on 14/11/12.
//  Copyright (c) 2012 Open AtoZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YDSearchFriendsViewController : UIViewController {
@private
	NSOperationQueue *_searchQueue;
	NSTimer *_timer;
	UIView *_searchBarSuperview;
	NSUInteger _searchBarSuperIndex;
}

@property (nonatomic, readonly) UISearchBar *searchBar;

@end
