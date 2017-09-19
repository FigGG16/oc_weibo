//
//  FXProfileViewController.m
//  FX_WB
//
//  Created by Apple_Lzzy09 on 2017/9/11.
//  Copyright © 2017年 FX. All rights reserved.
//

#import "FXProfileViewController.h"

@interface FXProfileViewController ()

@end

@implementation FXProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //自定义右边按钮
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(setting)];
    
    
}


-(void)setting{


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
