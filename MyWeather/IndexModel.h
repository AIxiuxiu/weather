//
//  IndexModel.h
//  MyWeather
//
//  Created by mac on 16-2-27.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IndexModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *zs;
@property (nonatomic, copy) NSString *tipt;
@property (nonatomic, copy) NSString *des;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)indexWithDictionary:(NSDictionary *)dict;

@end
