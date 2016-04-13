//
//  WeatherView.h
//  MyWeather
//
//  Created by mac on 16-2-28.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultsModel.h"
@interface WeatherView : UIView<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) ResultsModel *resultModel;
@property (nonatomic, retain) UILabel *locationTitle;

- (instancetype)initWithFrame:(CGRect)frame resultsModel:(ResultsModel *)resultsModel;
- (void)reloadView:(ResultsModel *)resultsModel;

@end
