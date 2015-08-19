//
//  SZMetaDataTool.m
//  SZTuan
//
//  Created by sunze on 15/8/19.
//  Copyright (c) 2015年 sunze. All rights reserved.
//

#import "SZMetaDataTool.h"
#import "SZCategory.h"
#import "SZCity.h"
#import "SZCityGroup.h"
#import "SZSort.h"

@interface SZMetaDataTool()//由于 .h中所有的属性都是readonly，所以要重新声明
{
    /** 所有的分类 */
    NSArray *_categories;
    /** 所有的城市 */
    NSArray *_cities;
    /** 所有的城市组 */
    NSArray *_cityGroups;
    /** 所有的排序 */
    NSArray *_sorts;
}
@end

@implementation SZMetaDataTool

SZSingletonM(SZMetaDataTool)

- (NSArray *)categories
{
    if (!_categories) {
        _categories = [SZCategory objectArrayWithFilename:@"categories.plist"];
    }
    return _categories;
}

- (NSArray *)cityGroups
{
    if (!_cityGroups) {
        _cityGroups = [SZCityGroup objectArrayWithFilename:@"cityGroups.plist"];
    }
    return _cityGroups;
}

- (NSArray *)cities
{
    if (!_cities) {
        _cities = [SZCity objectArrayWithFilename:@"cities.plist"];
    }
    return _cities;
}

- (NSArray *)sorts
{
    if (!_sorts) {
        _sorts = [SZSort objectArrayWithFilename:@"sorts.plist"];
    }
    return _sorts;
}

- (SZCity *)cityWithName:(NSString *)name
{
    if (name.length == 0) return nil;
    
    for (SZCity *city in self.cities) {
        if ([city.name isEqualToString:name]) return city;
    }
    return nil;
}

@end
