//
//  FXOauthViewController.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/10/23.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXOauthViewController.h"
#import "AFNetworking.h"
#import "FXTaBarController.h"
#import "FXNewFeatureViewController.h"
#import "MBProgressHUD+MJ.h"
#import "FXAccount.h"
#import "FXAccountTool.h"
@interface FXOauthViewController ()<UIWebViewDelegate>

@end

@implementation FXOauthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个UIWebView对象
    UIWebView *webView=[[UIWebView alloc]init];
    //frame
    webView.frame=self.view.bounds;
    //把webView作为控制器view的子控件
    [self.view addSubview:webView];
    //urlStr
    NSString *urlStr=@"https://api.weibo.com/oauth2/authorize?client_id=116051389&redirect_uri=http://";
    //authorize?授权地址
    //client不能为空
    //redirect_uri 回调地址
    
    //创建url
    NSURL *url=[NSURL URLWithString:urlStr];
    //创建请求对象
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    //发送请求
    [webView loadRequest:request];
    
    webView.delegate=self;
}


-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"正在加载"];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *url = request.URL.absoluteString;
    
    //  截取code令牌
    NSRange range=[url rangeOfString:@"code="];
    
    if(range.length!=0)
    {
       //已授权
        NSInteger fromIndex = range.location+range.length;
        
        NSString *code = [url substringFromIndex:fromIndex];
        
        NSLog(@"XXX%@",code);
        
        [self accessTokrnWithCode:code];
    }


    return YES;
}

//
-(void)accessTokrnWithCode:(NSString *)code{
//https://api.weibo.com/oauth2/access_token
//    post
//    必选	类型及范围	说明
//    client_id	true	string	申请应用时分配的AppKey。
//    client_secret	true	string	申请应用时分配的AppSecret。
//    grant_type	true	string	请求的类型，填写authorization_code
//    
//    grant_type为authorization_code时
//    必选	类型及范围	说明
//    code	true	string	调用authorize获得的code值。
//    redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
    
    //创建一个管理对象
    AFHTTPRequestOperationManager *man=[AFHTTPRequestOperationManager manager];;
    
    //字典包含请求信息
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"client_id"]=@"116051389";
    params[@"client_secret"]=@"cb6aa24ad5c76ceb3d55486abeb18cfe";
    params[@"grant_type"]=@"authorization_code";
    params[@"code"]=code;
    params[@"redirect_uri"]=@"http://";
    
    //post提交
    [man POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        
        FXAccount *account=[FXAccount accountWithDict:responseObject];
        NSLog(@"---account==%@",account.access_token);
        
        
        
        
        [MBProgressHUD hideHUD];
        //获取沙盒路径 并把账号存入沙盒
//        NSString *homePath=NSHomeDirectory();
//        NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//        
//        //拼接文件名
//        NSString *docPath = [doc stringByAppendingPathComponent:@"HFX.plist"];
//        
//        //写入文件
//        [responseObject writeToFile:docPath atomically:YES];
//
        //保存数据
        [FXAccountTool saveAccount:account];
        
        
        
        
        UIWindow *window=[[UIApplication sharedApplication] keyWindow];
        /////////
        
        [window switchRootViewController];
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
         [MBProgressHUD hideHUD];
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    


}




@end
