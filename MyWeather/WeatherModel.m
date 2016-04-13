//
//  WeatherModel.m
//  MyWeather
//
//  Created by mac on 16-2-27.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "WeatherModel.h"

@implementation WeatherModel

- (void)dealloc{
    [_error release];
    [_status release];
    [_date release];
    [_resultsArray release];
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.error = dict[@"error"];
        self.status = dict[@"status"];
        self.date = dict[@"date"];
        self.resultsArray = [WeatherModel resultsArrayWithArray:dict[@"results"]];
    }
    return self;
}

+ (NSArray *)resultsArrayWithArray:(NSArray *)array{
    NSMutableArray *mutableArray = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
    for (NSDictionary *dict in array) {
        ResultsModel *resultsModel = [ResultsModel resultsWithDictionary:dict];
        [mutableArray addObject:resultsModel];
    }
    return mutableArray;
}

+ (instancetype)weatherWithDictionary:(NSDictionary *)dict{
    return [[[self alloc]initWithDictionary:dict] autorelease];
}

@end
