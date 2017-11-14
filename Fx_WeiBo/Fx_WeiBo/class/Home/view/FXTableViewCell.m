//
//  FXTableViewCell.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/11/13.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXTableViewCell.h"
#import "FXStatusFrame.h"
#import "UIImageView+WebCache.h"
#import "FXUser.h"
#import "FXStatus.h"
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
        //自动换行
        _nameLabel.numberOfLines=0;
        
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

//重写frame 的set方法 给每个控件设置frame 根据微博数据 设置控制器的内容
-(void)setStatusframe:(FXStatusFrame *)statusframe
{

    _statusframe=statusframe;
    
    self.height = _statusframe.cellHeight;
    //设置头像的frame 和数据
    _icon.frame=statusframe.iconF;
    //获得图片的url
    FXUser *user =_statusframe.status.user;
    [_icon sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageNamed:@"avatar_default"]];
    
    //用户昵称frame 数据
    _nameLabel.frame=statusframe.nameLabelF;
    _nameLabel.text=user.name;
    [_nameLabel setFont:cellNameFont];
    
    //设置时间
    _timeLabel.frame=statusframe.timeLabelF;
    _timeLabel.text=_statusframe.status.created_at;
    _timeLabel.font=cellTimeFont;
    //设置来源
    _sourceLabel.frame=_statusframe.sourceLabelF;
    _sourceLabel.text=_statusframe.status.created_at;
    _sourceLabel.font=cellTimeFont;
    _nameLabel.backgroundColor=[UIColor redColor];
    
    //设置正文内容
    _contentLabel.frame = statusframe.contentLabelF;
    _contentLabel.text=statusframe.status.text;
    _contentLabel.font=cellTimeFont;
    _contentLabel.numberOfLines=0;
}

@end
