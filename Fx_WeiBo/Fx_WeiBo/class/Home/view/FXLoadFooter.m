//
//  FXLoadFooter.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/11/7.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXLoadFooter.h"

@implementation FXLoadFooter

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//产生一个xib对象
+(instancetype)footer
{
    return [[NSBundle mainBundle] loadNibNamed:@"FXLoadFooter" owner:nil options:nil].lastObject;

}
@end
