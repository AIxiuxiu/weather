//
//  UIPagingScrollView.m
//  MyWeather
//
//  Created by mac on 16-2-28.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "UIPagingScrollView.h"

@implementation UIPagingScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.pagingEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.alwaysBounceHorizontal = YES;
    }
    return self;
}

- (void)addWeatherView:(UIView *)weatherView{
    [weatherView setFrame:CGRectMake(self.bounds.size.width * (self.subviews.count - 1), 0, weatherView.bounds.size.width, weatherView.bounds.size.height)];
    [self setContentSize:CGSizeMake(self.bounds.size.width * self.subviews.count, self.contentSize.height)];
}

- (void)insertWeatherView:(UIView *)weatherView atIndex:(NSInteger)index{
    [weatherView setFrame:CGRectMake(self.bounds.size.width * index, 0, weatherView.bounds.size.width, weatherView.bounds.size.height)];
    for(NSInteger i = index + 1; i < self.subviews.count; ++i) {
        UIView *subview = [self.subviews objectAtIndex:i];
        [subview setFrame:CGRectMake(self.bounds.size.width * i, 0, weatherView.bounds.size.width, weatherView.bounds.size.height)];
    }
    [self setContentSize:CGSizeMake(self.bounds.size.width * self.subviews.count, self.contentSize.height)];
}

- (void)removeWeatherView:(UIView *)subview
{
    NSUInteger index = [self.subviews indexOfObject:subview];
    if(index != NSNotFound) {
        NSInteger count = [self.subviews count];
        for(NSUInteger i = index + 1; i < count; ++i) {
            UIView *view = [self.subviews objectAtIndex:i];
            [view setFrame:CGRectOffset(view.frame, -subview.bounds.size.width, 0)];
        }
        [subview removeFromSuperview];
        [self setContentSize:CGSizeMake(self.bounds.size.width * self.subviews.count, self.contentSize.height)];
    } else {
       
    }
}

@end
