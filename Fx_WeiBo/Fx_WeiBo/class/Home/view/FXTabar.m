//
//  FXTabar.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/10/9.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXTabar.h"

@implementation FXTabar



-(instancetype)initWithFrame:(CGRect)frame
{
   self= [super initWithFrame:frame];
   
    //添加+号按钮
    UIButton *plusBtn=[[UIButton alloc] init];
    //设置button的frame
    plusBtn.frame=CGRectMake(self.width*0.5-20, 1, 40, 40);
    //普通按钮背景图和图片
    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    
    //高亮按钮背景图和图片
    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    //添加子控件
    [self addSubview:plusBtn];
    //添加监听
    [plusBtn addTarget:self action:@selector(plusBtnClick) forControlEvents:UIControlEventTouchUpInside];

    _plusBtn=plusBtn;

    return self;
}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    //设置button的中间坐标
    _plusBtn.centerX=self.width*0.5;
    _plusBtn.centerY=self.height*0.5;
    
    //获取这个类对象
    Class class = NSClassFromString(@"UITabBarButton");
    //获取屏幕的宽度，并分成五份
    CGFloat tabBarButtonW=self.width/5;
    NSLog(@"tabBarButtonW=%lf",tabBarButtonW);
    
    //临时索引变量
    CGFloat tabBarButtonIndex=0;
    NSInteger count=self.subviews.count;
    
    for(int i=0;i<count;i++)
    {
        //遍历子控件
        UIView *child=self.subviews[i];
        //是否是想要的控件
        if([child isKindOfClass:class]){
          
            //设置控件宽度
            child.width=tabBarButtonW;
            //改变x轴坐标
            child.x=tabBarButtonIndex*tabBarButtonW;
            //
            tabBarButtonIndex++;
            //为+号控件留出空格
            if(tabBarButtonIndex==2)
            {
                tabBarButtonIndex++;
            }
        }
    }
}

//响应button的点击
-(void)plusBtnClick{
    //判断代理方法是否实现
   if([self.delegate respondsToSelector:@selector(clickPlusBtn:)])
   {
       //传递self
       [self.delegate clickPlusBtn:self];
   }
}

@end
