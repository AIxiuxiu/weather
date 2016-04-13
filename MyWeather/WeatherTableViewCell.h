//
//  WeatherTableViewCell.h
//  MyWeather
//
//  Created by mac on 16-2-28.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherTableViewCell : UITableViewCell

@property (nonatomic, retain) UILabel *dateLabel;
@property (nonatomic, retain) UIImageView *dayImaegView;
@property (nonatomic, retain) UIImageView *nightImageView;
@property (nonatomic, retain) UILabel *windLabel;
@property (nonatomic, retain) UILabel *temperatureLabel;

@end
