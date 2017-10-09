//
//  FXTaBarController.m
//  FX_WB
//
//  Created by Apple_Lzzy09 on 2017/9/11.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXTaBarController.h"
#import "FXTaBarController.h"
#import "FXHomeViewController.h"
#import "FXMessageViewController.h"
#import "FXProfileViewController.h"
#import "FXDiscoverViewController.h"

#import "FXNavigationController.h"
#import "FXTabar.h"

@interface FXTaBarController ()<FXTabBarDelegate>

@end

@implementation FXTaBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setValue:[[FXTabar alloc] init] forKey:@"tabBar"];

    FXTabar *plusBtn=[[FXTabar alloc]init];
    
    

    plusBtn.delegate=self;
    
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

}
-(void)addChildWithVC:(UIViewController *)VC Title:(NSString *)title image:(NSString*)image seletedImage:(NSString *)seletedImag
{
    FXNavigationController *nav=[[FXNavigationController alloc]initWithRootViewController:VC];
    //指定背景颜色
    VC.view.backgroundColor=[UIColor yellowColor];
    
    //设置navigationItem标题
    VC.navigationItem.title=title;
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
    
    [self addChildViewController:nav];
}

-(void)clickPlusBtn:(FXTabar *)tabbar
{
    UIViewController *VC=[[UIViewController alloc] init];
    
    VC.view.backgroundColor=[UIColor redColor];
    
//    [self.navigationController pushViewController:VC animated:YES];
    [self presentViewController:VC animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
