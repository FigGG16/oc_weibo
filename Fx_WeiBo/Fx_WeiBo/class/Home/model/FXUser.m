//
//  FXUser.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/10/31.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXUser.h"

@implementation FXUser


+(instancetype)userWithDict:(NSDictionary *)dict
{
    FXUser *user=[[self alloc] init];
    
    user.name=dict[@"name"];
    user.profile_image_url=dict[@"profile_image_url"];
    user.idstr=dict[@"idstr"];
    
    return user;
}



@end
