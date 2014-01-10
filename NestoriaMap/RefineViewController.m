//
//  RefineViewController.m
//  NestoriaMap
//
//  Created by Dylan Maryk on 10/01/2014.
//  Copyright (c) 2014 Code Canopy. All rights reserved.
//

#import "RefineViewController.h"

@interface RefineViewController ()

@end

@implementation RefineViewController

@synthesize scrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews
{
    [scrollView setContentSize:CGSizeMake(320, 408)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
