//
//  AppDelegate.m
//  MTAdventure
//
//  Created by eungJin on 6/12/13.
//  Copyright (c) 2013 rollintiger. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import <GoogleMaps/GoogleMaps.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
// In the app delegate we create a constant string to be used as an event name
    
//Set the Parse Tokens
    [Parse setApplicationId:@"IPfqwurj5WNy5EJriFDaWUyqjMxuHRkI3hLFB9om"
                  clientKey:@"OJLyBUwxyvL9yGJPKmSB6N4hUUL9CqbaIjqyAjd4"];
//Set the Analytics from Parse
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
//google maps
    [GMSServices provideAPIKey:@"AIzaSyApNVepHW5klaF66HDtoYdtX367ycTFwT0"];
//test flight
    [TestFlight takeOff:@"22959902-2efb-435d-afa4-9f4dbd914c6f"];
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:(249.0f/255.0f) green:(139.0f/255.0f) blue:(0.0f/255.0f) alpha:1.0f]];
    return YES;
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
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
