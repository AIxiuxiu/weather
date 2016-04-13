//
//  WebRequest.h
//  MyWeather
//
//  Created by mac on 16-2-27.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "WeatherModel.h"
typedef void(^WeatherBlock)(WeatherModel *weatherModel);
@interface WebRequest : NSObject<ASIHTTPRequestDelegate>
{
    WeatherBlock _weathBlobk;
}
- (void)dataForHTTPRequestWithLocation:(NSString *)location;
- (void)gainWeatherModel:(WeatherBlock)weatherBlock;

@end
