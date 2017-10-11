//
//  AppDelegate.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/9/12.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "AppDelegate.h"
#import "FXTaBarController.h"
#import "FXHomeViewController.h"
#import "FXMessageViewController.h"
#import "FXProfileViewController.h"
#import "FXDiscoverViewController.h"
#import "FXNewFeatureViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //    步骤：
    //    1.初始化控制器
    //    2.给窗口设置根控制器
    //    3.显示窗口
    FXLog(@"feixiang");
    //    初始化控制器
    self.window=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //实例化taber控制器
    FXTaBarController * taBer=[[FXTaBarController alloc] init];

    //创建TabBarController，它是程序底部的标签页,是一个容器
    self.window.rootViewController=[[FXNewFeatureViewController alloc] init];
    //显示
    [self.window makeKeyAndVisible];
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
