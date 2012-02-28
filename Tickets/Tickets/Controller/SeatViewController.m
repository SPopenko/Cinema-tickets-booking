//
//  SeatViewController.m
//  Tickets
//
//  Created by Anton Poluboiarynov on 2/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SeatViewController.h"

#import "Showtime.h"
#import "Seat.h"

@implementation SeatViewController

@synthesize managedObjectContext = _managedObjectContext;

@synthesize showtime = _showtime;

#pragma mark - Setting Showtime
- (void) setShowtime:(Showtime *)showtime
{
    _showtime = [showtime retain];
    
    if (showtime)
    {
        self.title = showtime.showtimeName;
    }
    
}

#pragma mark - View prepare
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"Seat"];
    NSPredicate* predicate  = [NSPredicate predicateWithFormat:@"showtime = %@", self.showtime];
    NSSortDescriptor* sort  = [NSSortDescriptor sortDescriptorWithKey:@"seatNumber" ascending:YES];
    
    request.predicate = predicate;
    request.sortDescriptors = [NSArray arrayWithObjects:sort, nil];
    
    NSFetchedResultsController* fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                                               managedObjectContext:self.managedObjectContext
                                                                                                 sectionNameKeyPath:nil
                                                                                                          cacheName:@"Seat"];
    
    NSError* error = nil;
    if ([fetchedResultsController performFetch:&error])
    {
        NSMutableString* seats = nil;
        
        for (Seat* seat in [fetchedResultsController fetchedObjects])
        {
            if (seats)
            {
                [seats appendFormat:@", %d", [seat.seatNumber intValue]];
            }
            else
            {
                seats = [NSMutableString stringWithFormat:@"%d", [seat.seatNumber intValue]];
            }
        }
        
        busySeatsLabel.text = [NSString stringWithFormat:@"Busy seats numbers:\n%@", seats ? seats : [NSString string]];
    }
    
    if (error)
    {
        NSLog(@"%@", [error userInfo]);
    }
    
    [fetchedResultsController release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - dealloc
- (void) dealloc
{
    [_managedObjectContext release];
    [_showtime release];
    [super dealloc];
}

@end
