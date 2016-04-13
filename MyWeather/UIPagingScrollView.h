//
//  UIPagingScrollView.h
//  MyWeather
//
//  Created by mac on 16-2-28.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPagingScrollView : UIScrollView

- (void)addWeatherView:(UIView *)weatherView;

- (void)insertWeatherView:(UIView *)weatherView atIndex:(NSInteger)index;

- (void)removeWeatherView:(UIView *)weatherView;

@end
