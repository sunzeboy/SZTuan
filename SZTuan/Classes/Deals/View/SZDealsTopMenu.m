//
//  SZDealsTopMenu.m
//  SZTuan
//
//  Created by sunze on 15/8/19.
//  Copyright (c) 2015年 sunze. All rights reserved.
//

#import "SZDealsTopMenu.h"
@interface SZDealsTopMenu ()


@end
@implementation SZDealsTopMenu

+(instancetype)menu
{
    return [[[NSBundle mainBundle] loadNibNamed:@"SZDealsTopMenu" owner:nil options:nil] lastObject];
}


- (void)addTarget:(id)target action:(SEL)action
{
    [self.imageButton addTarget:target action:action];
}

@end
