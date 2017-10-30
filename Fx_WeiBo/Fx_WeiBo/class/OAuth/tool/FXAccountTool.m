//
//  FXAccountTool.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/10/29.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXAccountTool.h"
#import "FXAccount.h"
//宏定义归档目录
#define FXPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"HFX.archiver"]

@implementation FXAccountTool

//存放账号(归档)
+(void)saveAccount:(FXAccount *)account
{

    //归档 是按照一定的数据格式存放数据
    [NSKeyedArchiver archiveRootObject:account toFile:FXPath];


}
//读取(解档)
+(FXAccount *)account
{
  FXAccount *account=  [NSKeyedUnarchiver unarchiveObjectWithFile:FXPath];
  
    NSLog(@"--->%@",FXPath);
    if(account.create_time!=nil)
    {

        long long expires_in =[account.expires_in longLongValue];

        NSDate *expiresTime=[account.create_time dateByAddingTimeInterval:expires_in];
        
        
        //当前时间
        NSDate *now=[NSDate date];


        NSComparisonResult result = [expiresTime compare:now];
        ;
        // NSOrderedAscending = -1L,升序
        
        //    NSOrderedSame,   过期
        //    NSOrderedDescending  降序
        if(result!= NSOrderedDescending)
        { //过期
            return nil;
        }else
        {
            return account;
        }
        
    }
    return nil;

}
@end
