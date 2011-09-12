//
//  CinemaTicketsBookingViewController.h
//  CinemaTicketsBooking
//
//  Created by apol.dp on 9/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"


@interface CinemaTicketsBookingViewController : UIViewController {
    MKMapView *mapView;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
