//
//  AppDelegate_iPhone.m
//  NoteIt
//
//  Created by icelorc on 2010/12/17.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import "AppDelegate_iPhone.h"

@implementation AppDelegate_iPhone


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
  _mainViewController = [[NIMainViewController alloc] initWithStyle:UITableViewStylePlain];
  _mapViewController = [[NIMapViewController alloc] initWithNibName:@"NIMapViewController" bundle:nil];
  _calendarViewController = [[NICalendarViewController alloc] initWithSunday:YES];
  
  _calendarViewController.tabBarItem =[[[UITabBarItem alloc] initWithTitle:@"Calendar" image:[UIImage imageNamed:@"Calendar-Month.png"] tag:2] autorelease];
  
  UINavigationController *mainNavigationViewController = [[[UINavigationController alloc] initWithRootViewController:_mainViewController]autorelease];
  UINavigationController *mapNavigationViewController = [[[UINavigationController alloc] initWithRootViewController:_mapViewController] autorelease];
  UINavigationController *calendarNavigationViewController = [[[UINavigationController alloc] initWithRootViewController:_calendarViewController] autorelease];
  
  UITabBarController *tabBarController = [[UITabBarController alloc] init];
  tabBarController.viewControllers = [NSArray arrayWithObjects:mainNavigationViewController, mapNavigationViewController, calendarNavigationViewController, nil];
    // Override point for customization after application launch.
    
  [self.window makeKeyAndVisible];
  [self.window addSubview:tabBarController.view];
  
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.

     Superclass implementation saves changes in the application's managed object context before the application terminates.
     */
	[super applicationDidEnterBackground:application];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of the transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


/**
 Superclass implementation saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
	[super applicationWillTerminate:application];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
    [super applicationDidReceiveMemoryWarning:application];
}


- (void)dealloc {
  [_mapViewController release];
  [_mapViewController release];
  [_calendarViewController release];
	[super dealloc];
}


@end
