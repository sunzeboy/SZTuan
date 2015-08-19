//
//  SZDealsViewController.m
//  SZTuan
//
//  Created by sunze on 15/8/18.
//  Copyright (c) 2015年 sunze. All rights reserved.
//

#import "SZDealsViewController.h"
#import "AwesomeMenu.h"
#import "AwesomeMenuItem.h"
#import "UIBarButtonItem+Extension.h"
#import "SZDealsTopMenu.h"
#import "SZCategoriesViewController.h"
#import "SZRegionsViewController.h"
#import "SZSortsViewController.h"

@interface SZDealsViewController ()
<AwesomeMenuDelegate>
/** 分类菜单 */
@property (weak, nonatomic) SZDealsTopMenu *categoryMenu;
/** 区域菜单 */
@property (weak, nonatomic) SZDealsTopMenu *regionMenu;
/** 排序菜单 */
@property (weak, nonatomic) SZDealsTopMenu *sortMenu;

/** 点击顶部菜单后弹出的Popover */
/** 分类Popover */
@property (strong, nonatomic) UIPopoverController *categoryPopover;
/** 区域Popover */
@property (strong, nonatomic) UIPopoverController *regionPopover;
/** 排序Popover */
@property (strong, nonatomic) UIPopoverController *sortPopover;
@end

@implementation SZDealsViewController

- (UIPopoverController *)categoryPopover
{
    if (!_categoryPopover) {
        SZCategoriesViewController *cv = [[SZCategoriesViewController alloc] init];
        self.categoryPopover = [[UIPopoverController alloc] initWithContentViewController:cv];
    }
    return _categoryPopover;
}

- (UIPopoverController *)regionPopover
{
    if (!_regionPopover) {
        SZRegionsViewController *rv = [[SZRegionsViewController alloc] init];
        self.regionPopover = [[UIPopoverController alloc] initWithContentViewController:rv];
    }
    return _regionPopover;
}

- (UIPopoverController *)sortPopover
{
    if (!_sortPopover) {
        SZSortsViewController *sv = [[SZSortsViewController alloc] init];
        self.sortPopover = [[UIPopoverController alloc] initWithContentViewController:sv];
    }
    return _sortPopover;
}


-(void)viewDidLoad
{
    [super viewDidLoad];

    
    
    // 设置导航栏左边的内容
    [self setupNavLeft];
    
    // 设置导航栏右边的内容
    [self setupNavRight];
    
    // 用户菜单
    [self setUpUserMenu];
}


/**
 *  创建一个Path菜单item
 */
-(AwesomeMenuItem *)itemWithContent:(NSString *)content highlightedContent:(NSString *)highlightedContent
{
    UIImage *itemBg = [UIImage imageNamed:@"bg_pathMenu_black_normal"];
    return [[AwesomeMenuItem alloc] initWithImage:itemBg
                                 highlightedImage:nil
                                     ContentImage:[UIImage imageNamed:content]
                          highlightedContentImage:[UIImage imageNamed:highlightedContent]];
}


/**
 *  用户菜单
 */
-(void)setUpUserMenu
{
    
    // 1.周边的item
    AwesomeMenuItem *mineItem = [self itemWithContent:@"icon_pathMenu_mine_normal" highlightedContent:@"icon_pathMenu_mine_highlighted"];
    AwesomeMenuItem *collectItem = [self itemWithContent:@"icon_pathMenu_collect_normal" highlightedContent:@"icon_pathMenu_collect_highlighted"];
    AwesomeMenuItem *scanItem = [self itemWithContent:@"icon_pathMenu_scan_normal" highlightedContent:@"icon_pathMenu_scan_highlighted"];
    AwesomeMenuItem *moreItem = [self itemWithContent:@"icon_pathMenu_more_normal" highlightedContent:@"icon_pathMenu_more_highlighted"];
    NSArray *items = @[mineItem, collectItem, scanItem, moreItem];
    
    // 2.中间的开始tiem
    AwesomeMenuItem *startItem = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"icon_pathMenu_background_normal"]
                                                       highlightedImage:[UIImage imageNamed:@"icon_pathMenu_background_highlighted"]
                                                           ContentImage:[UIImage imageNamed:@"icon_pathMenu_mainMine_normal"]
                                                highlightedContentImage:[UIImage imageNamed:@"icon_pathMenu_mainMine_highlighted"]];
    
    AwesomeMenu *menu = [[AwesomeMenu alloc] initWithFrame:CGRectZero startItem:startItem optionMenus:items];
    [self.view addSubview:menu];
    // 真个菜单的活动范围
    menu.menuWholeAngle = M_PI_2;
    // 约束
    CGFloat menuH = 200;
    [menu autoSetDimensionsToSize:CGSizeMake(200, menuH)];
    [menu autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [menu autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    
    // 3.添加一个背景
    UIImageView *menuBg = [[UIImageView alloc] init];
    menuBg.image = [UIImage imageNamed:@"icon_pathMenu_background"];
    [menu insertSubview:menuBg atIndex:0];
    // 约束
    [menuBg autoSetDimensionsToSize:menuBg.image.size];
    [menuBg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [menuBg autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    
    // 起点
    menu.startPoint = CGPointMake(menuBg.image.size.width * 0.5, menuH - menuBg.image.size.height * 0.5);
    // 禁止中间按钮旋转
    menu.rotateAddButton = NO;
    
    // 设置代理
    menu.delegate = self;

}

#pragma mark - 菜单代理
- (void)awesomeMenuWillAnimateClose:(AwesomeMenu *)menu
{
    // 恢复图片
    menu.contentImage = [UIImage imageNamed:@"icon_pathMenu_mainMine_normal"];
    menu.highlightedContentImage = [UIImage imageNamed:@"icon_pathMenu_mainMine_highlighted"];
}

- (void)awesomeMenuWillAnimateOpen:(AwesomeMenu *)menu
{
    // 显示xx图片
    menu.contentImage = [UIImage imageNamed:@"icon_pathMenu_cross_normal"];
    menu.highlightedContentImage = [UIImage imageNamed:@"icon_pathMenu_cross_highlighted"];
}

- (void)awesomeMenu:(AwesomeMenu *)menu didSelectIndex:(NSInteger)idx
{
    NSLog(@"didSelectIndex-%d", idx);
    [self awesomeMenuWillAnimateClose:menu];
}




/**
 *  设置导航栏左边的内容
 */
- (void)setupNavLeft
{
    // 1.LOGO
    UIBarButtonItem *logoItem = [UIBarButtonItem itemWithImageName:@"icon_meituan_logo" highImageName:@"icon_meituan_logo" target:nil action:nil];
    logoItem.customView.userInteractionEnabled = NO;
    // 2.分类
    SZDealsTopMenu *categoryMenu = [SZDealsTopMenu menu];
    [categoryMenu addTarget:self action:@selector(categoryMenuClick)];
    UIBarButtonItem *categoryItem = [[UIBarButtonItem alloc] initWithCustomView:categoryMenu];
    self.categoryMenu = categoryMenu;
    
    // 3.区域
    SZDealsTopMenu *regionMenu = [SZDealsTopMenu menu];
    [regionMenu addTarget:self action:@selector(regionMenuClick)];
    UIBarButtonItem *regionItem = [[UIBarButtonItem alloc] initWithCustomView:regionMenu];
    self.regionMenu = regionMenu;
    
    // 4.排序
    SZDealsTopMenu *sortMenu = [SZDealsTopMenu menu];
    [sortMenu addTarget:self action:@selector(sortMenuClick)];
    sortMenu.imageButton.image = @"icon_sort";
    sortMenu.imageButton.highlightedImage = @"icon_sort_highlighted";
    sortMenu.titleView.text = @"排序";
    UIBarButtonItem *sortItem = [[UIBarButtonItem alloc] initWithCustomView:sortMenu];
    self.sortMenu = sortMenu;
    
    self.navigationItem.leftBarButtonItems = @[logoItem, categoryItem, regionItem, sortItem];
}

#pragma mark - 导航栏右边处理
/** 搜索 */
- (void)searchClick
{
    
}

/** 地图 */
- (void)mapClick
{
    
}

#pragma mark - 导航栏左边处理
/** 分类菜单 */
- (void)categoryMenuClick
{
    [self.categoryPopover presentPopoverFromRect:self.categoryMenu.bounds inView:self.categoryMenu permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

/** 区域菜单 */
- (void)regionMenuClick
{
    [self.regionPopover presentPopoverFromRect:self.regionMenu.bounds inView:self.regionMenu permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

/** 排序菜单 */
- (void)sortMenuClick
{
    [self.sortPopover presentPopoverFromRect:self.sortMenu.bounds inView:self.sortMenu permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

/**
 *  设置导航栏右边的内容
 */
- (void)setupNavRight
{
    // 1.地图
    UIBarButtonItem *mapItem = [UIBarButtonItem itemWithImageName:@"icon_map" highImageName:@"icon_map_highlighted" target:self action:@selector(mapClick)];
    mapItem.customView.width = 50;
    mapItem.customView.height = 27;
    
    // 2.搜索
    UIBarButtonItem *searchItem = [UIBarButtonItem itemWithImageName:@"icon_search" highImageName:@"icon_search_highlighted" target:self action:@selector(searchClick)];
    searchItem.customView.width = mapItem.customView.width;
    searchItem.customView.height = mapItem.customView.height;
    
    self.navigationItem.rightBarButtonItems = @[mapItem, searchItem];
}



@end
