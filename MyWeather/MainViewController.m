//
//  MainViewController.m
//  MyWeather
//
//  Created by mac on 16-2-27.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "MainViewController.h"
#import "WebRequest.h"
#import "StateManager.h"
#import "UIPagingScrollView.h"
#import "WeatherView.h"
#import "RequestPicture.h"

@interface MainViewController ()
{
    UIPagingScrollView *_pagingScrollView;
    UILabel *_locationTitle;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pagingScrollView = [[UIPagingScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIImage *backgroundImage = [UIImage imageNamed:@"gradient4"];
    _pagingScrollView.layer.contents = (id) backgroundImage.CGImage;
    //_pagingScrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gradient4"]];
    [self.view addSubview:_pagingScrollView];
    ResultsModel *resultsModel = [StateManager resultsArray][0];
    
    for (WeatherView *weatherView in self.weatherViewArray) {
        [_pagingScrollView addSubview:weatherView];
        [_pagingScrollView addWeatherView:weatherView];
    }

    [self createAddButton];
    _locationTitle.text = resultsModel.currentCity;
}

- (void)requestWeatherData:(NSString *)cityName withWeather:(WeatherView *)weatherView{
    WebRequest *webRequest = [[WebRequest alloc] init];
    [webRequest dataForHTTPRequestWithLocation:cityName];
    [webRequest gainWeatherModel:^(WeatherModel *weatherModel) {
        NSLog(@"%@-- %@-- %@",weatherModel.error,weatherModel.status,weatherModel.date);
        ResultsModel *resultsModel = weatherModel.resultsArray[0];
        NSLog(@"%@===%@",resultsModel.currentCity,resultsModel.pm25);
        for (IndexModel *indexModel in resultsModel.indexArray) {
            NSLog(@"-->>%@-->>%@-->>%@-->>%@",indexModel.title,indexModel.zs,indexModel.tipt,indexModel.des);
        }
        for (WeatherDataModel *weatherDataModel in resultsModel.weatherDataArray) {
            NSLog(@"-->>%@-->>%@-->>%@-->>%@-->>%@",weatherDataModel.date,weatherDataModel.dayPictureUrl,weatherDataModel.nightPictureUrl,weatherDataModel.wind,weatherDataModel.temperature);
        }
        RequestPicture *requestPicture = [[RequestPicture alloc] init];
        [requestPicture gainImage:^{
            [weatherView reloadView:resultsModel];
        }];
        [requestPicture requestPrictureWithArray:resultsModel.weatherDataArray];
    }];
}

- (void)createAddButton{
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(self.view.bounds.size.width - 35, 20, 30, 30);
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:40];
    addButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
}


- (void)buttonClicked:(id)sender{
    AddViewController *addVC = [[AddViewController alloc] init];
    addVC.delegate = self;
    [self presentViewController:addVC animated:YES completion:nil];
    [addVC release];
}

- (void)didAddLocationWithPlacemark:(CLPlacemark *)placemark{
    NSString *coordinateStr = [NSString stringWithFormat:@"%f,%f",placemark.location.coordinate.longitude,placemark.location.coordinate.latitude];
    NSMutableArray *coordinateArray = [[NSMutableArray alloc] initWithArray:[StateManager coordinateArray]];
    for (NSString *string in coordinateArray) {
        if ([coordinateStr isEqualToString:string]) {
            return;
        }
    }
    [coordinateArray addObject:coordinateStr];
    [StateManager setCoordinateArray:coordinateArray];
    WeatherView *weatherView = [[WeatherView alloc] initWithFrame:[UIScreen mainScreen].bounds resultsModel:nil];
    
    weatherView.tag = 100 + _pagingScrollView.subviews.count;
    [_pagingScrollView addSubview:weatherView];
    [_pagingScrollView addWeatherView:weatherView];

    [self requestWeatherData:coordinateStr withWeather:weatherView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
