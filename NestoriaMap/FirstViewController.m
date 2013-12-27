//
//  FirstViewController.m
//  NestoriaMap
//
//  Created by Dylan Maryk on 25/12/2013.
//  Copyright (c) 2013 Code Canopy. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.mapView setDelegate:self];
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.distanceFilter = 10;
    [_locationManager startUpdatingLocation];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance([userLocation coordinate], 500, 500) animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    __block NSArray *annoations;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        annoations = [self parseJSON:newLocation];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [self.mapView addAnnotations:annoations];
        });
    });
}

- (NSMutableArray *)parseJSON:(CLLocation *)location {
    NSString *url = [NSString stringWithFormat:@"http://api.nestoria.co.uk/api?country=uk&pretty=1&action=search_listings&centre_point=%f,%f&encoding=json", location.coordinate.latitude, location.coordinate.longitude];
    
    NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
    
    NSMutableArray *annoationsArray = [[NSMutableArray alloc] init];
    
    NSError *error = nil;
    
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data
                                                    options:kNilOptions
                                                      error:&error];
    
    NSArray *listings = [[json valueForKey:@"response"] valueForKey:@"listings"];
    
    for (MapAnnotation *property in listings) {
        MapAnnotation *temp = [[MapAnnotation alloc] init];
        [temp setTitle:[property valueForKey:@"title"]];
        [temp setSubtitle:[property valueForKey:@"summary"]];
        [temp setCoordinate:CLLocationCoordinate2DMake([[property valueForKey:@"latitude"] floatValue], [[property valueForKey:@"longitude"] floatValue])];
        
        [annoationsArray addObject:temp];
    }
    
    return annoationsArray;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
