//
//  WebRequest.m
//  MyWeather
//
//  Created by mac on 16-2-27.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "WebRequest.h"
#import "StateManager.h"
@implementation WebRequest

- (void)dataForHTTPRequestWithLocation:(NSString *)location{
    NSString *urlString = [NSString stringWithFormat:@"http://api.map.baidu.com/telematics/v3/weather?location=%@&output=json&ak=6k5b3unDoYha1jObKRKuQH9F",location];
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    request.delegate = self;
    request.timeOutSeconds = 1.0;
    [request startAsynchronous];
}

- (void)gainWeatherModel:(WeatherBlock)weatherBlock{
    _weathBlobk = Block_copy(weatherBlock);
}

- (void)requestFailed:(ASIHTTPRequest *)request{
    NSLog(@"请求失败");
}

- (void)requestFinished:(ASIHTTPRequest *)request{
    NSData *data = request.responseData;
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"解码失败");
        return;
    }
    WeatherModel *weatherModel = [WeatherModel weatherWithDictionary:dict];
    if ([weatherModel.error isEqualToNumber:@0] && [weatherModel.status isEqualToString:@"success"]) {
        _weathBlobk(weatherModel);
        NSMutableArray *resultMutebleArray = [[[NSMutableArray alloc] initWithArray:[StateManager resultsArray]] autorelease];
        ResultsModel *nowResultsModel = weatherModel.resultsArray[0];
        
        for (ResultsModel *resultsModel in resultMutebleArray) {
            if ([resultsModel.currentCity isEqualToString:nowResultsModel.currentCity]) {
                resultsModel = nowResultsModel;
                [StateManager setDate:weatherModel.date];
                [StateManager setResultsArray:resultMutebleArray];
                return;
            }
        }
        [StateManager setDate:weatherModel.date];
        [resultMutebleArray addObject:nowResultsModel];
        [StateManager setResultsArray:resultMutebleArray];
    }
}


@end
