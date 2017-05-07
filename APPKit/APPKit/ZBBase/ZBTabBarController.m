//
//  ZBTabBarController.m
//  APPKit
//
//  Created by mac  on 17/5/7.
//  Copyright © 2017年 kdong. All rights reserved.
//

#import "ZBTabBarController.h"
#import "ZBViewController.h"
#import "ZBNavigationController.h"

@interface ZBTabBarController ()

@end

@implementation ZBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZBViewController *chat = [[ZBViewController alloc] init];
    [self addOneController:chat title:@"消息" imageName:@"messageNormalIcon" selectedImageName:@"messageHighLightIcon" tag:0];
    
    
    ZBViewController *contact = [[ZBViewController alloc] init];
    [self addOneController:contact title:@"联系人" imageName:@"contactNormalIcon" selectedImageName:@"contactHighLightIcon" tag:1];
    
    
    ZBViewController *discover = [[ZBViewController alloc] init];
    [self addOneController:discover title:@"办公" imageName:@"office_center_normal" selectedImageName:@"office_center_pressed" tag:2];
    
    
    ZBViewController *share = [[ZBViewController alloc] init];
    [self addOneController:share title:@"分享" imageName:@"ico-sharedefault" selectedImageName:[NSString stringWithFormat:@"ico-shareclick"] tag:3];
    
    
    ZBViewController *more = [[ZBViewController alloc] init];
    [self addOneController:more title:@"我" imageName:@"personal_center_normal" selectedImageName:[NSString stringWithFormat:@"personal_center_pressed"] tag:4];

    // Do any additional setup after loading the view.
}



- (void)addOneController:(ZBViewController *)viewCotroller title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName tag:(NSInteger)tag
{
    UITabBarItem *barItem = [[UITabBarItem alloc] init];
    barItem.selectedImage = [UIImage imageNamed:selectedImageName];
    barItem.image = [UIImage imageNamed:imageName];
    barItem.badgeValue = @"2";
    [self selectedTapTabBarItems:barItem];
    [self unSelectedTapTabBarItems:barItem];
    
    viewCotroller.tabBarItem = barItem;
    viewCotroller.navigationItem.title = title;
    ZBNavigationController *nav = [[ZBNavigationController alloc] initWithRootViewController:viewCotroller];
    [self addChildViewController:nav];
    
}

-(void)unSelectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:14], NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateNormal];
}

-(void)selectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:14],
                                        NSFontAttributeName,[UIColor blueColor],NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateSelected];
}


//- (UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//    
//}
//
//- (BOOL)shouldAutorotate
//{
//    
//}

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
