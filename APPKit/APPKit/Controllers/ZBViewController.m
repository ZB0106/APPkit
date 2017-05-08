//
//  ZBViewController.m
//  APPKit
//
//  Created by mac  on 17/5/7.
//  Copyright © 2017年 kdong. All rights reserved.
//

#import "ZBViewController.h"

#import "ZBUploadRequest.h"
#import "NSObject+zb_request.h"

@interface ZBViewController ()

@end

@implementation ZBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSObject *obj = [[NSObject alloc] init];
    obj.zb_method = ZB_RequestMethodGET;
    
    obj.zb_parameters = @{@"fdaf":@"111111"};
    ZBUploadRequest *up = [ZBUploadRequest upLoadWithfileData:nil name:@"hahahahha" fileName:@"" mimeType:@""];
    obj.uploadRequest = up;
    
    NSLog(@"%@%@%@%@",@(obj.zb_method),obj.zb_parameters,obj.uploadRequest.name,up.name);
    // Do any additional setup after loading the view.
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
