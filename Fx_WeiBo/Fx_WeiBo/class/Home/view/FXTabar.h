//
//  FXTabar.h
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/10/9.
//  Copyright © 2017年 FX. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FXTabar;
//声明协议
@protocol FXTabBarDelegate <NSObject>

- (void)clickPlusBtn:(FXTabar *)tabbar;

@end



@interface FXTabar : UITabBar

@property(nonatomic,strong)UIButton *plusBtn;

@property(nonatomic,weak)id<FXTabBarDelegate> delegate;
@end
