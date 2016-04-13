//
//  ResultsModel.h
//  MyWeather
//
//  Created by mac on 16-2-27.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IndexModel.h"
#import "WeatherDataModel.h"
@interface ResultsModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *currentCity;
@property (nonatomic, copy) NSString *pm25;
@property (nonatomic, retain) NSArray *indexArray;
@property (nonatomic, retain) NSArray *weatherDataArray;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)resultsWithDictionary:(NSDictionary *)dict;

@end
