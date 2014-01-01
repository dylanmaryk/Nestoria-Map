//
//  MapAnnoation.h
//  NestoriaMap
//
//  Created by Dylan Maryk on 26/12/2013.
//  Copyright (c) 2013 Code Canopy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject <MKAnnotation> {
    int propertyId;
    NSString *title;
    NSString *subtitle;
    CLLocationCoordinate2D coordinate;
}

@property (nonatomic) int propertyId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end
