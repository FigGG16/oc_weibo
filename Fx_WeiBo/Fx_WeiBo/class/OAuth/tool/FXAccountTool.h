//
//  FXAccountTool.h
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/10/29.
//  Copyright © 2017年 FX. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FXAccount;
//处理账号有关的所有操作(存，读取，验证账号是否过期)
@interface FXAccountTool : NSObject
//存放账号
+(void)saveAccount:(FXAccount *)account;
//读取
+(FXAccount *)account;

@end
