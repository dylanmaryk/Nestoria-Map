//
//  DetailViewController.h
//  NestoriaMap
//
//  Created by Dylan Maryk on 31/12/2013.
//  Copyright (c) 2013 Code Canopy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UILabel *propertyTitle;
@property (nonatomic, retain) IBOutlet UILabel *propertySubtitle;
@property (nonatomic, retain) IBOutlet UILabel *bathroomNo;
@property (nonatomic, retain) IBOutlet UILabel *bedroomNo;
@property (nonatomic, retain) IBOutlet UILabel *dataSrc;
@property (nonatomic, retain) IBOutlet UIImageView *imgView;
@property (nonatomic, retain) IBOutlet UILabel *listerName;
@property (nonatomic, retain) IBOutlet UILabel *listerUrl;
@property (nonatomic, retain) IBOutlet UILabel *price;
@property (nonatomic, copy) NSString *propertyTitleText;
@property (nonatomic, copy) NSString *propertySubtitleText;
@property (nonatomic, copy) NSString *bathroomNoText;
@property (nonatomic, copy) NSString *bedroomNoText;
@property (nonatomic, copy) NSString *dataSrcText;
@property (nonatomic, copy) NSString *imgUrlText;
@property (nonatomic, copy) NSString *listerNameText;
@property (nonatomic, copy) NSString *listerUrlText;
@property (nonatomic, copy) NSString *priceText;

@end
