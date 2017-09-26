//
//  FXDropdownView.h
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/9/26.
//  Copyright © 2017年 FX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FXDropdownView : UIView
//下拉菜单属性
@property(nonatomic,strong)UIView * dropView;
////下拉内容属性
@property(nonatomic,strong)UIView * content;

+(instancetype)menu;

-(void)show;
@end
