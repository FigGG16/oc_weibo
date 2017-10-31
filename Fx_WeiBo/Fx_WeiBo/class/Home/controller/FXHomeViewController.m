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
@interface FXHomeViewController ()

@end

@implementation FXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpabuttonItem];
    //请求信息，获取用户数据
    [self setUpUserInf];
    
    //获取微博
    [self loadStatus];
    
}

-(NSMutableArray*)status
{
 if(_status==nil)
 {
     _status=[NSMutableArray array];
 }
    
  return _status;
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
            
            [self.status addObject:status];
        }
        //更新cell数据
        [self.tableView reloadData];
        
        NSLog(@"responseObject=%@",responseObject);
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

#pragma --设置行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.status.count;

}


//设置单元格数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *ID=@"cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell == nil){
    
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    FXStatus *status =self.status[indexPath.row];
    FXUser *user=status.user;
    //用户名
    cell.textLabel.text=user.name;
    //文本详情
    cell.detailTextLabel.text=status.text;
    //图片url地址
    NSString *imageUrl=user.profile_image_url;
    
    //加载图片
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"avatar_default"]];
    
    return cell;
}

-(void)friendSearch
{

}

-(void)pop
{

}

@end
