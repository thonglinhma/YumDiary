//
//  YDInitialSlidingViewController.m
//  YumDiary
//
//  Created by TRAN LE ANH MY on 13/11/12.
//  Copyright (c) 2012 Open AtoZ. All rights reserved.
//

#import "YDInitialSlidingViewController.h"

@interface YDInitialSlidingViewController ()

@end

@implementation YDInitialSlidingViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeIdentifier"];
}

@end
