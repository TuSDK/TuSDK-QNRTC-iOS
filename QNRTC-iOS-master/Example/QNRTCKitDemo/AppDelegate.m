//
//  AppDelegate.m
//  QNRTCKitDemo
//
//  Created by lawder on 2017/10/16.
//  Copyright © 2017年 Pili Engineering, Qiniu Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "QRDLoginViewController.h"
#import <QNRTCKit/QNRTCKit.h>
#import <Bugsnag.h>

// TuSDK mark
#import <TuSDKManager.h>

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [Bugsnag startBugsnagWithApiKey:@"5c557cf459b88bd2726b2055530eac91"];
    
    QRDLoginViewController *loginVC = [[QRDLoginViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:loginVC];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];

    [QNRTCEngine enableFileLogging];
    
    // TuSDK mark - 初始化 TuSDK
    // 可选: 设置日志输出级别 (默认不输出)
    [TuSDKPulseCore setLogLevel:lsqLogLevelDEBUG];
    [[TuSDKManager sharedManager] initSdkWithAppKey:@"8ba12ec5cf15143e-03-bshmr1"];
    [TUPEngine Init:nil];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
