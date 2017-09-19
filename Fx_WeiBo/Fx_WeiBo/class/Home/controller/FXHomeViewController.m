//
//  FXHomeViewController.m
//  FX_WB
//
//  Created by Apple_Lzzy09 on 2017/9/11.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXHomeViewController.h"
@interface FXHomeViewController ()

@end

@implementation FXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    //自定义左边按钮
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem addItemTarget:self Image:@"navigationbar_friendsearch" selectImage:@"navigationbar_friendsearch_highlighted" action:@selector(friendSearch)];
    
    //自定义右边按钮
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem addItemTarget:self Image:@"navigationbar_pop" selectImage:@"navigationbar_pop_highlighted" action:@selector(pop)];
    
}
-(void)friendSearch
{

}

-(void)pop
{

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
