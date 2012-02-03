//
//  Seat.h
//  Tickets
//
//  Created by Anton Poluboiarynov on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Showtime;

@interface Seat : NSManagedObject

@property (nonatomic, retain) NSNumber * seatNumber;
@property (nonatomic, retain) Showtime *showtime;

@end
