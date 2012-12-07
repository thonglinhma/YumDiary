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
#import "YDFriendsTitleCell.h"
#import "YDFriendsSubtitleCell.h"
#import "YDFriendsSummaryCell.h"

static NSInteger const kFriendsSubtitelCellHeight = 52;
static NSInteger const kFriendsTitleCellHeight = 41;
static NSInteger const kFriendsSummaryCellHeight = 92;

static NSString *const kFriendsSubtitleCellIdentifier = @"friendsSubtitleCellIdentifier";
static NSString *const kFriendsTitleCellIdentifier = @"friendsTitleCellIdentifier";
static NSString *const kFriendsSummaryCellIdenifier = @"friendsSummaryCellIdentifier";

@interface YDFriendsViewController ()<UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, readwrite, strong) IBOutlet UITableView *tableView;
@end

@implementation YDFriendsViewController
@synthesize searchBar = _searchBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.slidingViewController setAnchorLeftPeekAmount:45.0f];
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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0 || indexPath.row == 1) {
        YDFriendsSubtitleCell *cell = [tableView dequeueReusableCellWithIdentifier:kFriendsSubtitleCellIdentifier];
        
        switch (indexPath.row) {
            case 0:
                cell.titleLabel.text = @"Contacts";
                cell.subtitleLabel.text = @"Find Friends from your contacts.";
                cell.image = [UIImage imageNamed:@"contact_find_friends_icon"];
                break;
            case 1:
                cell.titleLabel.text = @"Facebook";
                cell.subtitleLabel.text = @"Find Friends from Facebook.";
                cell.image = [UIImage imageNamed:@"fb_find_friends_icon"];
                cell.enableSeparatorLine = NO;
                break;
            default:
                break;
        }
        return cell;
    }
    
    if (indexPath.row == 2) {
        YDFriendsSummaryCell *cell = [tableView dequeueReusableCellWithIdentifier:kFriendsSummaryCellIdenifier];
        return cell;
    }
    
    YDFriendsTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:kFriendsTitleCellIdentifier];
    return cell;
    
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 || indexPath.row == 1) {
        return kFriendsSubtitelCellHeight;
    }
    if (indexPath.row == 2) {
        return kFriendsSummaryCellHeight;
    }
    return kFriendsTitleCellHeight;
}

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
