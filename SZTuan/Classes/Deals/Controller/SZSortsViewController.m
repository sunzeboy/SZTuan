//
//  HMSortsViewController.m
//  黑团HD
//
//  Created by apple on 14-8-18.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "SZSortsViewController.h"
#import "SZSort.h"
#import "SZMetaDataTool.h"
#pragma mark - 自定义Button
@interface SZSortButton : UIButton
@property (nonatomic, strong) SZSort *sort;
@end

@implementation SZSortButton
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.bgImage = @"btn_filter_normal";
        self.selectedBgImage = @"btn_filter_selected";
        self.titleColor = [UIColor blackColor];
        self.selectedTitleColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}

- (void)setSort:(SZSort *)sort
{
    _sort = sort;
    
    self.title = sort.label;
}
@end

#pragma mark - 控制器代码
@interface SZSortsViewController ()

@property (weak, nonatomic) SZSortButton *selectedButton;

@end

@implementation SZSortsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置在popover中的尺寸
    self.preferredContentSize = self.view.size;
    
    // 根据排序模型的个数，创建对应的按钮
    CGFloat buttonX = 20;
    CGFloat buttonW = self.view.width - 2 * buttonX;
    CGFloat buttonP = 15;
    NSArray *sorts = [SZMetaDataTool sharedSZMetaDataTool].sorts;
    int count = sorts.count;
    CGFloat contentH = 0;
    for (int i = 0; i<count; i++) {
        // 创建按钮
        SZSortButton *button = [[SZSortButton alloc] init];
        // 取出模型
        button.sort = sorts[i];
        // 设置尺寸
        button.x = buttonX;
        button.width = buttonW;
        button.height = 30;
        button.y = buttonP + i * (button.height + buttonP);
        // 监听按钮点击
        [button addTarget:self action:@selector(sortButtonClick:) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:button];
        
        // 内容的高度
        contentH = button.maxY + buttonP;
    }
    
    // 设置contentSize
    UIScrollView *scrollView = (UIScrollView *)self.view;
    scrollView.contentSize = CGSizeMake(0, contentH);
}

- (void)sortButtonClick:(SZSortButton *)button
{
    // 1.修改状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}


@end
