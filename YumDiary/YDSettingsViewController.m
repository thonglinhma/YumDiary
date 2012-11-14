//
//  YDSettingsViewController.m
//  YumDiary
//
//  Created by TRAN LE ANH MY on 13/11/12.
//  Copyright (c) 2012 Open AtoZ. All rights reserved.
//

#import "YDSettingsViewController.h"
#import "ECSlidingViewController.h"
#import "BadgedLauncherButtonView.h"
#import "NimbusLauncher.h"
#import "AppDelegate.h"

@interface YDSettingsViewController ()
- (IBAction)logOutAction:(id)sender;
- (IBAction)launcherButtonAction:(UIButton *)button;
@end

@implementation YDSettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.slidingViewController setAnchorRightRevealAmount:270.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
    
}

- (void)viewDidUnload {
     [super viewDidUnload];
}


#pragma mark - IBActions

- (IBAction)logOutAction:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate logOut];
}

- (IBAction)launcherButtonAction:(UIButton *)button {
    
     NSString *identifier  = @"HomeIdentifier";
    
    if (button.tag == 3) {
         identifier = @"SearchIdentifier";
    }
    
    UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    
    [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = newTopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
        [self.slidingViewController resetTopView];
    }];
}

@end
