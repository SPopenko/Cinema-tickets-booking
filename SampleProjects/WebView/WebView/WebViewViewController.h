//
//  WebViewViewController.h
//  WebView
//
//  Created by Mac OS User on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface WebViewViewController : UIViewController {
    IBOutlet MKMapView* map;
}

@property(nonatomic, retain) IBOutlet MKMapView* map;

@end
