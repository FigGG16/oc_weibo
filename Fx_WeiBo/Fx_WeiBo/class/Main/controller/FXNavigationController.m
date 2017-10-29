//
//  FXNavigationController.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/9/12.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXNavigationController.h"

@interface FXNavigationController ()

@end

@implementation FXNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //返回一个Item对象 并可以对改对象的样式（颜色和形状等）进行设置
    //拿到局部的item
    UIBarButtonItem *item= [UIBarButtonItem appearance];
    //新建字典
    NSMutableDictionary *testDic=[NSMutableDictionary dictionary];
    //根据键值更改颜色
    testDic[NSForegroundColorAttributeName] = [UIColor orangeColor];
    //设置item
    [item setTitleTextAttributes:testDic forState:UIControlStateNormal];
    
    
    //不可点击时
    NSMutableDictionary *disableDic=[NSMutableDictionary dictionary];
    //根据键值更改颜色
    disableDic[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    //没有选中状态的颜色
     [item setTitleTextAttributes:disableDic forState:UIControlStateDisabled];
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //初始化父类方法
    [super pushViewController:viewController animated:animated];
    
    //过滤掉首页的导航按钮
    if(self.viewControllers.count>1)
    {


    //自定义左边按钮
    viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem addItemTarget:self Image:@"navigationbar_back_withtext" selectImage:@"navigationbar_back_withtext_highlighted" action:@selector(back)];

    
    //自定义右边按钮
    viewController.navigationItem.rightBarButtonItem=[UIBarButtonItem addItemTarget:self Image:@"navigationbar_more" selectImage:@"navigationbar_more_highlighted" action:@selector(more)];
    }
}

/**
 导航Item的抽取
 @param image 图片
 @param selImage 选中图片
 @param action 点击事件
 @return   UIBarButtonItem
 */



-(UIBarButtonItem *)addItemImage:(NSString *)image selectImage:(NSString *)selImage action:(SEL)action
{
    UIButton *Btn =[[UIButton alloc] init];
    //设置普通按钮
    [Btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    //设置按钮尺寸
    Btn.frame=CGRectMake(2, 2, 40, 40);
    //设置高亮按钮
    [Btn setImage:[UIImage imageNamed:selImage] forState:UIControlStateHighlighted];
    //自定义UIBarButtonItem按钮
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithCustomView:Btn];
    //添加点击事件
    [Btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    return item;
}

-(void)more
{
    [self popToRootViewControllerAnimated:YES];
}

-(void)back
{
    [self popViewControllerAnimated:YES];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
