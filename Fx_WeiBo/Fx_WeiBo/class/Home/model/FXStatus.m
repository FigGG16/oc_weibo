//
//  FXStatus.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/10/31.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXStatus.h"
#import "FXUser.h"
@implementation FXStatus

+(instancetype)statusWithDict:(NSDictionary *)dict
{
    FXStatus *status=[[self alloc ] init];
    
    status.idstr=dict[@"idstr"];
    status.text=dict[@"text"];
    
    status.user = [FXUser userWithDict:dict[@"user"]];
    return status;
}

@end
