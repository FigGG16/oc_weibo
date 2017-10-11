//
//  FXNewFeatureViewController.m
//  Fx_WeiBo
//
//  Created by Apple_Lzzy09 on 2017/10/10.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXNewFeatureViewController.h"

@interface FXNewFeatureViewController ()

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageControl;

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
    
    //make control begcame delagage!
    scroll.delegate=self;
}

#pragma mark 实现代理方法
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
   [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateNormal];
   [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
   
   //设置标题
   [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
   //标题颜色
   [startBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
   

   [imag addSubview:startBtn];
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
