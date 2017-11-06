//
//  FXStatus.h
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/10/31.
//  Copyright © 2017年 FX. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FXUser;
@interface FXStatus : NSObject

@property(nonatomic,copy)NSString *idstr;


@property(nonatomic,copy)NSString *text;
//微博user属性
@property(nonatomic,strong)FXUser *user;


+(instancetype)statusWithDict:(NSDictionary *)dict;

@end
