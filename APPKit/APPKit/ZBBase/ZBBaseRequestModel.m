//
//  ZBBaseRequestModel.m
//  APPKit
//
//  Created by 瞄财网 on 2017/5/8.
//  Copyright © 2017年 kdong. All rights reserved.
//

#import "ZBBaseRequestModel.h"

@implementation ZBBaseRequestModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _suportBackground = NO;
        _showHud = NO;
    }
    return self;
}



@end
