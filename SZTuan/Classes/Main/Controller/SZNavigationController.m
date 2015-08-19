//
//  SZNavigationController.m
//  SZTuan
//
//  Created by sunze on 15/8/19.
//  Copyright (c) 2015年 sunze. All rights reserved.
//

#import "SZNavigationController.h"

@implementation SZNavigationController
+ (void)initialize
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_normal"] forBarMetrics:UIBarMetricsDefault];
}

@end
