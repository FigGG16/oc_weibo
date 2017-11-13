//
//  FXTableViewCell.h
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/11/13.
//  Copyright © 2017年 FX. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FXStatusFrame;
//将所有可能显示的控件，放到contentView
@interface FXTableViewCell : UITableViewCell

//设置frame模型
@property(nonatomic,strong)FXStatusFrame *statusframe;
//原创微博的整体
@property(nonatomic,strong)UIView *originalView;
//头像
@property(nonatomic,strong)UIImageView *icon;
//用户昵称
@property(nonatomic,strong)UILabel *nameLabel;
//时间
@property(nonatomic,strong)UILabel *timeLabel;
//数据来源
@property(nonatomic,strong)UILabel *sourceLabel;
//内容
@property(nonatomic,strong)UILabel *contentLabel;
//vip
@property(nonatomic,strong)UIImageView *vipView;

//parms单元格重用
+(instancetype )cellWithTableView:(UITableView *)tableView;

@end
