//
//  FXAccount.h
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/10/29.
//  Copyright © 2017年 FX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXAccount : NSObject<NSCoding>

@property(nonatomic,copy)NSString *access_token;
@property(nonatomic,copy)NSString *expires_in;
@property(nonatomic,copy)NSString *uid;
@property(nonatomic,copy)NSDate * create_time;

+(instancetype)accountWithDict:(NSDictionary*)dict;
@end
