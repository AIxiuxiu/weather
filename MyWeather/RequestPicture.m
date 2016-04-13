//
//  RequestPicture.m
//  MyWeather
//
//  Created by mac on 16-2-27.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "RequestPicture.h"
#import "ASINetworkQueue.h"

@implementation RequestPicture

+ (UIImage *)readImage:(NSString *)name{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *nameString = [RequestPicture getPictureName:name];
    BOOL isExist = [fileManager fileExistsAtPath:[RequestPicture filePath:nameString]];
    UIImage *image = nil;
    if (isExist) {
        image = [UIImage imageWithContentsOfFile:[RequestPicture filePath:nameString]];
    }
    return image;
}

- (void)requestPrictureWithArray:(NSArray *)weatherDataModelArray{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    _nameArray = [self getRequestArray:weatherDataModelArray];
    for (int i = 0; i < _nameArray.count - 1; i++) {
        NSString *nameString = [RequestPicture getPictureName:_nameArray[i]];
        NSLog(@"%@",nameString);
        
        BOOL isExist = [fileManager fileExistsAtPath:[RequestPicture filePath:nameString]];
        if (isExist) {
            _pictureBlock();
        } else {
            NSURL *url = [NSURL URLWithString:_nameArray[i]];
            ASINetworkQueue *netWorkQueue = [[ASINetworkQueue alloc] init];
            netWorkQueue.delegate = self;
            [netWorkQueue setRequestDidFinishSelector:@selector(requestFinished:)];
            ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
            request.tag = i;
            request.timeOutSeconds = 30.0;
            [netWorkQueue addOperation:request];
            [netWorkQueue go];
        }
    }
}

- (NSArray *)getRequestArray:(NSArray *)array{
    NSMutableArray *weatherArray = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
    for (WeatherDataModel *weatherDataModel in array) {
        NSString *dayString = weatherDataModel.dayPictureUrl;
        NSString *nightString = weatherDataModel.nightPictureUrl;
        [weatherArray addObject:dayString];
        [weatherArray addObject:nightString];
    }
    NSSet *set = [NSSet setWithArray:weatherArray];
    [weatherArray removeAllObjects];
    for (NSString *string in set) {
        [weatherArray addObject:string];
        NSLog(@"%@",string);
    }
    return weatherArray;
}

- (void)gainImage:(PictureBlock)pictureBlock{
    _pictureBlock = Block_copy(pictureBlock);
}

- (void)requestFailed:(ASIHTTPRequest *)request{
    NSLog(@"请求失败");
}

- (void)requestFinished:(ASIHTTPRequest *)request{
    NSLog(@"%@",request.error);
    NSString *nameString = [RequestPicture getPictureName:_nameArray[request.tag]];
    NSLog(@"%@",nameString);
    NSLog(@"%@",request.responseData);
    BOOL isSuccess = [request.responseData writeToFile:[RequestPicture filePath:nameString]atomically:YES];
    if (isSuccess) {
        NSLog(@"下载成功");
    }
    _pictureBlock();
}

+ (NSString *)filePath:(NSString *)name{
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:name];
}

+ (NSString *)getPictureName:(NSString *)urlString{
    NSString *name = [urlString stringByReplacingOccurrencesOfString:@"/" withString:@"%"];
    return name;
}

@end
