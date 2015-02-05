//
//  HistoryAndMapViewController.m
//  AAOBD
//
//  Created by oi on 21/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "HistoryAndMapViewController.h"
#import "public.h"
@interface HistoryAndMapViewController ()<MAMapViewDelegate>
@property(nonatomic,retain)MAMapView *mapView;
@end

@implementation HistoryAndMapViewController{


    MAPolyline *_polyline;
    NSArray * pioArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initMapView];
    [self drawLine:pioArray];
}
-(void)initMapView{
    if (_mapView == nil) {
        _mapView = [[MAMapView alloc]initWithFrame:self.view.bounds];
//        [_mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES];//地图跟着位置移动
        [_mapView setZoomLevel:16.1 animated:YES];
//        _mapView.showsUserLocation = YES;//显示当前位置
        CLLocation *loc = pioArray[0];
        [_mapView setCenterCoordinate:loc.coordinate animated:YES];
        _mapView.delegate = (id)self;
        [self.view addSubview:_mapView];
    }


}
-(void)initData{
//    CLLocationCoordinate2D polylineCoords[2];
//    polylineCoords[0].latitude = 29.522900;
//    polylineCoords[0].longitude = 106.563614;
//    polylineCoords[1].latitude = 29.508009;
//    polylineCoords[1].longitude = 106.513976;

    CLLocation * lco1 =[[CLLocation alloc]initWithLatitude:29.522900 longitude:106.563614];
    CLLocation * lco2 =[[CLLocation alloc]initWithLatitude:29.508009 longitude:106.513976];
   
    pioArray = @[lco1,lco2];
    
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
    [_mapView addOverlay:lineOne];// 向地图窗口添加Overlay，需要实现MAMapViewDelegate的-mapView:viewForOverlay:函数来生成标注对应的View

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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
