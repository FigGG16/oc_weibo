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
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //    步骤：
    //    1.初始化控制器
    //    2.给窗口设置根控制器
    //    3.显示窗口
    
    //    初始化控制器
    self.window=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //实例化taber控制器
    self.taBer=[[FXTaBarController alloc] init];
    
    //实例化各个视图控制器
    FXHomeViewController *homeviewC=[[FXHomeViewController alloc] init];
    
    FXMessageViewController *messageViewC=[[FXMessageViewController alloc]init];
    FXProfileViewController *profileviewC=[[FXProfileViewController alloc]init];
    FXDiscoverViewController *discoverViewC=[[FXDiscoverViewController alloc] init];
    
    //设置控制器参数
    [self addChildWithVC:homeviewC Title:@"首页" image:@"tabbar_home" seletedImage:@"tabbar_home_selected"];
    
    [self addChildWithVC:messageViewC Title:@"消息" image:@"tabbar_message_center" seletedImage:@"tabbar_message_center_selected"];
    
    
    
    [self addChildWithVC:profileviewC Title:@"我" image:@"tabbar_profile" seletedImage:@"tabbar_profile_selected"];
    
    [self addChildWithVC:discoverViewC Title:@"发现" image:@"tabbar_discover" seletedImage:@"tabbar_discover_selected" ];
    



    
    //创建TabBarController，它是程序底部的标签页,是一个容器
    self.window.rootViewController=self.taBer;
    //显示
    [self.window makeKeyAndVisible];
    return YES;
}

/**
 <#Description#>
 
 @param VC UIViewController
 @param title 标题
 @param image 图片名称
 */
-(void)addChildWithVC:(UIViewController *)VC Title:(NSString *)title image:(NSString*)image seletedImage:(NSString *)seletedImag
{

    //指定背景颜色
    VC.view.backgroundColor=[UIColor yellowColor];
    //设置Item标题
    VC.tabBarItem.title=title;
    //设置Item图片
    VC.tabBarItem.image=[UIImage imageNamed:image];
    
    //创建一个字典
    NSMutableDictionary *titleAttri = [NSMutableDictionary dictionary];
    
    //KVO修改颜色
    titleAttri[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    //设置文本颜色
    [VC.tabBarItem setTitleTextAttributes:titleAttri forState:UIControlStateSelected];
    
    
    //渲染选中图片
    VC.tabBarItem.selectedImage=[[UIImage imageNamed:seletedImag] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:VC];
    
    
    [self.taBer addChildViewController:nav];
    
    
    
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
