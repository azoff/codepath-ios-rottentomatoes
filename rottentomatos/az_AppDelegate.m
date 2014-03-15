//
//  az_AppDelegate.m
//  rottentomatos
//
//  Created by Jonathan Azoff on 3/13/14.
//  Copyright (c) 2014 Jonathan Azoff. All rights reserved.
//

#import "az_AppDelegate.h"
#import "views/az_BoxOfficeMoviesController.h"
#import "views/az_TopRentalsController.h"

@implementation az_AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSString *nib = @"az_MoviesController";
    
    az_BoxOfficeMoviesController *boxOffice = [[az_BoxOfficeMoviesController alloc] initWithNibName:nib bundle: nil];
    UINavigationController *navBox = [[UINavigationController alloc] initWithRootViewController:boxOffice];
    navBox.navigationBar.barTintColor = [UIColor colorWithRed:220 green:0 blue:0 alpha:1];
    navBox.navigationBar.tintColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.7];
    navBox.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    
    az_TopRentalsController *topRentals = [[az_TopRentalsController alloc] initWithNibName:nib bundle: nil];
    UINavigationController *navRentals = [[UINavigationController alloc] initWithRootViewController:topRentals];
    navRentals.navigationBar.barTintColor = [UIColor colorWithRed:220 green:0 blue:0 alpha:1];
    navRentals.navigationBar.tintColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.7];
    navRentals.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    UITabBarController *tabs = [[UITabBarController alloc] init];
    
    // selected tabs
    tabs.tabBar.tintColor = [UIColor whiteColor];
    id appearence = [UITabBarItem appearance];
    [appearence setTitleTextAttributes: @{ NSForegroundColorAttributeName: [UIColor whiteColor] } forState:UIControlStateSelected];
    
    // unselected tabs
    NSDictionary *pink = @{ NSForegroundColorAttributeName: [UIColor colorWithRed:255 green:255 blue:255 alpha:0.7] };
    [appearence setTitleTextAttributes:pink forState:UIControlStateNormal];
    
    tabs.tabBar.barTintColor = [UIColor colorWithRed:220 green:0 blue:0 alpha:1];
    tabs.viewControllers = [NSArray arrayWithObjects:navBox, navRentals, nil];
    
    self.window.rootViewController = tabs;
    
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
