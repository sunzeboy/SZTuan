//
//  SZDropDownMenu.m
//  SZTuan
//
//  Created by sunze on 15/8/19.
//  Copyright (c) 2015年 sunze. All rights reserved.
//

#import "SZDropDownMenu.h"
#import "SZCategory.h"
#import "SZDropDownMainCell.h"
#import "SZDropDownSubCell.h"

@interface SZDropDownMenu ()

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UITableView *subTableView;

@end

@implementation SZDropDownMenu

+ (instancetype)menu
{
    return [[[NSBundle mainBundle] loadNibNamed:@"SZDropDownMenu" owner:nil options:nil] lastObject];
}

#pragma mark - 公共方法
- (void)setItems:(NSArray *)items
{
    _items = items;
    
    // 刷新表格
    [self.mainTableView reloadData];
    [self.subTableView reloadData];
}


/**
 *  一个UI控件即将被添加到窗口中就调用
 */
//- (void)willMoveToWindow:(UIWindow *)newWindow
//{
//    self.mainTableView.backgroundColor = [UIColor redColor];
//    self.subTableView.backgroundColor = [UIColor blueColor];
//}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.mainTableView) {
        return self.items.count;
    } else {
        int mainRow = [self.mainTableView indexPathForSelectedRow].row;
        id<SZDropdownMenuItem> item = self.items[mainRow];
        return [item subtitles].count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *ID = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//    }
//    if (tableView == self.mainTableView) {
//        cell.textLabel.text = [NSString stringWithFormat:@"main - %d", indexPath.row];
//    } else {
//        cell.textLabel.text = [NSString stringWithFormat:@"sub - %d", indexPath.row];
//    }
//    return cell;
    if (tableView == self.mainTableView) {
        SZDropDownMainCell *mainCell = [SZDropDownMainCell cellWithTableView:tableView];
        mainCell.item = self.items[indexPath.row];
        return mainCell;
    } else {
        SZDropDownSubCell *subCell = [SZDropDownSubCell cellWithTableView:tableView];
        int mainRow = [self.mainTableView indexPathForSelectedRow].row;
        id<SZDropdownMenuItem> item = self.items[mainRow];
        subCell.textLabel.text = [item subtitles][indexPath.row];
        return subCell;
    }
    
    
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.mainTableView) {
        // 刷新右边
        [self.subTableView reloadData];
    } else {
        
    }
}



@end
