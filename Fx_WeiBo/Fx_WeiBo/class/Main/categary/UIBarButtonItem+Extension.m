//
//  UIBarButtonItem+Extension.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/9/19.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+(UIBarButtonItem *)addItemTarget:(id)target Image:(NSString *)image selectImage:(NSString *)selImage action:(SEL)action
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
    [Btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return item;
}

@end
