//
//  SZDropDownMenu.m
//  SZTuan
//
//  Created by sunze on 15/8/19.
//  Copyright (c) 2015年 sunze. All rights reserved.
//

#import "SZDropDownMenu.h"

@interface SZDropDownMenu ()

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UITableView *subTableView;

@end

@implementation SZDropDownMenu

+ (instancetype)menu
{
    return [[[NSBundle mainBundle] loadNibNamed:@"SZDropDownMenu" owner:nil options:nil] lastObject];
}

/**
 *  一个UI控件即将被添加到窗口中就调用
 */
- (void)willMoveToWindow:(UIWindow *)newWindow
{
    self.mainTableView.backgroundColor = [UIColor redColor];
    self.subTableView.backgroundColor = [UIColor blueColor];
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.mainTableView) {
        return 10;
    } else {
        return 5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    if (tableView == self.mainTableView) {
        cell.textLabel.text = [NSString stringWithFormat:@"main - %d", indexPath.row];
    } else {
        cell.textLabel.text = [NSString stringWithFormat:@"sub - %d", indexPath.row];
    }
    return cell;
}

#pragma mark - 代理方法




@end
