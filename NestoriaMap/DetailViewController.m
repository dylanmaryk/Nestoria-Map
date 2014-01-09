//
//  DetailViewController.m
//  NestoriaMap
//
//  Created by Dylan Maryk on 31/12/2013.
//  Copyright (c) 2013 Code Canopy. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize scrollView;
@synthesize propertyTitle;
@synthesize propertySubtitle;
@synthesize bathroomNo;
@synthesize bedroomNo;
@synthesize dataSrc;
@synthesize imgView;
@synthesize listerName;
@synthesize listerUrl;
@synthesize price;
@synthesize propertyTitleText;
@synthesize propertySubtitleText;
@synthesize bathroomNoText;
@synthesize bedroomNoText;
@synthesize dataSrcText;
@synthesize imgUrlText;
@synthesize listerNameText;
@synthesize listerUrlText;
@synthesize priceText;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    propertyTitle.text = propertyTitleText;
    propertySubtitle.text = propertySubtitleText;
    bathroomNo.text = bathroomNoText;
    bedroomNo.text = bedroomNoText;
    dataSrc.text = dataSrcText;
    imgView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrlText]]];
    listerName.text = listerNameText;
    listerUrl.text = listerUrlText;
    price.text = priceText;
}

- (void)viewDidLayoutSubviews
{
    [scrollView setContentSize:CGSizeMake(320, 564)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
