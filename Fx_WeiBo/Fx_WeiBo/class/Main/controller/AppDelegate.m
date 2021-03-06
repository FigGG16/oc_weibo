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
#import "FXOauthViewController.h"
#import "FXAccountTool.h"
#import "FXAdViewController.h"

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
   
    FXAccount *account=[FXAccountTool account];
    
      //必须提前指定根控制器
      [self.window makeKeyAndVisible];
    //如果账号存在
    if(account)
    {
        [self.window switchRootViewController];
        
    }else
    {
        
        self.window.rootViewController=[[FXOauthViewController alloc] init];
        
    }



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

//进入后台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
    
    FXAdViewController *adVC=[[FXAdViewController alloc] init];
    
    self.window.rootViewController=adVC;
}

//进入前台
- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
