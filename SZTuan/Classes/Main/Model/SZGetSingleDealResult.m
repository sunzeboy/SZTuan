//
//  HMGetSingleDealResult.m
//  黑团HD
//
//  Created by apple on 14-8-16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "SZGetSingleDealResult.h"
#import "SZDeal.h"

@implementation SZGetSingleDealResult

- (NSDictionary *)objectClassInArray
{
    return @{@"deals" : [SZDeal class]};
}
@end
