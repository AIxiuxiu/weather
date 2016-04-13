//
//  WeatherView.m
//  MyWeather
//
//  Created by mac on 16-2-28.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "WeatherView.h"
#import "MianTableViewCell.h"
#import "WeatherTableViewCell.h"
#import "IndexTableViewCell.h"
#import "WeatherDataModel.h"
#import "IndexModel.h"
#import "RequestPicture.h"
@implementation WeatherView

- (instancetype)initWithFrame:(CGRect)frame resultsModel:(ResultsModel *)resultsModel{
    self = [super initWithFrame:frame];
    if (self) {
        [self createTbaleView];
        [self backgroundImage];
        [self creatrLocationTitle];
        self.resultModel = resultsModel;
    }
    return self;
}

- (void)reloadView:(ResultsModel *)resultsModel{
    self.resultModel = resultsModel;
    _locationTitle.text = self.resultModel.currentCity;
    [self backgroundImage];
    [_tableView reloadData];
}

- (void)createTbaleView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, self.bounds.size.width, self.bounds.size.height - 60) style:UITableViewStylePlain];
    [_tableView setSeparatorInset:UIEdgeInsetsZero];
    [_tableView setLayoutMargins:UIEdgeInsetsZero];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.allowsSelection = NO;
    [_tableView registerClass:[MianTableViewCell class] forCellReuseIdentifier:@"mainCell"];
    [_tableView registerClass:[WeatherTableViewCell class] forCellReuseIdentifier:@"weatherCell"];
    [_tableView registerClass:[IndexTableViewCell class] forCellReuseIdentifier:@"indexCell"];
    [self addSubview:_tableView];
    
}

- (void)creatrLocationTitle{
    _locationTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.bounds.size.width, 44)];
    _locationTitle.textColor = [UIColor whiteColor];
    _locationTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    _locationTitle.text = self.resultModel.currentCity;
    _locationTitle.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_locationTitle];
}

- (void)backgroundImage{
    WeatherDataModel *weatherDataModel = [self.resultModel.weatherDataArray firstObject];
    NSArray *array = [weatherDataModel.date componentsSeparatedByString:@" "];
    NSString *buffStr = [array lastObject];
    NSString *temperatureStr = [buffStr substringWithRange:NSMakeRange(4, buffStr.length - 6)];
    CGFloat temperature = [temperatureStr floatValue];
    CGFloat fahrenheit = MIN(MAX(0,temperature * 1.8 + 32), 99);
    NSString *imageName = [NSString stringWithFormat:@"gradient%d.png", (int)floor(fahrenheit / 10.0)];
    UIImage *backgroundImage = [UIImage imageNamed:imageName];
    self.layer.contents = (id) backgroundImage.CGImage;
    //self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        MianTableViewCell *mainCell = [tableView dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
        [mainCell setSeparatorInset:UIEdgeInsetsZero];
        [mainCell setLayoutMargins:UIEdgeInsetsZero];
        mainCell.pmLabel.text = self.resultModel.pm25;
        WeatherDataModel *weatherDataModel = [self.resultModel.weatherDataArray firstObject];
        NSArray *array = [weatherDataModel.date componentsSeparatedByString:@" "];
        NSString *buffStr = [array lastObject];
        NSString *temperatureStr = [buffStr substringWithRange:NSMakeRange(4, buffStr.length - 5)];
        mainCell.temperatureLabel.text = temperatureStr;
        mainCell.windLabel.text = weatherDataModel.wind;
        return mainCell;
    } else if (indexPath.row >= 1 && indexPath.row <=4) {
        WeatherTableViewCell *weatherCell = [tableView dequeueReusableCellWithIdentifier:@"weatherCell" forIndexPath:indexPath];
        [weatherCell setSeparatorInset:UIEdgeInsetsZero];
        [weatherCell setLayoutMargins:UIEdgeInsetsZero];
        WeatherDataModel *weatherDataModel = self.resultModel.weatherDataArray[indexPath.row - 1] ;
        NSArray *array = [weatherDataModel.date componentsSeparatedByString:@" "];
        weatherCell.dateLabel.text = [array firstObject];

        weatherCell.dayImaegView.image = [RequestPicture readImage:weatherDataModel.dayPictureUrl];
        weatherCell.nightImageView.image = [RequestPicture readImage:weatherDataModel.nightPictureUrl];

        weatherCell.windLabel.text = weatherDataModel.wind;
        weatherCell.temperatureLabel.text = weatherDataModel.temperature;
        return weatherCell;
    } else if (indexPath.row >= 5 && indexPath.row <=11) {
        IndexTableViewCell *indexCell = [tableView dequeueReusableCellWithIdentifier:@"indexCell" forIndexPath:indexPath];
        [indexCell setSeparatorInset:UIEdgeInsetsZero];
        [indexCell setLayoutMargins:UIEdgeInsetsZero];
        IndexModel *indexModel = self.resultModel.indexArray[indexPath.row - 5];
        [indexCell heightWithIndexModel:indexModel];
        indexCell.titleLabel.text = indexModel.title;
        indexCell.zsLabel.text = indexModel.zs;
        indexCell.tiptLabel.text = indexModel.tipt;
        indexCell.desLabel.text = indexModel.des;
        return indexCell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 260;
    } else if (indexPath.row >= 1 && indexPath.row <=4) {
        return 40;
    } else if (indexPath.row >= 5 && indexPath.row <=11){
        IndexTableViewCell *indexCell = [[[IndexTableViewCell alloc] init] autorelease];
        IndexModel *indexModel = self.resultModel.indexArray[indexPath.row - 5];
        [indexCell heightWithIndexModel:indexModel];
        return indexCell.height;
    }
    return 0;
}

@end
