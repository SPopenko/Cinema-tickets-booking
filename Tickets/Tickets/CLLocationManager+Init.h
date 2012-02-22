//
//  CLLocationManager+Init.h
//  Tickets
//
//  Created by Anton Poluboiarynov on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocationManager (Init)

- (id) initWithDelegate:(id<CLLocationManagerDelegate>)managerDelegate;

@end
