//
//  ZBRootViewController.m
//  APPKit
//
//  Created by mac  on 17/5/7.
//  Copyright © 2017年 kdong. All rights reserved.
//

#import "ZBRootViewController.h"
#import "ZBTabBarController.h"

@interface ZBRootViewController ()


@end

@implementation ZBRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    ZBTabBarController *tab = [[ZBTabBarController alloc] init];
    [self.view addSubview:tab.view];
    [self addChildViewController:tab];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
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
