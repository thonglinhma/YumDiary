//
//  YDSearchFriendsViewController.m
//  YumDiary
//
//  Created by TRAN LE ANH MY on 14/11/12.
//  Copyright (c) 2012 Open AtoZ. All rights reserved.
//

#import "YDSearchFriendsViewController.h"
#import "ECSlidingViewController.h"

@interface YDSearchFriendsViewController ()<UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate>
@property (nonatomic, readwrite, strong) UISearchDisplayController *searchDisplayController;
@end

@implementation YDSearchFriendsViewController
@synthesize searchDisplayController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:[[UISearchBar alloc] init] contentsController:self];
		searchDisplayController.delegate = self;
		searchDisplayController.searchResultsDataSource = self;
		searchDisplayController.searchResultsDelegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UISearchDisplayDelegate

- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller {
    _searchBarSuperview = self.searchBar.superview;
    _searchBarSuperIndex = [_searchBarSuperview.subviews indexOfObject:self.searchBar];
    
    [self.searchBar removeFromSuperview];
    [self.view addSubview:self.searchBar];
    [self.searchBar sizeToFit];
    [self.searchBar setShowsCancelButton:YES animated:YES];
    
    [self.slidingViewController anchorTopViewOffScreenTo:ECLeft animations:^{
        CGRect frame = self.view.frame;
        frame.origin.x = 0.0f;
        if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
            frame.size.width = [UIScreen mainScreen].bounds.size.height;
        } else if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
            frame.size.width = [UIScreen mainScreen].bounds.size.width;
        }
        self.view.frame = frame;
    } onComplete:nil];
}

- (void)searchDisplayController:(UISearchDisplayController *)controller didShowSearchResultsTableView:(UITableView *)tableView {
	tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	tableView.backgroundColor = [UIColor clearColor];
	tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	[self.view addSubview:searchDisplayController.searchResultsTableView];
	[searchDisplayController.searchResultsTableView reloadData];
}

- (void)searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller {
    [self.slidingViewController anchorTopViewTo:ECLeft animations:^{
        CGRect frame = self.view.frame;
        frame.origin.x = 50.0f;
        if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
            frame.size.width = [UIScreen mainScreen].bounds.size.height - 50.0f;
        } else if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
            frame.size.width = [UIScreen mainScreen].bounds.size.width - 50.0f;
        }
        self.view.frame = frame;
    } onComplete:^{
        [self.searchBar resignFirstResponder];
        [self.searchBar removeFromSuperview];
        self.searchBar.showsCancelButton = NO;
        [_searchBarSuperview insertSubview:self.searchBar atIndex:_searchBarSuperIndex];
        _searchBarSuperview = nil;
    }];
}

#pragma mark - Public methods

- (UISearchBar *)searchBar {
	return searchDisplayController.searchBar;
}

@end
