//
//  BaseMapViewController.m
//  AAOBD
//
//  Created by oi on 29/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "BaseMapViewController.h"
#import "public.h"

@implementation BaseMapViewController
@synthesize mapView = _mapView;
@synthesize search  = _search;

#pragma mark - Utility

- (void)clearMapView
{
    self.mapView.showsUserLocation = NO;
    
//    [self.mapView removeAnnotations:self.mapView.annotations];
//    
//    [self.mapView removeOverlays:self.mapView.overlays];
    
    self.mapView.delegate = nil;
}

- (void)clearSearch
{
    self.search.delegate = nil;
}

#pragma mark - Handle Action

- (void)returnAction
{
    [self.navigationController popViewControllerAnimated:YES];
    
    [self clearMapView];
    
    [self clearSearch];
}

#pragma mark - AMapSearchDelegate

- (void)searchRequest:(id)request didFailWithError:(NSError *)error
{
    NSLog(@"%s: searchRequest = %@, errInfo= %@", __func__, [request class], error);
}

#pragma mark - Initialization

- (void)initMapView
{
    if (self.mapView == nil) {
        self.mapView = [[MAMapView alloc]initWithFrame:self.view.bounds];
    }
    [self.mapView setZoomLevel:10.0 animated:YES];
    [self.view addSubview:self.mapView];
}

- (void)initSearch
{
    if (self.search == nil) {
        self.search = [[AMapSearchAPI alloc]initWithSearchKey:MAPKEY Delegate:self];
    }
    self.search.delegate = self;
}

- (void)initBaseNavigationBar
{
    
    UIButton *lButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [lButton setFrame:CGRectMake(0, 0, 50, 50)];
    [lButton addTarget:self action:@selector(returnAction) forControlEvents:UIControlEventTouchUpInside];
    [lButton setImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
    [lButton setImage:[UIImage imageNamed:@"return-clicked"] forState:UIControlStateHighlighted];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:lButton];
                                             //[[UIBarButtonItem alloc] initWithTitle:@"Back"
//                                                                             style:UIBarButtonItemStyleBordered
//                                                                            target:self
//                                                                            action:@selector(returnAction)];

    
    
    
}

- (void)initTitle:(NSString *)title
{
    UILabel *titleLabel = [[UILabel alloc] init];
    
    titleLabel.backgroundColor  = [UIColor clearColor];
    titleLabel.textColor        = [UIColor whiteColor];
    titleLabel.text             = title;
    [titleLabel sizeToFit];
    
    self.navigationItem.titleView = titleLabel;
}

#pragma mark - Life Cycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.mapView.visibleMapRect = MAMapRectMake(220880104, 101476980, 272496, 466656);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initTitle:self.title];
    
    [self initBaseNavigationBar];
    
    [self initMapView];
    
    [self initSearch];
}

@end



