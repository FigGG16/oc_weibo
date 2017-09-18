//
//  FXMessageViewController.m
//  FX_WB
//
//  Created by Apple_Lzzy09 on 2017/9/11.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXMessageViewController.h"
#import "FXTest1ViewController.h"
#import "FXTest2ViewController.h"
@interface FXMessageViewController ()

@end

@implementation FXMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//返回行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
//设置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**第一步设置cell的标识ID*/
    static NSString *ID=@"cell";
    /**去缓存池中查找有没有可利用的cell*/
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    /**没有的话则新建一个，并制定样式*/
    if(cell==nil)
    {   //实例化cell
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    //获取行数
    NSString *str=[NSString stringWithFormat:@"text%ld",indexPath.row];
    //赋值给单元格
    cell.textLabel.text=str;
    return cell;
}
//实现单元格的点击方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //实例化控制器
    FXTest1ViewController *test1=[[FXTest1ViewController alloc] init];

    //设置背景颜色
    test1.view.backgroundColor=[UIColor redColor];

    
   //添加btn
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeContactAdd];
    
    btn.frame=CGRectMake(100, 100, 30, 30);
    
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [test1.view addSubview:btn];
    //加入栈顶
    [self.navigationController pushViewController:test1 animated:YES];
}

//响应点击
-(void)clickBtn{
    
        //实例化test12
        FXTest2ViewController *test2=[[FXTest2ViewController alloc] init];
        //设置背景颜色
        test2.view.backgroundColor=[UIColor yellowColor];
        //把test2压入栈顶
        [self.navigationController pushViewController:test2 animated:YES];
}


@end
