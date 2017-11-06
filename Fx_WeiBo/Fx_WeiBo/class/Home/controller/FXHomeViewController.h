//
//  FXHomeViewController.h
//  FX_WB
//
//  Created by Apple_Lzzy09 on 2017/9/11.
//  Copyright © 2017年 FX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FXHomeViewController : UITableViewController

@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSMutableArray *status;
@property(nonatomic,strong) UIRefreshControl *control;

@end
