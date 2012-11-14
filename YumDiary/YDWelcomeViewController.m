//
//  YDWelcomeViewController.m
//  YumDiary
//
//  Created by TRAN LE ANH MY on 13/11/12.
//  Copyright (c) 2012 Open AtoZ. All rights reserved.
//

#import "YDWelcomeViewController.h"
#import "YDInitialSlidingViewController.h"
#import "AppDelegate.h"

@interface YDWelcomeViewController ()
- (IBAction)skipAction:(id)sender;
- (IBAction)registerAction:(id)sender;
@end

@implementation YDWelcomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


#pragma mark - IBActions

- (IBAction)skipAction:(id)sender {

   [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:NO];
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate presentInitialSlidingViewController];
}

- (IBAction)registerAction:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate openSessionWithAllowLoginUI:YES];
}

@end
