//
//  SZDropDownMainCell.h
//  SZTuan
//
//  Created by sunze on 15/8/19.
//  Copyright (c) 2015年 sunze. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SZDropDownMenu.h"

@interface SZDropDownMainCell : UITableViewCell

@property(nonatomic,strong) id<SZDropdownMenuItem> item;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
