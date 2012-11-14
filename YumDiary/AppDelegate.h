//
//  AppDelegate.h
//  YumDiary
//
//  Created by TRAN LE ANH MY on 13/11/12.
//  Copyright (c) 2012 Open AtoZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI;
- (void)presentInitialSlidingViewController;

- (void)logOut;

+ (NSString *)FBErrorCodeDescription:(FBErrorCode) code;

@end
