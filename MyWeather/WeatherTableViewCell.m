//
//  WeatherTableViewCell.m
//  MyWeather
//
//  Created by mac on 16-2-28.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "WeatherTableViewCell.h"

@implementation WeatherTableViewCell

- (void)dealloc{
    [_dateLabel release];
    [_dayImaegView release];
    [_nightImageView release];
    [_windLabel release];
    [_temperatureLabel release];
    [super dealloc];
}

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)createSubView{
    [self createDateLabel];
    [self createDayImaegView];
    [self createNightImaegView];
    [self createTemperatureLabel];
    [self createWindLabel];
}

- (void)createDateLabel{
    _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 40, 30)];
    _dateLabel.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:_dateLabel];
}

- (void)createDayImaegView{
    _dayImaegView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 5, 30, 30)];
    [self.contentView addSubview:_dayImaegView];
}

- (void)createNightImaegView{
    _nightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(120, 5, 30, 30)];
    [self.contentView addSubview:_nightImageView];
}

- (void)createWindLabel{
    _windLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 5, 100, 30)];
    _windLabel.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:_windLabel];
}

- (void)createTemperatureLabel{
    _temperatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(280, 5, 85, 30)];
    _temperatureLabel.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:_temperatureLabel];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
