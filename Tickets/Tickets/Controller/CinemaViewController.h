//
//  CinemaViewController.h
//  Tickets
//
//  Created by Anton Poluboiarynov on 2/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface CinemaViewController : UITableViewController<NSFetchedResultsControllerDelegate>

@property (nonatomic, retain) NSFetchedResultsController* fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext* managedObjectContext;

@end