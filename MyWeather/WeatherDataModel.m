//
//  WeatherDataModel.m
//  MyWeather
//
//  Created by mac on 16-2-27.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "WeatherDataModel.h"

@implementation WeatherDataModel

- (void)dealloc{
    [_date release];
    [_nightPictureUrl release];
    [_dayPictureUrl release];
    [_weather release];
    [_wind release];
    [_temperature release];
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)weatherDataWithDictionary:(NSDictionary *)dict{
    return [[[self alloc]initWithDictionary:dict] autorelease];
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.date forKey:@"date"];
    [aCoder encodeObject:self.nightPictureUrl forKey:@"nightPictureUrl"];
    [aCoder encodeObject:self.dayPictureUrl forKey:@"dayPictureUrl"];
    [aCoder encodeObject:self.weather forKey:@"weather"];
    [aCoder encodeObject:self.wind forKey:@"wind"];
    [aCoder encodeObject:self.temperature forKey:@"temperature"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.date = [aDecoder decodeObjectForKey:@"date"];
        self.nightPictureUrl = [aDecoder decodeObjectForKey:@"nightPictureUrl"];
        self.dayPictureUrl = [aDecoder decodeObjectForKey:@"dayPictureUrl"];
        self.weather = [aDecoder decodeObjectForKey:@"weather"];
        self.wind = [aDecoder decodeObjectForKey:@"wind"];
        self.temperature = [aDecoder decodeObjectForKey:@"temperature"];
    }
    return self;
}

@end
