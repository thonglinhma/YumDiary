//
//  YDFriendsViewController.m
//  YumDiary
//
//  Created by TRAN LE ANH MY on 13/11/12.
//  Copyright (c) 2012 Open AtoZ. All rights reserved.
//

#import "YDFriendsViewController.h"
#import "YDSearchFriendsViewController.h"
#import "ECSlidingViewController.h"

@interface YDFriendsViewController ()<UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, readwrite, strong) IBOutlet UITableView *tableView;
@end

@implementation YDFriendsViewController
@synthesize searchBar = _searchBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.slidingViewController setAnchorLeftPeekAmount:50.0f];
    self.slidingViewController.underRightWidthLayout = ECVariableRevealWidth;
    //self.searchBar.frame = CGRectMake(0, 0, 320, 100);
    [self.view addSubview:self.searchBar];
    
    //self.searchBar.tintColor = [UIColor colorWithRed:(58.0f/255.0f) green:(67.0f/255.0f) blue:(104.0f/255.0f) alpha:1.0f];
    [[[self.searchBar subviews] objectAtIndex:0] removeFromSuperview];
    self.searchBar.backgroundColor = [UIColor clearColor];
    self.searchBar.placeholder = NSLocalizedString(@"Search for friends", @"");
    [self.searchBar setSearchFieldBackgroundImage:[[UIImage imageNamed:@"searchTextBkg"]
                                                   resizableImageWithCapInsets:UIEdgeInsetsMake(16.0f, 17.0f, 16.0f, 17.0f)]
                                         forState:UIControlStateNormal];
    [self.searchBar setImage:[UIImage imageNamed:@"searchBarIcon"]
            forSearchBarIcon:UISearchBarIconSearch
                       state:UIControlStateNormal];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.searchBar sizeToFit];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - UITableViewDelegate


#pragma Public methods

- (void)setSearchBar:(UISearchBar *)searchBar {
    if (searchBar != _searchBar) {
        _searchBar = searchBar;
    }
}

- (UISearchBar *)searchBar {
    return _searchBar;
}


@end
