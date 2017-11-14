//
//  FXStatusFrame.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/11/13.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXStatusFrame.h"
#import "FXStatus.h"
#import "FXUser.h"

#define cellMargin 10

@implementation FXStatusFrame

//根据传入的字符串 计算字符串的宽和高
-(CGSize)sizeWithText:(NSString *)text Font:(UIFont *)font maxW:(CGFloat)maxW
{
    //带属性的字符串
    NSMutableDictionary *atts =[NSMutableDictionary dictionary];
    atts[NSFontAttributeName] = font;
    
    //计算时不会超过 maxW height  MAXFLOAT表示计算文本高度 不做任何要求
    CGSize MaxSize= CGSizeMake(maxW, MAXFLOAT);
    return [text boundingRectWithSize:MaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:atts context:nil].size;
}
-(CGSize)sizeWithText:(NSString *)text Font:(UIFont *)font{

    return [self sizeWithText:text Font:font maxW:MAXFLOAT];
}



//重写status的set方法，接收微博数据 根据微博
-(void)setStatus:(FXStatus *)status
{
    _status=status;
    
    
    //头像的frame
    CGFloat iconX=cellMargin;
    CGFloat iconY=cellMargin;
    CGFloat iconWH=50;
    self.iconF=CGRectMake(iconX, iconY, iconWH, iconWH);
    


    
    //用户昵称
    FXUser *user=status.user;
    CGFloat nameX=CGRectGetMaxX(_iconF)+cellMargin;
    CGFloat nameY=iconX;
    CGSize nameSize=[self sizeWithText:user.name Font:cellNameFont];
//    self.nameLabelF=CGRectMake(nameX, nameY, nameSize.width,nameSize.height);
    //以上写法都一样
    self.nameLabelF=(CGRect){{nameX,nameY},nameSize};
    
    //设置时间
    CGFloat timeX=nameX;
    CGFloat timeY=CGRectGetMaxY(_nameLabelF)+cellMargin;
    
     CGSize timeSize=[self sizeWithText:_status.created_at Font:cellTimeFont];
   _timeLabelF=(CGRect){{timeX,timeY},timeSize};
   
    //设置来源
    
    CGFloat sourceX=CGRectGetMaxX(_timeLabelF)+cellMargin;
    CGFloat sourceY=timeY;
    CGSize  sourceSize=[self sizeWithText:_status.created_at Font:cellTimeFont];
    _sourceLabelF=(CGRect){{sourceX,sourceY},sourceSize};
    
    //设置正文
    CGFloat contentX=iconX;
    CGFloat contentY=MAX(CGRectGetMaxY(_iconF), CGRectGetMaxY(_timeLabelF)+cellMargin);
    CGFloat cellW=[UIScreen mainScreen].bounds.size.width;
    CGFloat contentMaxW=cellW-2*cellMargin;
    
    CGSize contentSize=[self sizeWithText:status.text Font:cellTimeFont maxW:contentMaxW];
    
    _contentLabelF=(CGRect){{contentX,contentY},contentSize};
    
    
    //原创微博的cell的高度
    //自动计算微博的高度
    _originalViewF=CGRectMake(0, 0,cellW , CGRectGetMaxY(_contentLabelF)+cellMargin);
    
    //cell的高度
    _cellHeight=CGRectGetMaxY(self.originalViewF);
}

@end
