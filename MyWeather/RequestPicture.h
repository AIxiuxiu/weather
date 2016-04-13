//
//  RequestPicture.h
//  MyWeather
//
//  Created by mac on 16-2-27.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "WeatherDataModel.h"
typedef void(^PictureBlock)();
@interface RequestPicture : NSObject<ASIHTTPRequestDelegate>
{
    NSArray *_nameArray;
    PictureBlock _pictureBlock;
}

- (void)requestPrictureWithArray:(NSArray *)weatherDataModelArray;
- (void)gainImage:(PictureBlock)pictureBlock;
+ (UIImage *)readImage:(NSString *)name;

@end
