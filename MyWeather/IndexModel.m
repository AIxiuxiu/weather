//
//  IndexModel.m
//  MyWeather
//
//  Created by mac on 16-2-27.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "IndexModel.h"

@implementation IndexModel

- (void)dealloc{
    [_title release];
    [_zs release];
    [_tipt release];
    [_des release];
    [super dealloc];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)indexWithDictionary:(NSDictionary *)dict{
    return [[[self alloc]initWithDictionary:dict] autorelease];
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.zs forKey:@"zs"];
    [aCoder encodeObject:self.tipt forKey:@"tipt"];
    [aCoder encodeObject:self.des forKey:@"des"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.zs = [aDecoder decodeObjectForKey:@"zs"];
        self.tipt = [aDecoder decodeObjectForKey:@"tipt"];
        self.des = [aDecoder decodeObjectForKey:@"des"];
    }
    return self;
}

@end
