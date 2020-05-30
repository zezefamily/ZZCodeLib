//
//  AppDelegate.m
//  ZZCodeLib
//
//  Created by wenmei on 2020/5/29.
//  Copyright © 2020 wenmei. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self doSth];
    return YES;
}

- (void)doSth
{
    NSSetUncaughtExceptionHandler(&zz_uncaughtException);
}

void zz_uncaughtException(NSException * exception)
{
    NSLog(@"崩溃了");
    CFRunLoopRef runRoop = CFRunLoopGetCurrent();
    CFArrayRef  modesArray = CFRunLoopCopyAllModes(runRoop);
    while (true) {
        for(NSString *mode in (__bridge NSArray *)modesArray){
            CFRunLoopRunInMode((CFStringRef)mode, 0.0001, false);
        }
    }
}




- (void)applicationWillResignActive:(UIApplication *)application
{
    
}
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}



@end
