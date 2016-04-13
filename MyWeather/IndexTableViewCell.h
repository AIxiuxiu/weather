//
//  IndexTableViewCell.h
//  MyWeather
//
//  Created by mac on 16-2-28.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndexModel.h"
@interface IndexTableViewCell : UITableViewCell

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *zsLabel;
@property (nonatomic, retain) UILabel *tiptLabel;
@property (nonatomic, retain) UILabel *desLabel;
@property (nonatomic, assign) CGFloat height;
- (void)heightWithIndexModel:(IndexModel *)indexModel;

@end
