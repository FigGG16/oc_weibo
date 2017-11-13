//
//  FXStatusFrame.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/11/13.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXStatusFrame.h"

@implementation FXStatusFrame

//重写status的set方法，接收微博数据 根据微博
-(void)setStatus:(FXStatus *)status
{
    _status=status;
    
    _cellHeight=90;
    
    _iconF=CGRectMake(0, 0, 50, 50);
    _nameLabelF=CGRectMake(50, 0, 50, 50);
    
}

@end
