//
//  SZCategoriesViewController.m
//  黑团HD
//
//  Created by apple on 14-8-18.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "SZCategoriesViewController.h"
#import "SZDropDownMenu.h"
@interface SZCategoriesViewController ()

@end

@implementation SZCategoriesViewController

-(void)loadView
{
    self.view = [SZDropDownMenu menu];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.preferredContentSize = self.view.size;
}



@end
