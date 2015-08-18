//
//  SZAPITool.h
//  SZTuan
//
//  Created by sunze on 15/8/18.
//  Copyright (c) 2015年 sunze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZSingleton.h"
@interface SZAPITool : NSObject
-(void)request:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))success failure:(void(^)(NSError *error))failure;

SZSingletonH(SZAPITool)

@end
