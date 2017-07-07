//
//  ZB_BaseTableViewCell.m
//  APPKit
//
//  Created by 瞄财网 on 2017/7/6.
//  Copyright © 2017年 kdong. All rights reserved.
//

#import "ZB_BaseTableViewCell.h"

@implementation ZB_BaseTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView identifier:(NSString *)identifier
{
    ZB_BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        cell = [[self alloc]  initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.detailTextLabel.hidden = YES;
        cell.textLabel.hidden = YES;
        cell.imageView.hidden = YES;
    }
    return cell;
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
