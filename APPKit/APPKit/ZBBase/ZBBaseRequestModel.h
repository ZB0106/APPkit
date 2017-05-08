//
//  ZBBaseRequestModel.h
//  APPKit
//
//  Created by 瞄财网 on 2017/5/8.
//  Copyright © 2017年 kdong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZBBaseRequestModel : NSObject

@property (nonatomic, assign, getter=isSuportBackground) BOOL suportBackground;
@property (nonatomic, assign, getter=isShowHud) BOOL showHud;
@property (nonatomic, assign, getter=isHeadBeginRefresh) BOOL headBeginRefresh;
@property (nonatomic, assign, getter=isFootBeginRefresh) BOOL footBeginRefresh;

@end
