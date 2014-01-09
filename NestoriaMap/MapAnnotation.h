//
//  MapAnnoation.h
//  NestoriaMap
//
//  Created by Dylan Maryk on 26/12/2013.
//  Copyright (c) 2013 Code Canopy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *bathroomNo;
@property (nonatomic, copy) NSString *bedroomNo;
@property (nonatomic, copy) NSString *dataSrc;
@property (nonatomic, copy) NSString *imgUrl;
@property (nonatomic, copy) NSString *listerName;
@property (nonatomic, copy) NSString *listerUrl;
@property (nonatomic, copy) NSString *price;

@end
