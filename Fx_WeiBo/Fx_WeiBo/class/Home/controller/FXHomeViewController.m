//
//  FXHomeViewController.m
//  FX_WB
//
//  Created by Apple_Lzzy09 on 2017/9/11.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXHomeViewController.h"
#import "FXDropdownView.h"
#import"AFNetworking.h"
#import "FXAccount.h"
#import "FXAccountTool.h"
#import "UIImageView+WebCache.h"
#import "FXStatus.h"
#import "FXUser.h"
#import "FXLoadFooter.h"
#import "MJExtension.h"
#import "FXTableViewCell.h"
#import "FXStatusFrame.h"
@interface FXHomeViewController ()<UIScrollViewDelegate>

@end

@implementation FXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpabuttonItem];
    //请求信息，获取用户数据
//    [self setUpUserInf];
    
    self.tableView.delegate = self;

    //下拉刷新
    [self setUpRefershStatus];
    
    //上拉刷新
    [self setUpFooter];
    //设置一个定时器 每隔一段时间向新浪服务器请求未读的微博数
    NSTimer *timer= [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(setUnreadCount) userInfo:nil repeats:YES];
    
    //让主线程分出一点时间处理定时器
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}



-(void)setUpFooter
{
    FXLoadFooter *foot=[FXLoadFooter footer];
    self.tableView.tableFooterView=foot;

}
//上拉拉刷新的监听方法
#warning 未实现


-(void)setUnreadCount
{
    //创建一个账号模型
    FXAccount *account=[FXAccountTool account];
    
    //创建一个管理对象
    AFHTTPRequestOperationManager *man=[AFHTTPRequestOperationManager manager];
    //从模型中取出请求信息
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    
    //存到字典
    params[@"access_token"]=account.access_token;
    params[@"uid"]=account.uid;
//发送get请求
    [man GET:@"https://rm.api.weibo.com/2/remind/unread_count.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {

        
        //赋值未读数
        NSString *status=[responseObject[@"status"] description];
        
        if([status isEqualToString:@"0"])
        {
            self.tabBarItem.badgeValue=nil;
        }else
        {
            self.tabBarItem.badgeValue=status;
        }
    
//     self.tabBarItem.badgeValue= [responseObject[@"status"] stringValue];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败%@",error);
    }];
}


//此方法可以改变背景颜色
-(void)viewWillAppear:(BOOL)animated
{


}

//下拉刷新方法
-(void)setUpRefershStatus
{
//刷新控件
    UIRefreshControl *control=[[UIRefreshControl alloc] init];
    _control=control;
    [self.tableView addSubview:control];
    //开启刷新
//    [control beginRefreshing];
    
    //实现监听方法
    [control addTarget:self action:@selector(refershStatusChange:) forControlEvents:UIControlEventValueChanged];
    
    //程序一启动就进行刷新
    [self refershStatusChange:control];
}

//下拉刷新的监听方法
-(void)refershStatusChange:(UIRefreshControl *)control
{
    //https://api.weibo.com/2/statuses/home_timeline.json
    
    //创建一个账号模型
    FXAccount *account=[FXAccountTool account];
    
    //创建一个管理对象
    AFHTTPRequestOperationManager *man=[AFHTTPRequestOperationManager manager];
    //从模型中取出请求信息
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    //存到字典
    params[@"access_token"]=account.access_token;
    //    params[@"count"]=@1;
 
#warning 有咋
    //加载最新微博(解决重复包含)
    FXStatusFrame *first   = [self.statusesFrame firstObject];

    if(first!=nil)
    {
          params[@"since_id"]=first.status.idstr;
    }

    
    //发送get请求
    [man GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //第三方框架快速转模型
        NSArray *newStatus= [FXStatus objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        
        //将微博模型转化为frame模型
        NSMutableArray *frames=[NSMutableArray array];
        for(FXStatus *status in newStatus){
            
            //frame模型
            FXStatusFrame *f=[[FXStatusFrame alloc] init];
            
            //把微博模型转化为frame模型
            f.status = status;
            
            [frames addObject:f];
        }
        self.statusesFrame=frames;
        
        //根据数组内容的个数，获取范围
        NSRange range=NSMakeRange(0, newStatus.count);
        
        // 设置位置
        NSIndexSet *set= [NSIndexSet indexSetWithIndexesInRange:range];
        
        //在前方插入
        [self.statusesFrame insertObjects:frames atIndexes:set];
        
        [control endRefreshing];
        
         [self setUpNewStatusCount:newStatus.count];

        
        //更新cell数据
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }
     
     ];


}

//显示更新数据
-(void)setUpNewStatusCount:(NSInteger)count{
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.width, 50)];
    
    //文本居中
    label.textAlignment=NSTextAlignmentCenter;
    //根据图片设置背景色
    label.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
                           
    //文本的字体
    
    
    //文本的颜色
    
    
    if(count)
    {
//        NSLog(@"更新了%ld条数据",newStatus.count);
        NSString *str=[NSString stringWithFormat:@"更新了%ld条微博数据",count];
        label.text=str;
    }
    else
    {
        label.text=@"没有最新数据";
    }
    //在....控件的下方插入数据
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
   //添加动画
    
    CGFloat dura=1.0;
    [UIView animateWithDuration:dura animations:^{
        //执行动画的操作
        label.y+=50;
        
    } completion:^(BOOL finished) {
        
        CGFloat delay =1.0;
        
        //完成操作后进入该代码块,options: 匀速运动
        [UIView animateWithDuration:dura delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
           
            label.y-=50;
        } completion:^(BOOL finished) {
            
            //从内存中 清除
            [label removeFromSuperview];
            
        }];
    }];
}

//懒加载
-(NSMutableArray*)statusesFrame
{
    
 if(_statusesFrame==nil)
 {
     _statusesFrame=[NSMutableArray array];
 }
    
  return _statusesFrame ;
    
}


//获取微博
-(void)loadStatus
{
  //https://api.weibo.com/2/statuses/home_timeline.json
    
    //创建一个账号模型
    FXAccount *account=[FXAccountTool account];
    
    //创建一个管理对象
    AFHTTPRequestOperationManager *man=[AFHTTPRequestOperationManager manager];
    //从模型中取出请求信息
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    //存到字典
    params[@"access_token"]=account.access_token;
//    params[@"count"]=@1;
//    params[@"uid"]=account.uid;
    
    //发送get请求
    [man GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //获取json数组
       NSArray *statusArry =responseObject[@"statuses"];
        
        //把数据嵌套到模型
        for(NSDictionary *dict in statusArry )
        {
            
            FXStatus *status = [FXStatus statusWithDict:dict];
            
            [self.statusesFrame addObject:status];
        }
        //更新cell数据
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }
     
    ];
}
-(void)titleButtonClick
{
    //实例化button
    UIButton *addButton=[UIButton buttonWithType:UIButtonTypeContactAdd];
    
    //设置Frame
    addButton.frame=CGRectMake(30, 40, addButton.frame.size.width, addButton.frame.size.height);
    //实例化
    FXDropdownView *dropView=[FXDropdownView menu];
    
    //添加控件
    dropView.content=addButton;

    //显示
    [dropView show];

}


//获取用户信息
-(void)setUpUserInf
{
    //创建一个账号模型
    FXAccount *account=[FXAccountTool account];
    
    //创建一个管理对象
    AFHTTPRequestOperationManager *man=[AFHTTPRequestOperationManager manager];
    //从模型中取出请求信息
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    //存到字典
    params[@"access_token"]=account.access_token;
    params[@"uid"]=account.uid;
    
    //发送get请求
    [man GET:@"https://api.weibo.com/2/users/show.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        account.name=responseObject[@"name"];
        
       
        [FXAccountTool saveAccount:account];
        
        //获取titileView;
        UIButton *titleBtn=(UIButton *)self.navigationItem.titleView;
        
        [titleBtn setTitle:account.name forState:UIControlStateNormal];
        
        
      //  NSLog(@"responseObject=%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }
     
     ];

}


-(void)setUpabuttonItem
{
    //    //自定义左边按钮
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem addItemTarget:self Image:@"navigationbar_friendsearch" selectImage:@"navigationbar_friendsearch_highlighted" action:@selector(friendSearch)];
    
    //自定义右边按钮
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem addItemTarget:self Image:@"navigationbar_pop" selectImage:@"navigationbar_pop_highlighted" action:@selector(pop)];
    
    //实例化按钮
    UIButton *titleButton=[[UIButton alloc]init];
    //设置尺寸
    titleButton.frame=CGRectMake(1, 1, 100, 40);
    
    //通过三元运算符判断是否有值
    NSString *name=[FXAccountTool account].name;
    
    //设置标题
    [titleButton setTitle:name?name:@"首页" forState:UIControlStateNormal];
    //设置颜色
    [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置图片
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateHighlighted];
    
    //设置标题和图片的位置<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>
    titleButton.titleEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 15);
    titleButton.imageEdgeInsets=UIEdgeInsetsMake(0, 70, 0, 0);
    
    //设置button监听
    [titleButton addTarget:self action:@selector(titleButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    //应用到导航栏
    self.navigationItem.titleView=titleButton;
    


}

#pragma mark -设置行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        NSLog(@"self.statusesFrame.count = %lu",self.statusesFrame.count);
    return self.statusesFrame.count;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    #warning 未完
    FXStatusFrame *frame =self.statusesFrame[indexPath.row];
    NSLog(@"每行的高==%lf",frame.cellHeight);
    return frame.cellHeight;
}

#pragma mark - 设置单元格数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *ID=@"cell";
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
//    
//    if(cell == nil){
//    
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//    }
//    FXStatus *status =self.status[indexPath.row];
//    FXUser *user=status.user;
//    //用户名
//    cell.textLabel.text=user.name;
//    //文本详情
//    cell.detailTextLabel.text=status.text;
//    //图片url地址
//    NSString *imageUrl=user.profile_image_url;
//    
//    //加载图片
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"avatar_default"]];
//    
//    return cell;
 
    FXTableViewCell *cell = [FXTableViewCell cellWithTableView:tableView];
    
    cell.statusframe=self.statusesFrame[indexPath.row];
    
    return cell;
    
}

-(void)friendSearch
{

}

-(void)pop
{

}

@end
