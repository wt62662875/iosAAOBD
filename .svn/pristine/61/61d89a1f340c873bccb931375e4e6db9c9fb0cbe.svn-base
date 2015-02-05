//
//  MapViewController.m
//  AAOBD
//
//  Created by oi on 29/1/15.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "MapViewController.h"
#import "NaviAndHisView.h"
#import "public.h"
@interface MapViewController ()<UISearchBarDelegate,NaviAndHisViewDelegate,AMapSearchDelegate,UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) AMapGeoPoint* endPoint;
@property (nonatomic, retain) AMapGeoPoint* starPoint;
@property (nonatomic, retain) NSString* endCity;
@end

@implementation MapViewController{
    NaviAndHisView *navAndHistroyView;
    UITableView *_tableView;
    NSArray *dataArr;
    NSString *_searchCity;
    AMapTip  *selectAddr;
}

- (void)viewDidLoad {
    self.title = @"地图";
    [super viewDidLoad];
    
   
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self initData];
    [self initTableView];
    [self configMapView];
    [self initNaviAndHisView];
    [self setSearchBarSyle];
    
    _searchBar.text = @"";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initData{
    
    _searchCity = @"重庆";
    if (dataArr== nil) {
        dataArr =[[NSArray alloc]init];
    }
    if (_endPoint == nil) {
        _endPoint =[[AMapGeoPoint alloc]init];
    }
    
    
}
#pragma mark  - initTableView
-(void)initTableView{
    int frame_x = 0;
    int frame_y = _searchBar.frame.origin.y + _searchBar.frame.size.height;
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(frame_x, frame_y, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    }
    [_tableView setFrame:CGRectMake(frame_x, frame_y, self.view.bounds.size.width, self.view.bounds.size.height)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.hidden = YES;
    [self.view insertSubview:_tableView belowSubview:_searchBar];
    
    
}
#pragma mark - mapView
- (void)configMapView
{
//    [self.mapView setDelegate:self];
    
    [self.mapView setFrame:self.view.bounds];
    
    [self.mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES];//地图跟着位置移动
    
    [self.mapView setZoomLevel:16.0 animated:YES];
    
    self.mapView.showsUserLocation = YES;//显示当前位置
}
#pragma mark-初始化导航历史轨迹view
-(void)initNaviAndHisView{
    navAndHistroyView=[[[NSBundle mainBundle]loadNibNamed:@"NaviAndHisView" owner:self options:nil]objectAtIndex:0];
    [navAndHistroyView setHidden:NO];
    [navAndHistroyView setFrame:CGRectMake(20, self.mapView.frame.size.height- 70, 160,45)];
    navAndHistroyView.delegate = self;
    [self.view addSubview:navAndHistroyView];
        
}
- (void)setSearchBarSyle{
    _searchBar.layer.shadowColor = [UIColor redColor].CGColor;
    _searchBar.showsCancelButton = YES;
}

#pragma mark - searchBar代理

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
    _tableView.hidden = NO;
    navAndHistroyView.hidden = YES;
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    [self setAmapSeach];
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [_searchBar resignFirstResponder];
    _tableView.hidden = YES;
    navAndHistroyView.hidden = NO;
}
-(void)setAmapSeach{
    //构造AMapInputTipsSearchRequest对象，keywords为必选项，city为可选项
    AMapInputTipsSearchRequest *tipsRequest= [[AMapInputTipsSearchRequest alloc] init];
    tipsRequest.searchType = AMapSearchType_InputTips;
    tipsRequest.keywords = _searchBar.text;
    tipsRequest.city = @[_searchCity];
    
    //发起输入提示搜索
    [self.search AMapInputTipsSearch: tipsRequest];
    
}

#pragma mark - navAndHistroyView代理
//历史轨迹
-(void)onclickHisBtn:(NSArray *)hisArr AndNavi:(NSArray *)naviArr{
    [self performSegueWithIdentifier:@"history" sender:nil];

}
//导航
-(void)onclickNaviBtn:(NSArray *)hisBtn AndNavi:(NSArray *)naviArr{
    if ([_searchBar.text isEqualToString:@""]) {
         [[[UIAlertView alloc]initWithTitle:APPNAME message:@"请输入终点" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil]show];
        return;
    }
    
    NSString *urlString = [[NSString stringWithFormat:@"iosamap://navi?sourceApplication=%@&backScheme=%@&poiname=%@&lat=%f&lon=%f&dev=1&style=2",@"AAOBD",@"com.AAOBD", selectAddr.name,  _endPoint.latitude,  _endPoint.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:urlString]]){
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlString]];

    }else{
        [[[UIAlertView alloc]initWithTitle:APPNAME message:@"没有高德导航" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil, nil]show];
    }
    
}

#pragma mark -alertViewDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
          
            [_searchBar becomeFirstResponder];
         break;
            
        default:
            break;
    }

}

#pragma mark- TableViewDataSoure
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 70.0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIndefine = @"cellIndefine";
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellIndefine];
    if (cell == nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndefine];
    }
    
    if (dataArr.count > 0) {
        
        AMapTip *p =[dataArr objectAtIndex:indexPath.row];
        cell.textLabel.text =p.name;
        cell.detailTextLabel.text = p.district;
        
    }
    
    return cell;
}
#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (dataArr.count >0) {
        selectAddr = [dataArr objectAtIndex:indexPath.row];
        _searchBar.text = selectAddr.name;
        _tableView.hidden = YES;
        navAndHistroyView.hidden = NO;
        [_searchBar resignFirstResponder];
        if (selectAddr != nil) {
            //地理编码
            AMapGeocodeSearchRequest *geo = [[AMapGeocodeSearchRequest alloc] init];
            geo.searchType = AMapSearchType_Geocode;
            geo.address = selectAddr.name;
            geo.city = @[selectAddr.district];
            [self.search AMapGeocodeSearch:geo];
            
        }
    }
    
}
#pragma mark- AMapSearchDelegate
//实现输入提示的回调函数
-(void)onInputTipsSearchDone:(AMapInputTipsSearchRequest*)request response:(AMapInputTipsSearchResponse *)response
{
    if(response.tips.count == 0)
    {
        return;
    }
    
    //通过AMapInputTipsSearchResponse对象处理搜索结果
    dataArr = response.tips;
    [_tableView reloadData];
    [_searchBar resignFirstResponder];
    
}

//地理编码回调
- (void)onGeocodeSearchDone:(AMapGeocodeSearchRequest *)request response:(AMapGeocodeSearchResponse *)response
{
    if (response.geocodes.count == 0)
    {
        return;
    }
    
    [response.geocodes enumerateObjectsUsingBlock:^(AMapGeocode *obj, NSUInteger idx, BOOL *stop) {
        if (obj.location == nil) {
            return;
        }
        
        _endPoint = [AMapGeoPoint locationWithLatitude:obj.location.latitude longitude:obj.location.longitude];
        
    }];
    
}

#pragma mark - NavigationReturn
-(void)returnAction{
    if (_tableView.hidden == NO) {
        [_searchBar resignFirstResponder];
        _tableView.hidden = YES;
        navAndHistroyView.hidden = NO;
        return;
    }
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    navAndHistroyView.delegate = nil;

}
#pragma mark - 高德地图代理
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        //取出当前位置的坐标
        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
        _starPoint  = [AMapGeoPoint locationWithLatitude:userLocation.coordinate.latitude longitude:userLocation.coordinate.longitude];
    }
}
@end
