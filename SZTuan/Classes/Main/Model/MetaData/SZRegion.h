//
//  HMRegion.h
//  黑团HD
//
//  Created by apple on 14-8-18.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SZRegion : NSObject
/** 区域名称 */
@property (copy, nonatomic) NSString *name;
/** 子区域 */
@property (strong, nonatomic) NSArray *subregions;
@end
