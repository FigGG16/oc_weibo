//
//  FXDiscoverViewController.m
//  FX_WB
//
//  Created by Apple_Lzzy09 on 2017/9/11.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXDiscoverViewController.h"
#import "FXSearchBar.h"
@interface FXDiscoverViewController ()
@end

@implementation FXDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //实例化imageView
//    UIImageView *searchIcon=[[UIImageView alloc] init];
//    //添加图片
//    searchIcon.image=[UIImage imageNamed:@"tabbar_discover"];
//    //设置尺寸
//    searchIcon.frame=CGRectMake(0, 0, 30, 30);
//    
//    //实例化TextFile
//    UITextField *textField=[[UITextField alloc] init];
//    //设置尺寸
//    textField.frame=CGRectMake(1, 1, 300, 30);
//    //设置背景颜色
//    textField.backgroundColor=[UIColor redColor];
//    //设置占位文字
//    textField.placeholder=@"请输入搜索条件";
//    
//    //文本编辑时添加清除按钮
//    textField.clearsOnBeginEditing=YES;
//    textField.clearButtonMode=UITextFieldViewModeWhileEditing;
//    
//    //设置图片
//    textField.leftView=searchIcon;
//    textField.leftViewMode=UITextFieldViewModeUnlessEditing;
//    
    //添加到导航栏
    self.navigationItem.titleView=[FXSearchBar addSearchBarImage:@"tabbar_discover" plachHolder:@"请输入搜索条件" frame:CGRectMake(1, 1, 300, 30)];

    // Do any additional setup after loading the view.
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
