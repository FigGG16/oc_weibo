//
//  FXHomeViewController.m
//  FX_WB
//
//  Created by Apple_Lzzy09 on 2017/9/11.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXHomeViewController.h"
#import "FXDropdownView.h"
@interface FXHomeViewController ()

@end

@implementation FXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    //自定义左边按钮
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem addItemTarget:self Image:@"navigationbar_friendsearch" selectImage:@"navigationbar_friendsearch_highlighted" action:@selector(friendSearch)];
    
    //自定义右边按钮
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem addItemTarget:self Image:@"navigationbar_pop" selectImage:@"navigationbar_pop_highlighted" action:@selector(pop)];
    
    //实例化按钮
    UIButton *titleButton=[[UIButton alloc]init];
    //设置尺寸
    titleButton.frame=CGRectMake(1, 1, 100, 40);
    //设置标题
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    //设置颜色
    [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置图片
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateHighlighted];
    
    //设置标题和图片的位置<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>
    titleButton.titleEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 15);
    titleButton.imageEdgeInsets=UIEdgeInsetsMake(0, 70, 0, 0);
    
    //设置button监听
    [titleButton addTarget:self action:@selector(titleButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    //应用到导航栏
    self.navigationItem.titleView=titleButton;
    
}

-(void)titleButtonClick
{
    //实例化button
    UIButton *addButton=[UIButton buttonWithType:UIButtonTypeContactAdd];
    
    //设置Frame
    addButton.frame=CGRectMake(30, 40, addButton.frame.size.width, addButton.frame.size.height);
    //实例化
    FXDropdownView *dropView=[FXDropdownView menu];
    
    //添加控件
    dropView.content=addButton;

    //显示
    [dropView show];

    
//    
//    //实例化ImageView
//    UIView *dropdownView=[[UIView alloc] init];
//    //背景颜色
//    dropdownView.backgroundColor=[UIColor whiteColor];
//
//    //尺寸
//    dropdownView.frame=CGRectMake(0, 64, 375, 300);
//    //实例化button
//    UIButton *addButton=[UIButton buttonWithType:UIButtonTypeContactAdd];
//    
//    //设置Frame
//    addButton.frame=CGRectMake(30, 40, addButton.frame.size.width, addButton.frame.size.height);
//    //往图片添加Button
//    [dropdownView addSubview:addButton];
//    
//    //获取window数组，再取出最后一个数组对象(window)
//    UIWindow *window=[[UIApplication sharedApplication].windows lastObject];
//    
//    //添加蒙版
//    UIView *cover=[[UIView alloc]initWithFrame:window.bounds];
//    //背景透明
//    cover.backgroundColor=[UIColor clearColor];
//    //添加子控件
//    [cover addSubview:dropdownView];
//
//    //添加到Window
//    [window addSubview:cover];
    
}



-(void)friendSearch
{

}

-(void)pop
{

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
