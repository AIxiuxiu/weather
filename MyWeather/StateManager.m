//
//  StateManager.m
//  MyWeather
//
//  Created by mac on 16-2-28.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "StateManager.h"

@implementation StateManager

+ (NSNumber *)error{
    NSNumber *error = [[NSUserDefaults standardUserDefaults]objectForKey:@"error"];
    if(error) {
        return error;
    }
    return nil;
}

+ (void)setError:(NSNumber *)error{
    [[NSUserDefaults standardUserDefaults]setObject:error forKey:@"error"];
}

+ (NSString *)status{
    NSString *status = [[NSUserDefaults standardUserDefaults]objectForKey:@"status"];
    if(status) {
        return status;
    }
    return nil;
}
+ (void)setStatus:(NSString *)status{
    [[NSUserDefaults standardUserDefaults]setObject:status forKey:@"status"];
}

+ (NSString *)date{
    NSString *date = [[NSUserDefaults standardUserDefaults]objectForKey:@"date"];
    if(date) {
        return date;
    }
    return nil;
}

+ (void)setDate:(NSString *)date{
    [[NSUserDefaults standardUserDefaults]setObject:date forKey:@"date"];
}

+ (NSArray *)resultsArray{
    NSData *encodedResultsData = [[NSUserDefaults standardUserDefaults]objectForKey:@"resultsArray"];
    if(encodedResultsData) {
        return (NSArray *)[NSKeyedUnarchiver unarchiveObjectWithData:encodedResultsData];
    }
    return nil;
}

+ (void)setResultsArray:(NSArray *)resultsArray{
    NSData *encodedResultsData = [NSKeyedArchiver archivedDataWithRootObject:resultsArray];
    [[NSUserDefaults standardUserDefaults]setObject:encodedResultsData forKey:@"resultsArray"];
}

+ (NSArray *)coordinateArray{
    NSArray *coordinate = [[NSUserDefaults standardUserDefaults]objectForKey:@"coordinate"];
    if(coordinate) {
        return coordinate;
    }
    return nil;
}

+ (void)setCoordinateArray:(NSArray *)coordinateArray{
    [[NSUserDefaults standardUserDefaults]setObject:coordinateArray forKey:@"coordinate"];
}

+ (void)removeAllData{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"error"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"status"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"date"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"resultsArray"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"coordinate"];
}

@end
