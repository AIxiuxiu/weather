//
//  AddViewController.m
//  MyWeather
//
//  Created by mac on 16-2-29.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()
{
    UISearchController *_searchController;
    CLGeocoder      *_geocoder;
    NSMutableArray  *_searchResults;
    UITableView *_tableView;
    
}
@end

@implementation AddViewController

- (void)dealloc{
     NSLog(@"add-dealloc");
    [_geocoder release];
    [_searchResults release];
    [_searchController release];
    [_tableView release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _geocoder = [[CLGeocoder alloc] init];
    _searchResults = [[NSMutableArray alloc] initWithCapacity:0];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createSearchView];
}

- (void)createSearchView{
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchBar.frame = CGRectMake(0, 0, self.view.bounds.size.width, 44);
    _searchController.searchBar.placeholder = @"城市";
    _searchController.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    _searchController.searchBar.delegate = self;
    _searchController.searchResultsUpdater = self;
    _searchController.dimsBackgroundDuringPresentation = YES;
    _searchController.hidesNavigationBarDuringPresentation = YES;
    
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor grayColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableFooterView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    [self.view addSubview:_tableView];
    _tableView.tableHeaderView = _searchController.searchBar;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    //[_searchController.searchBar becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    [_searchController setActive:NO];
    [_searchController.searchBar resignFirstResponder];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    [searchBar setShowsCancelButton:YES animated:YES];
    for (UIView *view in searchBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UIView")] && view.subviews.count > 0) {
            for (UIView *subview in view.subviews) {
                if ([subview isKindOfClass:[UIButton class]]){
                    UIButton *button = (UIButton *)subview;
                    [button setTitle:@"搜索" forState:UIControlStateNormal];
                    [button setTitle:@"搜索" forState:UIControlStateHighlighted];
                }
            }
        }
    }
    return YES;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString *searchString = [searchController.searchBar text];
    NSLog(@"%@",searchString);
//    NSMutableArray
//    *userDefaultLanguages = [[NSUserDefaults standardUserDefaults]objectForKey:@"AppleLanguages"];
    [[NSUserDefaults
      standardUserDefaults] setObject:[NSArray arrayWithObjects:@"zh-hans",nil] forKey:@"AppleLanguages"];
    [_geocoder geocodeAddressString:searchString completionHandler: ^ (NSArray *placemarks, NSError *error) {
        for(CLPlacemark *placemark in placemarks) {
            if(placemark.locality) {
                NSLog(@"%@",placemark.locality);
                [_searchResults addObject:placemark];
            }
        }
        [_tableView reloadData];
    }];
//    [[NSUserDefaults
//      standardUserDefaults] setObject:userDefaultLanguages
//     forKey:@"AppleLanguages"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
        CLPlacemark *placemark = _searchResults[indexPath.row];
        NSString *city = placemark.locality;
        NSString *country = placemark.country;
        NSString *cellText = [NSString stringWithFormat:@"%@, %@", city, country];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.text = cellText;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].selected = NO;
    CLPlacemark *placemark = [_searchResults objectAtIndex:indexPath.row];
    [self.delegate didAddLocationWithPlacemark:placemark];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [_searchResults removeAllObjects];
//    [self setEditing:YES];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
