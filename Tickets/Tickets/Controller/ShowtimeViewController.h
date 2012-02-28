//
//  ShowtimeViewController.h
//  Tickets
//
//  Created by Anton Poluboiarynov on 2/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@class Cinema;

@interface ShowtimeViewController : UITableViewController<NSFetchedResultsControllerDelegate, CLLocationManagerDelegate>
{
    CLLocationManager* _locationManager;
}

@property (nonatomic, retain) NSFetchedResultsController* fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext* managedObjectContext;

@property (nonatomic, retain) Cinema* cinema;

@end
