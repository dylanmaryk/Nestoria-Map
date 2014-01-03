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

@synthesize locationManager;
@synthesize propertyMapView;
@synthesize popoverController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    propertyMapView.delegate = self;
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = 10;
    [locationManager startUpdatingLocation];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    [self.propertyMapView setRegion:MKCoordinateRegionMakeWithDistance([userLocation coordinate], 500, 500) animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSArray *annoations = [self parseJSON:newLocation];
    
    [propertyMapView addAnnotations:annoations];
}

- (NSMutableArray *)parseJSON:(CLLocation *)location
{
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
        temp.title = [property valueForKey:@"title"];
        temp.subtitle = [property valueForKey:@"summary"];
        temp.coordinate = CLLocationCoordinate2DMake([[property valueForKey:@"latitude"] floatValue], [[property valueForKey:@"longitude"] floatValue]);
        temp.bathroomNo = [property valueForKey:@"bathroom_number"];
        temp.bedroomNo = [property valueForKey:@"bedroom_number"];
        temp.dataSrc = [property valueForKey:@"datasource_name"];
        temp.imgUrl = [property valueForKey:@"img_url"];
        temp.listerName = [property valueForKey:@"lister_name"];
        temp.listerUrl = [property valueForKey:@"lister_url"];
        temp.price = [property valueForKey:@"price_formatted"];
        
        [annoationsArray addObject:temp];
    }
    
    return annoationsArray;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    NSString *identifier = @"PinLocation";
    
    if ([annotation isKindOfClass:[MapAnnotation class]]) {
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[propertyMapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (annotationView == nil)
            annotationView = [[MKPinAnnotationView alloc]
                              initWithAnnotation:annotation
                              reuseIdentifier:identifier];
        else
            annotationView.annotation = annotation;
        
        annotationView.canShowCallout = YES;
        annotationView.animatesDrop = YES;
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [annotationView setRightCalloutAccessoryView:rightButton];
        
        return annotationView;
    }
    
    return nil;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    // MapAnnotation *annotation = (MapAnnotation *)[view annotation];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        DetailViewController *detailViewController = [[DetailViewController alloc] init];
        
        popoverController = [[UIPopoverController alloc] initWithContentViewController:detailViewController];
        [popoverController presentPopoverFromRect:view.frame inView:mapView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    } else
        [self performSegueWithIdentifier:@"showPropertyDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
