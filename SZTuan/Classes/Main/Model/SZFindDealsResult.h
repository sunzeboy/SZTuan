//
//  HMFindDealsResult.h
//  黑团HD
//
//  Created by apple on 14-8-16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZGetSingleDealResult.h"

@interface SZFindDealsResult : SZGetSingleDealResult
/** 所有页面团购总数 */
@property (assign, nonatomic) int total_count;
@end
