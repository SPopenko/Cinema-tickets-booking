//
//  SeatViewController.h
//  Tickets
//
//  Created by Anton Poluboiarynov on 2/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Showtime;

@interface SeatViewController : UIViewController
{
    IBOutlet UITextView* busySeatsLabel;
}

@property (retain, nonatomic) NSManagedObjectContext* managedObjectContext;

@property (retain, nonatomic) Showtime* showtime;

@end
