//
//  WeatherDataModel.h
//  MyWeather
//
//  Created by mac on 16-2-27.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherDataModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *dayPictureUrl;
@property (nonatomic, copy) NSString *nightPictureUrl;
@property (nonatomic, copy) NSString *weather;
@property (nonatomic, copy) NSString *wind;
@property (nonatomic, copy) NSString *temperature;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)weatherDataWithDictionary:(NSDictionary *)dict;

@end
