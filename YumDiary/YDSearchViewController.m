//
//  YDSearchViewController.m
//  YumDiary
//
//  Created by TRAN LE ANH MY on 13/11/12.
//  Copyright (c) 2012 Open AtoZ. All rights reserved.
//

#import "YDSearchViewController.h"
#import "YDSettingsViewController.h"
#import "YDFriendsViewController.h"
#import "ECSlidingViewController.h"

@interface YDSearchViewController ()
@property (nonatomic, readwrite, strong) IBOutlet UINavigationBar *navigationBar;

- (void)setupNavigationBar;

- (IBAction)revealSetingsAction:(id)sender;
- (IBAction)revealFriendsAction:(id)sender;
@end

@implementation YDSearchViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // shadowPath, shadowOffset, and rotation is handled by ECSlidingViewController.
    // You just need to set the opacity, radius, and color.
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[YDSettingsViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsIdentifier"];
    }
    
    if (![self.slidingViewController.underRightViewController isKindOfClass:[YDFriendsViewController class]]) {
        self.slidingViewController.underRightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FriendsIdentifier"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    [self.slidingViewController anchorTopViewTo:ECRight];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setupNavigationBar];
}

#pragma mark - Private methods

- (void)setupNavigationBar {
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_search_bkg"] forBarMetrics:UIBarMetricsDefault];
    UIButton *settingsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    settingsButton.frame = CGRectMake(0, 0, 35, 35);
    [settingsButton setBackgroundImage:[UIImage imageNamed:@"settings_button"] forState:UIControlStateNormal];
    [settingsButton setBackgroundImage:[UIImage imageNamed:@"settings_button"] forState:UIControlStateHighlighted];
    [settingsButton addTarget:self action:@selector(revealSetingsAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *friendsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    friendsButton.frame = CGRectMake(0, 0, 35, 35);
    [friendsButton setBackgroundImage:[UIImage imageNamed:@"friends_button"] forState:UIControlStateNormal];
    [friendsButton setBackgroundImage:[UIImage imageNamed:@"friends_button"] forState:UIControlStateHighlighted];
    [friendsButton addTarget:self action:@selector(revealFriendsAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:settingsButton];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:friendsButton];
    
    UINavigationItem *navigationItem = [[UINavigationItem alloc] init];
    navigationItem.leftBarButtonItem = leftButton;
    navigationItem.rightBarButtonItem = rightButton;
    navigationItem.hidesBackButton = YES;
    [self.navigationBar pushNavigationItem:navigationItem animated:NO];
}

- (IBAction)revealSetingsAction:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECRight];
}


- (IBAction)revealFriendsAction:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECLeft];
}


@end
