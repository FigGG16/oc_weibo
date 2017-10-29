//
//  UIBarButtonItem+Extension.h
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/9/19.
//  Copyright © 2017年 FX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+(UIBarButtonItem *)addItemTarget:(id)target Image:(NSString *)image selectImage:(NSString *)selImage action:(SEL)action;

@end
