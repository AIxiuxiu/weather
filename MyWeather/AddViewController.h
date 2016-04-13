//
//  AddViewController.h
//  MyWeather
//
//  Created by mac on 16-2-29.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@protocol AddLocationViewControllerDelegate <NSObject>
- (void)didAddLocationWithPlacemark:(CLPlacemark *)placemark;
@end

@interface AddViewController : UIViewController<UISearchBarDelegate,UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate>

@property (nonatomic, assign) id<AddLocationViewControllerDelegate>delegate;

@end
