//
//  CinemaTicketsBookingViewController.m
//  CinemaTicketsBooking
//
//  Created by apol.dp on 9/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CinemaTicketsBookingViewController.h"

@implementation CinemaTicketsBookingViewController

@synthesize mapView;

- (void)dealloc
{
    self.mapView = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
 
    MKCoordinateRegion region;
    MKCoordinateSpan   span;
    
    span.latitudeDelta  = 0.05;
    span.longitudeDelta = 0.05;
    
    
    region.span = span;
    
    CLLocationCoordinate2D location;
    
    //location = [mapView centerCoordinate];
    location.latitude  = 37.786996;
    location.longitude = -122.440100;
    
    region.center = location;
    
    self.mapView.showsUserLocation = YES;
    
    [self.mapView setRegion:region animated:YES];
    [self.mapView regionThatFits:region];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.mapView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
