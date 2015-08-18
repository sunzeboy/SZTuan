//
//  SZAPITool.m
//  SZTuan
//
//  Created by sunze on 15/8/18.
//  Copyright (c) 2015年 sunze. All rights reserved.
//

#import "SZAPITool.h"
#import "DPAPI.h"

@interface SZAPITool()
<DPRequestDelegate>
@property (nonatomic, retain) DPAPI *api;

@end


@implementation SZAPITool
SZSingletonM(SZAPITool)

-(DPAPI *)api
{
    if (_api == nil) {
        _api = [[DPAPI alloc] init];
    }
    return _api;
}


-(void)request:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    DPRequest *request = [self.api requestWithURL:url params:[NSMutableDictionary dictionaryWithDictionary:params] delegate:self];
    request.success =success;
    request.failure = failure;

}

#pragma mark - DPRequestDelegate
-(void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result
{
    if (request.success) {
        request.success(result);
    }
}
-(void)request:(DPRequest *)request didFailWithError:(NSError *)error
{
    if (request.failure) {
        request.failure(error);
    }
}

@end
