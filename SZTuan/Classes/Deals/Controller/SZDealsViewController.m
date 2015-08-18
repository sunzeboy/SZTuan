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

@implementation SZDealsViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    [self setUpUserMenu];
}



-(AwesomeMenuItem *)itemWithContent:(NSString *)content highlightedContent:(NSString *)highlightedContent
{
    UIImage *itemBg = [UIImage imageNamed:@"bg_pathMenu_black_normal"];
    return [[AwesomeMenuItem alloc] initWithImage:itemBg
                                 highlightedImage:nil
                                     ContentImage:[UIImage imageNamed:content]
                          highlightedContentImage:[UIImage imageNamed:highlightedContent]];
}




-(void)setUpUserMenu
{


}
















@end
