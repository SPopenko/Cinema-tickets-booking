//
//  ViewController.m
//  iOSTicketsDatabaseGenerator
//
//  Created by Anton Poluboiarynov on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "CoreData/CoreData.h"

#import "Cinema.h"
#import "Showtime.h"
#import "Seat.h"

@implementation ViewController

#pragma mark - methods for work with database

- (void) prepareDatabaseForWorkFilled:(BOOL)filled
{
    [_ticketsDatabase.managedObjectContext performBlockAndWait:^(void)
     {
//         NSEntityDescription* tempentity = [NSEntityDescription entityForName:@"Cinema" inManagedObjectContext:_ticketsDatabase.managedObjectContext];
         [_ticketsDatabase savePresentedItemChangesWithCompletionHandler:^(NSError* errorOrNil)
          {
              if (errorOrNil) NSLog(@"%@", [errorOrNil description]);
          }];
         
         //TODO filled data with object

     }];
    _statusLabel.text = [NSString stringWithString:@"Database created"];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _statusLabel.text = [NSString stringWithString:@"Generating database"];
    BOOL fillDatabaseWithData = YES;
    //database creating
    //Preparing database file
    if (!_ticketsDatabase)
    {
        NSURL* databaseFileUrl = nil;
        databaseFileUrl = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        databaseFileUrl = [databaseFileUrl URLByAppendingPathComponent:@"tickets"];
        _ticketsDatabase = [[UIManagedDocument alloc] initWithFileURL:databaseFileUrl];
    }
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:_ticketsDatabase.fileURL.path])
    {
        [_ticketsDatabase saveToURL:_ticketsDatabase.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success)
         {
             if (success)
             {
                 NSLog(@"Saved");
                 [self prepareDatabaseForWorkFilled:fillDatabaseWithData];
             }
             else NSLog(@"Error");
         }];
    }
    else if (_ticketsDatabase.documentState == UIDocumentStateClosed)
    {
        [_ticketsDatabase openWithCompletionHandler:^(BOOL success)
         {
             NSLog(@"Opened");
             [self prepareDatabaseForWorkFilled:fillDatabaseWithData];
         } ];
    }
    else if (_ticketsDatabase.documentState == UIDocumentStateNormal)
    {
        NSLog(@"Ok");
        [self prepareDatabaseForWorkFilled:fillDatabaseWithData];
    }
 }

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
