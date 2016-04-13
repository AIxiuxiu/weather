//
//  MianTableViewCell.m
//  MyWeather
//
//  Created by mac on 16-2-28.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "MianTableViewCell.h"

@implementation MianTableViewCell

- (void)dealloc{
    [_pmLabel release];
    [_temperatureLabel release];
    [_windLabel release];
    [super dealloc];
}

- (void)awakeFromNib {
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
    [self createPmLabel];
    [self createTemperatureLabel];
    [self createWindLabel];

}

- (void)createPmLabel{
    UILabel *PM = [[UILabel alloc] initWithFrame:CGRectMake(240, 20, 80, 30)];
    PM.text = @"空气质量:";
    PM.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:PM];
    [PM release];
    
    _pmLabel = [[UILabel alloc] initWithFrame:CGRectMake(320, 20, 50, 30)];
    _pmLabel.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:_pmLabel];
}

- (void)createTemperatureLabel{
    _temperatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 130, 200, 80)];
    _temperatureLabel.font = [UIFont systemFontOfSize:60];
    [self.contentView addSubview:_temperatureLabel];
}

- (void)createWindLabel{
    _windLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 210, 120, 40)];
    _windLabel.font = [UIFont systemFontOfSize:22];
    [self.contentView addSubview:_windLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
