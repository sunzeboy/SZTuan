//
//  SZDealTool.m
//  SZTuan
//
//  Created by sunze on 15/8/18.
//  Copyright (c) 2015年 sunze. All rights reserved.
//

#import "SZDealTool.h"
#import "SZAPITool.h"

@implementation SZDealTool

+(void)findDeals:(SZFindDealsParam *)param success:(void (^)(SZFindDealsResult *))success failure:(void (^)(NSError *))failure
{
    [[SZAPITool sharedSZAPITool] request:@"v1/deal/find_deals" params:param.keyValues success:^(id json) {
        if (success) {
            SZFindDealsResult *obj = [SZFindDealsResult objectWithKeyValues:json];
            success(obj);
        }
        
    } failure:failure];

}

+(void)getSingleDeal:(SZGetSingleDealParam *)param success:(void (^)(SZGetSingleDealResult *))success failure:(void (^)(NSError *))failure
{
    [[SZAPITool sharedSZAPITool] request:@"v1/deal/get_single_deal" params:param.keyValues success:^(id json) {
        if (success) {
            SZGetSingleDealResult *obj = [SZGetSingleDealResult objectWithKeyValues:json];
            success(obj);
        }
    } failure:failure];


}

@end
