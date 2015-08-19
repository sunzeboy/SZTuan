//
//  SZMetaDataTool.h
//  SZTuan
//
//  Created by sunze on 15/8/19.
//  Copyright (c) 2015年 sunze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZSingleton.h"

@interface SZMetaDataTool : NSObject
SZSingletonH(SZMetaDataTool)

/**
 *  所有的分类
 */
@property (strong, nonatomic, readonly) NSArray *categories;
/**
 *  所有的城市
 */
@property (strong, nonatomic, readonly) NSArray *cities;
/**
 *  所有的城市组
 */
@property (strong, nonatomic, readonly) NSArray *cityGroups;
/**
 *  所有的排序
 */
@property (strong, nonatomic, readonly) NSArray *sorts;

@end
