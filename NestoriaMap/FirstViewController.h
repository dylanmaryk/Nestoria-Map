//
//  FirstViewController.h
//  NestoriaMap
//
//  Created by Dylan Maryk on 25/12/2013.
//  Copyright (c) 2013 Code Canopy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "DetailViewController.h"
#import "MapAnnotation.h"

@interface FirstViewController : UIViewController <NSURLSessionDelegate, MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *propertyMapView;
@property (strong, nonatomic) NSMutableArray *listingsArray;

@end
