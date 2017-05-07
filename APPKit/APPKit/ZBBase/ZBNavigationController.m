//
//  ZBNavigationController.m
//  APPKit
//
//  Created by mac  on 17/5/7.
//  Copyright © 2017年 kdong. All rights reserved.
//

#import "ZBNavigationController.h"

@interface ZBNavigationController ()

@end

@implementation ZBNavigationController


+ (void)initialize
{
    [self configurationNaviBar];
    [self configurationgNaviItem];
}


+ (void)configurationNaviBar
{
    UINavigationBar *appeatrance = [UINavigationBar appearance];
    [appeatrance setBarTintColor:[UIColor grayColor]];
    [appeatrance setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18.0],
                                         NSForegroundColorAttributeName:[UIColor whiteColor]
                                          }];
}

+ (void)configurationgNaviItem
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f],
                                   NSForegroundColorAttributeName:[UIColor whiteColor]
                                   } forState:UIControlStateNormal];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
@end
