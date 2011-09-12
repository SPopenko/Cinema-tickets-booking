//
//  CinemaTicketsBookingAppDelegate.h
//  CinemaTicketsBooking
//
//  Created by apol.dp on 9/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"

@class CinemaTicketsBookingViewController;

@interface CinemaTicketsBookingAppDelegate : NSObject <UIApplicationDelegate> {
    MKMapView *mapView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CinemaTicketsBookingViewController *viewController;

@end
