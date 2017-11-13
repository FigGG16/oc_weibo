//
//  FXStatusFrame.h
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/11/13.
//  Copyright © 2017年 FX. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FXStatus;
@interface FXStatusFrame : NSObject

//微博数据
@property(nonatomic,strong)FXStatus *status;
//原创微博的整体
@property(nonatomic,assign)CGRect originalViewF;
//头像
@property(nonatomic,assign)CGRect iconF;
//用户昵称
@property(nonatomic,assign)CGRect nameLabelF;
//时间
@property(nonatomic,assign)CGRect timeLabelF;
//数据来源
@property(nonatomic,assign)CGRect sourceLabelF;
//内容
@property(nonatomic,assign)CGRect contentLabelF;
//vip
@property(nonatomic,assign)CGRect vipView;
//单元格的高度
@property(nonatomic,assign)CGFloat cellHeight;

@end
