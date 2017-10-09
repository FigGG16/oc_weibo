//
//  FXDropdownView.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/9/26.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXDropdownView.h"

@implementation FXDropdownView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        //实例化View
        UIView *dropdownView=[[UIView alloc] init];
        
        //背景颜色
        dropdownView.backgroundColor=[UIColor whiteColor];
        
        //尺寸
        dropdownView.frame=CGRectMake(0, 64,[UIScreen mainScreen].bounds.size.width, 300);
        
        //强引用
        _dropView=dropdownView;
        
        [self addSubview:dropdownView];
    }
    return self;
}

//返回一个UIView对象
+(instancetype)menu
{
    return [[self alloc] init];
}

//显示下拉菜单
-(void)show
{
    //获取window数组，再取出最后一个数组对象(window)
    UIWindow *window=[[UIApplication sharedApplication].windows lastObject];
    
    [window addSubview:self];
    
    //设置尺寸
    self.frame=window.bounds;
}
//重写setContent的Set方法，接受外界传入的控件，并显示到下拉菜单
-(void)setContent:(UIView *)content{
   
    _content=content;
    [self.dropView addSubview:_content];

}
//重写dropView的get方法，用来加载外界传入的控件
-(UIView *)dropView{
  
    if(_dropView == nil){
    
        _dropView = [[UIView alloc] init];
    }
    return _dropView;
}

//当触摸控制器view时调用
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self removeFromSuperview];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
