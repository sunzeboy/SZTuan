//
//  HMCity.m
//  黑团HD
//
//  Created by apple on 14-8-18.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "SZCity.h"
#import "SZRegion.h"

@implementation SZCity
- (NSDictionary *)objectClassInArray
{
    return @{@"regions" : [SZRegion class]};
}
@end
