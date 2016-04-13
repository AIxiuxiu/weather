//
//  ResultsModel.m
//  MyWeather
//
//  Created by mac on 16-2-27.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "ResultsModel.h"

@implementation ResultsModel

- (void)dealloc{
    [_currentCity release];
    [_pm25 release];
    [_indexArray release];
    [_weatherDataArray release];
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.currentCity = dict[@"currentCity"];
        self.pm25 = dict[@"pm25"];
        self.indexArray = [ResultsModel indexArrayWithArray:dict[@"index"]];
        self.weatherDataArray = [ResultsModel weatherDataArrayWithArray:dict[@"weather_data"]];
    }
    return self;
}

+ (NSArray *)indexArrayWithArray:(NSArray *)array{
    NSMutableArray *mutableArray = [[[NSMutableArray alloc] initWithCapacity:4] autorelease];
    for (NSDictionary *dict in array) {
        IndexModel *indexModel = [IndexModel indexWithDictionary:dict];
        [mutableArray addObject:indexModel];
    }
    return mutableArray;
}

+ (NSArray *)weatherDataArrayWithArray:(NSArray *)array{
    NSMutableArray *mutableArray = [[[NSMutableArray alloc] initWithCapacity:5] autorelease];
    for (NSDictionary *dict in array) {
        WeatherDataModel *weatherDataModel = [WeatherDataModel weatherDataWithDictionary:dict];
        [mutableArray addObject:weatherDataModel];
    }
    return mutableArray;
}

+ (instancetype)resultsWithDictionary:(NSDictionary *)dict{
    return [[[self alloc]initWithDictionary:dict] autorelease];
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.currentCity forKey:@"currentCity"];
    [aCoder encodeObject:self.pm25 forKey:@"pm25"];
    [aCoder encodeObject:self.indexArray forKey:@"indexArray"];
    [aCoder encodeObject:self.weatherDataArray forKey:@"weatherDataArray"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.currentCity = [aDecoder decodeObjectForKey:@"currentCity"];
        self.pm25 = [aDecoder decodeObjectForKey:@"pm25"];
        self.indexArray = [aDecoder decodeObjectForKey:@"indexArray"];
        self.weatherDataArray = [aDecoder decodeObjectForKey:@"weatherDataArray"];
    }
    return self;
}

@end
