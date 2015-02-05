//
//  TrajectoryViewController.m
//  AAOBD
//
//  Created by oi on 29/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "TrajectoryViewController.h"

@interface TrajectoryViewController ()

@end

@implementation TrajectoryViewController{

    MAPolyline *_polyline;
    NSArray * pioArray;
}

- (void)viewDidLoad {
    self.title = @"历史轨迹";
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initData];
    [self configMapView];
    [self drawLine:pioArray];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initData{

    
    CLLocation * lco1 =[[CLLocation alloc]initWithLatitude:29.522900 longitude:106.563614];
    CLLocation * lco2 =[[CLLocation alloc]initWithLatitude:29.508009 longitude:106.513976];
    
    pioArray = @[lco1,lco2];
    
}

-(void)configMapView{
    
    [self.mapView setFrame:self.view.bounds];
    self.mapView.delegate = self;
    CLLocation *loc = pioArray[0];
    [self.mapView setCenterCoordinate:loc.coordinate animated:YES];
    [self.mapView setZoomLevel:16.0 animated:YES];

}

-(void)drawLine:(NSArray *)wayPOIs{
    
    CLLocationCoordinate2D polylineCoords[wayPOIs.count];
    
    if (wayPOIs.count >0 ) {
        for (int i = 0; i < wayPOIs.count; i++) {
            CLLocation *polylineCoord = [wayPOIs objectAtIndex:i];
            
            polylineCoords[i].latitude = polylineCoord.coordinate.latitude;
            polylineCoords[i].longitude = polylineCoord.coordinate.longitude;
        }
        
    }
    
    MAPolyline *lineOne = [MAPolyline polylineWithCoordinates:polylineCoords count:wayPOIs.count];
    [self.mapView addOverlay:lineOne];// 向地图窗口添加Overlay，需要实现MAMapViewDelegate的-mapView:viewForOverlay:函数来生成标注对应的View
    
}
-(MAOverlayView *)mapView:(MAMapView *)mapView viewForOverlay:(id<MAOverlay>)overlay{
    
    if ([overlay isKindOfClass:[MAPolyline class]]){
        
        MAPolylineView *lineView = [[MAPolylineView alloc] initWithPolyline: overlay];
        
        lineView.lineWidth = 5.0f;
        
        lineView.strokeColor = [UIColor redColor];
        
        lineView.fillColor = [UIColor blackColor];
        
        return lineView;
        
    }
    
    
    return nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
