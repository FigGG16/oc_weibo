//
//  FXSearchBar.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/9/25.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXSearchBar.h"

@implementation FXSearchBar

+(UITextField *)addSearchBarImage:(NSString *)image plachHolder:(NSString *)placeHoder frame:(CGRect)frame
{
    //实例化imageView
    UIImageView *searchIcon=[[UIImageView alloc] init];
    //添加图片
    searchIcon.image=[UIImage imageNamed:@"tabbar_discover"];
    //设置尺寸
    searchIcon.frame=CGRectMake(0, 0, frame.size.height, frame.size.height);
    
    //实例化TextFile
    UITextField *textField=[[UITextField alloc] init];
    //设置尺寸
    textField.frame=frame;
    //设置背景颜色
    textField.backgroundColor=[UIColor redColor];
    //设置占位文字
    textField.placeholder=placeHoder;
    
    //设置边框样式
    textField.borderStyle=UITextBorderStyleRoundedRect;
    //文本编辑时添加清除按钮
    textField.clearsOnBeginEditing=YES;
    textField.clearButtonMode=UITextFieldViewModeWhileEditing;
    
    //设置图片
    textField.leftView=searchIcon;
    textField.leftViewMode=UITextFieldViewModeUnlessEditing;
    
    return textField;
}

@end
