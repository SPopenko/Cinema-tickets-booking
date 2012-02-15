//
//  Cinema.h
//  Tickets
//
//  Created by Anton Poluboiarynov on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Showtime;

@interface Cinema : NSManagedObject

@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * numberOfSeats;
@property (nonatomic, retain) NSSet *showtimes;
@end

@interface Cinema (CoreDataGeneratedAccessors)

- (void)addShowtimesObject:(Showtime *)value;
- (void)removeShowtimesObject:(Showtime *)value;
- (void)addShowtimes:(NSSet *)values;
- (void)removeShowtimes:(NSSet *)values;
@end
