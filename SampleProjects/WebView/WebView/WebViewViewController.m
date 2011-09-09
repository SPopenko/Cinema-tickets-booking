//
//  WebViewViewController.m
//  WebView
//
//  Created by Mac OS User on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WebViewViewController.h"

@implementation WebViewViewController
@synthesize map;

- (void)dealloc
{
    self.map = nil;
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
    
    CLLocationCoordinate2D location =  [map userLocation].location.coordinate;
    [map setCenterCoordinate:location animated:NO];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.map = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
