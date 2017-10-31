//
//  FXUser.h
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/10/31.
//  Copyright © 2017年 FX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXUser : NSObject

//idstr;
//name
//
//profile_image_url
@property(nonatomic,copy)NSString *idstr;

@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSString *profile_image_url;

+(instancetype)userWithDict:(NSDictionary *)dict;

@end
