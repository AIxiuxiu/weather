//
//  StateManager.h
//  MyWeather
//
//  Created by mac on 16-2-28.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StateManager : NSObject

+ (NSNumber *)error;
+ (void)setError:(NSNumber *)error;

+ (NSString *)status;
+ (void)setStatus:(NSString *)status;

+ (NSString *)date;
+ (void)setDate:(NSString *)date;

+ (NSArray *)resultsArray;
+ (void)setResultsArray:(NSArray *)resultsArray;

+ (NSArray *)coordinateArray;
+ (void)setCoordinateArray:(NSArray *)coordinateArray;

+ (void)removeAllData;

@end
