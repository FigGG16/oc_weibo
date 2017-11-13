//
//  FXTableViewCell.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/11/13.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXTableViewCell.h"

@implementation FXTableViewCell



+(instancetype )cellWithTableView:(UITableView *)tableView
{
   static NSString *ID=@"FX";
    
    //创建方法，并实现封装
    FXTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
   
    if(cell == nil)
    {   //不能让系统创建UITableViewCellStyleSubtitle 方法，要进行拦截
        //重写这个方法
        cell=[[FXTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
      
    return cell;
}

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
   
    if(self){
       
        //原创微博的整体
       _originalView=[[UIView alloc] init];
       [self.contentView addSubview:_originalView];
                      
        //头像   //添加以下控件到原创微博整体上
       _icon=[[UIImageView alloc] init];
        [_originalView addSubview:_icon];
                             
        //用户昵称
       _nameLabel=[[UILabel alloc] init];
        [_originalView addSubview:_nameLabel];
                             
        //时间
       _timeLabel=[[UILabel alloc] init];
        [_originalView addSubview:_timeLabel];
        
        //数据来源
       _sourceLabel=[[UILabel alloc] init];
        [_originalView addSubview:_sourceLabel];
        
        //内容
       _contentLabel=[[UILabel alloc] init];
        [_originalView addSubview:_contentLabel];
        
        //vip
       _vipView=[[UIImageView alloc] init];
        [_originalView addSubview:_vipView];
    }
    return self;
}


//重写frame 的set方法 给每个控件设置frame
-(void)setStatusframe:(FXStatusFrame *)statusframe
{
    _statusframe=statusframe;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
