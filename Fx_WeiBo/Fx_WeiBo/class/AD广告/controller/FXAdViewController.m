//
//  FXAdViewController.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/11/11.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXAdViewController.h"
#import "FXTaBarController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

@interface FXAdViewController ()<UIWebViewDelegate>

//加载网络图片

@property (weak, nonatomic) IBOutlet UIImageView *webImage;
//模型

//定时
@property (nonatomic, weak) NSTimer *timer;
//定时Button
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;

@property(nonatomic,strong)UIWebView *webView;

@end

@implementation  FXAdViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 2. 加载广告数据 =>
    [self loadAdData];
    
    
    //3.  创建定时器
    _timer =  [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];

}

//加载我的博客
- (IBAction)loadMyBlog:(id)sender {
    
    //创建一个UIWebView对象
    UIWebView *webView=[[UIWebView alloc]init];
    _webView=webView;
    //frame
    webView.frame=self.view.bounds;
    //把webView作为控制器view的子控件
    [self.view addSubview:webView];
    //urlStr
    NSString *urlStr=@"http://www.huangfeixiang.com";
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
    
    [self.timer invalidate];

    self.timer=nil;
    
}




- (void)loadAdData
{
   
    // 加载广告网页
    [self.webImage sd_setImageWithURL:[NSURL URLWithString:@"http://www.huangfeixiang.com/static/image/TusiJI.jpg"]];

}





// button点击跳转做的事情
- (IBAction)clickJump:(id)sender {
    
    //销毁广告界面,进入主框架界面
    FXTaBarController *tabBarVc = [[ FXTaBarController alloc] init];
    //切换控制器
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVc;
    // 取消定时器
    [_timer invalidate];
    
}

//倒计时
- (void)timeChange
{
    
    // 倒计时
    static int i = 5;
    if (i == 0) {
        [self clickJump:nil];
        i=5;
    }

    // 设置跳转按钮文字
    [_jumpBtn setTitle:[NSString stringWithFormat:@"跳转 (%d)",i] forState:UIControlStateNormal];
        i--;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}



@end
