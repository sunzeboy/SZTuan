//
//  SZDealTool.h
//  SZTuan
//
//  Created by sunze on 15/8/18.
//  Copyright (c) 2015年 sunze. All rights reserved.
//  业务类（负责团购的所有业务）

#import <Foundation/Foundation.h>
#import "SZFindDealsParam.h"
#import "SZFindDealsResult.h"
#import "SZGetSingleDealParam.h"
#import "SZGetSingleDealResult.h"

@interface SZDealTool : NSObject
/**
 *  搜索团购
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+(void)findDeals:(SZFindDealsParam *)param success:(void(^)(SZFindDealsResult *result))success failure:(void(^)(NSError *error))failure;

/**
 *  获得指定团购（获得单个团购信息）
 */
+(void)getSingleDeal:(SZGetSingleDealParam *)param success:(void(^)(SZGetSingleDealResult *result))success failure:(void(^)(NSError *error))failure;


@end
