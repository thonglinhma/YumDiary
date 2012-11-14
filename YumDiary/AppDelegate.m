//
//  AppDelegate.m
//  YumDiary
//
//  Created by TRAN LE ANH MY on 13/11/12.
//  Copyright (c) 2012 Open AtoZ. All rights reserved.
//

#import "AppDelegate.h"
#import "YDWelcomeViewController.h"
#import "YDInitialSlidingViewController.h"

@interface AppDelegate()
@property (nonatomic, readwrite, strong) UINavigationController *navController;

- (void)setupAppearance;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Set up our app's global UIAppearance
    [self setupAppearance];
    
    self.navController = (UINavigationController *)self.window.rootViewController;
    
    // See if we have a valid token for the current state.
    if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
        // To-do, show logged in view
    } else {
        // No, display the login page.
    }
    
    // Override point for customization after application launch.
    return YES;
}

- (void)sessionStateChanged:(FBSession *)session
                      state:(FBSessionState)state
                      error:(NSError *)error {
    switch (state) {
        case FBSessionStateOpen: {
            /*[self.mainViewController startLocationManager];
            if (self.loginViewController != nil) {
                UIViewController *topViewController = [self.navController topViewController];
                [topViewController dismissModalViewControllerAnimated:YES];
                self.loginViewController = nil;
            }*/
            
            // FBSample logic
            // Pre-fetch and cache the friends for the friend picker as soon as possible to improve
            // responsiveness when the user tags their friends.
            FBCacheDescriptor *cacheDescriptor = [FBFriendPickerViewController cacheDescriptor];
            [cacheDescriptor prefetchAndCacheForSession:session];
        }
            break;
        case FBSessionStateClosed: {
            // FBSample logic
            // Once the user has logged out, we want them to be looking at the root view.
            /*UIViewController *topViewController = [self.navController topViewController];
            UIViewController *modalViewController = [topViewController modalViewController];
            if (modalViewController != nil) {
                [topViewController dismissModalViewControllerAnimated:NO];
            }*/
            //[self.navController popToRootViewControllerAnimated:NO];
            
            [FBSession.activeSession closeAndClearTokenInformation];
            
            [self performSelector:@selector(showLoginView)
                       withObject:nil
                       afterDelay:0.5f];
        }
            break;
        case FBSessionStateClosedLoginFailed: {
            // if the token goes invalid we want to switch right back to
            // the login view, however we do it with a slight delay in order to
            // account for a race between this and the login view dissappearing
            // a moment before
            [self performSelector:@selector(showLoginView)
                       withObject:nil
                       afterDelay:0.5f];
        }
            break;
        default:
            break;
    }
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:SCSessionStateChangedNotification
    //                                                    object:session];
    
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Error: %@",
                                                                     [AppDelegate FBErrorCodeDescription:error.code]]
                                                            message:error.localizedDescription
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
    }
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    // FBSample logic
    // We need to handle URLs by passing them to FBSession in order for SSO authentication
    // to work.
    return [FBSession.activeSession handleOpenURL:url];
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [FBSession.activeSession handleDidBecomeActive];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [FBSession.activeSession close];
}

#pragma mark - Private methods

- (void)setupAppearance {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];    
}

#pragma mark - Public methods

- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI {
    return [FBSession openActiveSessionWithReadPermissions:nil
                                              allowLoginUI:allowLoginUI
                                         completionHandler:^(FBSession *session, FBSessionState state, NSError *error) {
                                             [self sessionStateChanged:session state:state error:error];
                                         }];
}

- (void)presentInitialSlidingViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    YDInitialSlidingViewController *initialSlidingViewController =  [storyboard instantiateViewControllerWithIdentifier:@"InitialSlidingIdentifier"];
    [self.navController pushViewController:initialSlidingViewController animated:NO];
}

- (void)logOut {
    // clear cache
    [[YDCache sharedCache] clear];
    
    // clear out cached data, view controllers, etc
    [self.navController popToRootViewControllerAnimated:YES];
}

+ (NSString *)FBErrorCodeDescription:(FBErrorCode) code {
    switch(code){
        case FBErrorInvalid :{
            return @"FBErrorInvalid";
        }
        case FBErrorOperationCancelled:{
            return @"FBErrorOperationCancelled";
        }
        case FBErrorLoginFailedOrCancelled:{
            return @"FBErrorLoginFailedOrCancelled";
        }
        case FBErrorRequestConnectionApi:{
            return @"FBErrorRequestConnectionApi";
        }case FBErrorProtocolMismatch:{
            return @"FBErrorProtocolMismatch";
        }
        case FBErrorHTTPError:{
            return @"FBErrorHTTPError";
        }
        case FBErrorNonTextMimeTypeReturned:{
            return @"FBErrorNonTextMimeTypeReturned";
        }
        case FBErrorNativeDialog:{
            return @"FBErrorNativeDialog";
        }
        default:
            return @"[Unknown]";
    }
}

@end
