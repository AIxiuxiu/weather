//
//  WeatherModel.h
//  MyWeather
//
//  Created by mac on 16-2-27.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResultsModel.h"
@interface WeatherModel : NSObject

@property (nonatomic, copy) NSNumber *error;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, retain) NSArray *resultsArray;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)weatherWithDictionary:(NSDictionary *)dict;

@end
