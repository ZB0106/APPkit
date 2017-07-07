//
//  ZB_BaseTableViewCell.h
//  APPKit
//
//  Created by 瞄财网 on 2017/7/6.
//  Copyright © 2017年 kdong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZB_BaseTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView identifier:(NSString *)identifier;

@end
