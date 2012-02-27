//
//  Showtime.h
//  Tickets
//
//  Created by Anton Poluboiarynov on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Cinema, Seat;

@interface Showtime : NSManagedObject

@property (nonatomic, retain) NSString * showtimeName;
@property (nonatomic, retain) NSDate * showtimeTime;
@property (nonatomic, retain) NSSet *busySeats;
@property (nonatomic, retain) Cinema *cinema;
@end

@interface Showtime (CoreDataGeneratedAccessors)

- (void)addBusySeatsObject:(Seat *)value;
- (void)removeBusySeatsObject:(Seat *)value;
- (void)addBusySeats:(NSSet *)values;
- (void)removeBusySeats:(NSSet *)values;
@end
