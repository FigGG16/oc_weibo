//
//  FXAccount.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/10/29.
//  Copyright © 2017年 FX. All rights reserved.
//
//@property(nonatomic,copy)NSString *access_token;
//@property(nonatomic,copy)NSString *expires_in;
//@property(nonatomic,copy)NSString *uid;
#import "FXAccount.h"

@implementation FXAccount

+(instancetype)accountWithDict:(NSDictionary*)dict
{
    FXAccount *account=[[self alloc] init];
    
    account.access_token=dict[@"access_token"];
    account.expires_in=dict[@"expires_in"];
    account.uid=dict[@"uid"];
    
    
    return account;
}

//按照规定格式存
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
     [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
     [aCoder encodeObject:self.uid forKey:@"uid"];
     [aCoder encodeObject:self.create_time forKey:@"create_time"];
}
//按照规定格式取
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self=[super init];
    
    if(self){
       
        self.access_token=[aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in=[aDecoder decodeObjectForKey:@"expires_in"];
        self.expires_in=[aDecoder decodeObjectForKey:@"uid"];
        self.expires_in=[aDecoder decodeObjectForKey:@"create_time"];

    }
    return self;
}

@end
