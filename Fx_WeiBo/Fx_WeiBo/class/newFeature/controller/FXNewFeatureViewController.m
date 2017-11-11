//
//  FXNewFeatureViewController.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/10/10.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXNewFeatureViewController.h"
#import "FXTaBarController.h"
@interface FXNewFeatureViewController ()

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageControl;
//定时器
@property (weak,nonatomic)NSTimer * gTimer;

@end

@implementation FXNewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scroll=[[UIScrollView alloc] init];
    
    //图片数量
    NSInteger imageCount=4;
    //设置大小
    scroll.frame=self.view.bounds;
   

   
    //循环添加image到滚动控制器
    for(int i=0;i<imageCount;i++)
    {
        
        UIImageView *imageV=[[UIImageView alloc] init];
        
        imageV.frame=CGRectMake(i*self.view.width, 0, self.view.width, self.view.height);
        
        NSString *imageName=[NSString stringWithFormat:@"new_feature_%d",i+1];
        
        imageV.image=[UIImage imageNamed:imageName];
        
        //对最后一页进行处理
        if(i==3){
           [self setUpLastImage:imageV];
        }
       
       //添加自己的图片
       if(i==0)
       {
          [self addImage:imageV myImage:@"my_1"];
       }
       
       if(i==1)
          
       {
          [self addImage:imageV myImage:@"my_2"];
       }
       
       
        
        [scroll addSubview:imageV];
        
    }
    //设置滚动范围
    scroll.contentSize=CGSizeMake(imageCount*self.view.width, self.view.height);
    //开启分页
    scroll.pagingEnabled=true;
    
    //去除水平线
    scroll.showsHorizontalScrollIndicator=NO;
    
    //取消弹簧效果
    scroll.bounces=NO;
        [self.view addSubview:scroll];
    
    //实例UIPageControl
    UIPageControl *pageControl=[[UIPageControl alloc] init];
    
    pageControl.frame=CGRectMake(150, 600, 100, 30);
    //分页数量
    pageControl.numberOfPages=imageCount;
    //add pageContol to the view
    [self.view addSubview:pageControl];
    
    //当前颜色
    pageControl.currentPageIndicatorTintColor=[UIColor redColor];
    
    //其余颜色
    pageControl.pageIndicatorTintColor=[UIColor blueColor];
    //关闭交互
    pageControl.userInteractionEnabled=NO;
    
    //强引用控制器
    _scrollView=scroll;
    _pageControl=pageControl;
   
   //开启时钟
   [self createTimer];
   
    //make control begcame delagage!
    scroll.delegate=self;
}

/**
 添加自己的图片到当前的imageView

 @param imag 当前图片的view
 @param image 我的图片名称
 */
-(void)addImage:(UIImageView*)imag   myImage:(NSString *)image
{
   //实例化，设置frame
   UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 300, 200)];
   //添加图片
   imageView.image=[UIImage imageNamed:image];
   //add imageView to the current imageView
   [imag addSubview:imageView];
   
}

#pragma mark - 实现代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //根据偏移量计算
    NSInteger page=(scrollView.contentOffset.x/_scrollView.width+0.5);
    _pageControl.currentPage=page;

}

-(void)changeState:(UIButton *)shareBtn{
   //改变状态
   shareBtn.selected=!shareBtn.isSelected;
}

-(void)setUpLastImage:(UIImageView*)imag
{
   //开启交互
   imag.userInteractionEnabled=TRUE;
   //实例控件
   UIButton *shareBtn=[[UIButton alloc] init];
   shareBtn.frame=CGRectMake(100, 400, 200, 40);
   
   //设置图片
   [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
   
   [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
   
   //设置标题
   [shareBtn setTitle:@"分享微博" forState:UIControlStateNormal];
   //标题颜色
   [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
   //监控点击
   [shareBtn addTarget:self action:@selector(changeState:) forControlEvents:UIControlEventTouchUpInside];
   //添加到image
   [imag addSubview:shareBtn];
   
   //实例控件
   UIButton *startBtn=[[UIButton alloc] init];
   startBtn.frame=CGRectMake(150, 500, 100, 40);
   
   //设置背景图
   [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
   [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
   
   //设置标题
   [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
   //标题颜色
   [startBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
   //跳转标签控制器
   [startBtn addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchUpInside];

   [imag addSubview:startBtn];
}

-(void)startBtnClick
{
   UIWindow *window=[UIApplication sharedApplication].keyWindow;
   
   window.rootViewController=[[FXTaBarController alloc] init];


}

//移除定时器
-(void )removeTimer
{
   [self.gTimer invalidate];
   self.gTimer=nil;
}
//创建定时器
-(void)createTimer
{
   //实例化定时器
   NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(nextPageImage) userInfo:nil repeats:YES];
   //添加到消息循环
   [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
   self.gTimer=timer;
   
}
//下一页
- (void)nextPageImage
{
   //NSLog(@"下一页");
   //防止图片编号溢出
   static int num=0;
   num++;
   num=num%4;
   CGFloat imageViewWidth=self.scrollView.frame.size.width;
   CGPoint point=CGPointMake(imageViewWidth *num,0);
   
   [self.scrollView setContentOffset:point];
   //[self.scrollView setContentOffset:point animated:YES];
   
}
#pragma mark - 将要滚动开始移出定时器
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
   [self removeTimer];
}

#pragma mark - 即将拖拽，停止时钟
-(void)scrollViewBeginDraggin:(UIScrollView *)scrollView
{
   [self.gTimer invalidate];
   self.gTimer=nil;
}

#pragma mark - 拖拽结束,继续定时
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
   [self createTimer];
   
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
