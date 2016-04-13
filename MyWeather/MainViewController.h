//
//  MainViewController.h
//  MyWeather
//
//  Created by mac on 16-2-27.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"
#import "WeatherModel.h"
#import "WeatherView.h"
@interface MainViewController : UIViewController<AddLocationViewControllerDelegate>

@property (nonatomic ,retain) NSArray *resultsModelArray;
@property (nonatomic, retain) NSMutableArray *weatherViewArray;

- (void)requestWeatherData:(NSString *)cityName withWeather:(WeatherView *)weatherView;

@end
