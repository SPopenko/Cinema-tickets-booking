//
//  CLLocationManager+Init.m
//  Tickets
//
//  Created by Anton Poluboiarynov on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CLLocationManager+Init.h"
#import <CoreLocation/CLLocation.h>

@implementation CLLocationManager (Init)

- (id) initWithDelegate:(id<CLLocationManagerDelegate>)managerDelegate
{
    CLLocationManager* manager = [[CLLocationManager alloc] init];
    
    //Setting precision
    manager.desiredAccuracy = kCLLocationAccuracyKilometer;

    manager.delegate = managerDelegate;
    
    return manager;
}

@end
