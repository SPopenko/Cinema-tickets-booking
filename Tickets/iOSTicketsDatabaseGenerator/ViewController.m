//
//  ViewController.m
//  iOSTicketsDatabaseGenerator
//
//  Created by Anton Poluboiarynov on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "CoreData/CoreData.h"

#import "UIManagedDocument+CinemaCreating.h"

@implementation ViewController

#pragma mark - methods for work with database

- (void) prepareDatabaseDocument:(UIManagedDocument*)document filledWithData:(BOOL)filled
{
    [document retain];
    [document.managedObjectContext performBlockAndWait:^(void)
     {
         if (filled) [document addCinemas];
         
         [document savePresentedItemChangesWithCompletionHandler:^(NSError* errorOrNil)
          {
              if (errorOrNil) NSLog(@"%@", [errorOrNil description]);
          }];
     }];
    _statusLabel.text = [NSString stringWithString:@"Database created"];
    [document release];
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
                 [self prepareDatabaseDocument:_ticketsDatabase filledWithData:fillDatabaseWithData];
             }
             else NSLog(@"Error");
         }];
    }
    else if (_ticketsDatabase.documentState == UIDocumentStateClosed)
    {
        [_ticketsDatabase openWithCompletionHandler:^(BOOL success)
         {
             NSLog(@"Opened");
             [self prepareDatabaseDocument:_ticketsDatabase filledWithData:fillDatabaseWithData];
         } ];
    }
    else if (_ticketsDatabase.documentState == UIDocumentStateNormal)
    {
        NSLog(@"Ok");
        [self prepareDatabaseDocument:_ticketsDatabase filledWithData:fillDatabaseWithData];
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
