//
//  HMRegionsViewController.m
//  黑团HD
//
//  Created by apple on 14-8-18.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "SZRegionsViewController.h"
#import "SZDropDownMenu.h"
@interface SZRegionsViewController ()

@end

@implementation SZRegionsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    // 顶部的view
    UIView *topView = [self.view.subviews firstObject];
    
    SZDropDownMenu *menu = [SZDropDownMenu menu];
    [self.view addSubview:menu];
    
    [menu autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView];
    
    [menu autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    
}


@end
