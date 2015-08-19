//
//  HMRegionsViewController.m
//  黑团HD
//
//  Created by apple on 14-8-18.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "SZRegionsViewController.h"
#import "SZDropDownMenu.h"
#import "SZCity.h"
@interface SZRegionsViewController ()

@end

@implementation SZRegionsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    // 顶部的view
    UIView *topView = [self.view.subviews firstObject];
    
    SZDropDownMenu *menu = [SZDropDownMenu menu];
#warning 临时的假数据
    SZMetaDataTool *tool = [SZMetaDataTool sharedSZMetaDataTool];
    SZCity *city = [tool cityWithName:@"广州"];
    menu.items = city.regions;
    
    [self.view addSubview:menu];
    
    [menu autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView];
    
    [menu autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    
}


@end
