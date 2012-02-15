//
//  UIManagedDocument+CinemaCreating.m
//  Tickets
//
//  Created by Anton Poluboiarynov on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIManagedDocument+CinemaCreating.h"

#import "Cinema.h"
#import "Showtime.h"
#import "Seat.h"

#define kCinemaName        @"name"
#define kCinemaLongitude   @"longitude"
#define kCinemaLatitude    @"latitude"
#define kCinemaSeatNumbers @"numberOfSeats"
#define kShowtimeName      @"showtimeName"
#define kShowtimeNumber    @"showtimeNumber"

#define kLoadLocations         @"Locations"
#define kLoadCinemasData       @"CinemaData"
#define kLoadLocationLongitude @"Longitude"
#define kLoadLocationLatitude  @"Latitude"

@interface Cinema (CinemaCreating)

- (void) addShowtimesWithParams:(NSDictionary*) params;

@end

@implementation Cinema (CinemaCreating)

- (void) addShowtimesWithParams:(NSDictionary *)params
{
    if (params == nil || params.count == 0) return;
    
    NSNumber* numberOfShowtimes = [params objectForKey:kShowtimeNumber];
    
    if (!numberOfShowtimes || [numberOfShowtimes intValue] < 1) return;
    
    Showtime* showtime = nil;

    for ( int i = 0; i < [numberOfShowtimes intValue]; i++)
    {
        showtime = [NSEntityDescription insertNewObjectForEntityForName:@"Showtime"
                                             inManagedObjectContext:self.managedObjectContext];
        showtime.showtimeName = ([params objectForKey:kShowtimeName]) ? [params objectForKey:kShowtimeName]: [NSString stringWithString:@"Showtime"];
        showtime.showtimeName = [showtime.showtimeName stringByAppendingFormat:@"%d", (i+1)];
        
        [self addShowtimesObject:showtime];
        
        int numberOfSeats = [showtime.cinema.numberOfSeats intValue];
        for (int i = 0; i < numberOfSeats/10; ++i)
        {
            Seat* seat = [NSEntityDescription insertNewObjectForEntityForName:@"Seat"
                                                       inManagedObjectContext:self.managedObjectContext];
            seat.seatNumber = [ NSNumber numberWithInt:(i*10)];
            [showtime addBusySeatsObject:seat];
        }
    }
}

@end


@implementation UIManagedDocument (CinemaCreating)


- (void) addCinemaWithParams:(NSDictionary*) params
{
    Cinema* cinema = [NSEntityDescription insertNewObjectForEntityForName:@"Cinema"
                                                   inManagedObjectContext:self.managedObjectContext];
    
    cinema.name          = [params objectForKey:kCinemaName];
    cinema.latitude      = [params objectForKey:kCinemaLatitude];
    cinema.longitude     = [params objectForKey:kCinemaLongitude];
    cinema.numberOfSeats = [params objectForKey:kCinemaSeatNumbers];
    
    [cinema addShowtimesWithParams:params];
}

- (void) addCinemas
{
    NSBundle* main = [[NSBundle mainBundle] retain];
    NSString* path = [main pathForResource:@"TicketsParams" ofType:@"plist"];
    
    if (!path) return;
    
    NSDictionary* load      = [NSDictionary dictionaryWithContentsOfFile:path];
    NSDictionary* locations = [load objectForKey:kLoadLocations];
    NSArray* cinemasData = [load objectForKey:kLoadCinemasData];

    //TODO: Create array of dictionaries with cinema values
    NSMutableDictionary* cinemaParams = nil;
    NSArray* locationsKey = [locations allKeys];
    for (NSString* location in locationsKey)
    {
        for (NSUInteger i = 0; i < cinemasData.count; i++)
        {
            cinemaParams = [NSMutableDictionary dictionary];
            
            NSDictionary* coord = [locations objectForKey:location];
            NSNumber* longitude = [coord objectForKey:kLoadLocationLongitude];
            NSNumber* latitude  = [coord objectForKey:kLoadLocationLatitude];
            
            if (i > 0)
            {
                double angle = M_PI_2 - (2*M_PI*((double)i - 1)/((double)(cinemasData.count - 1)));
                latitude  = [NSNumber numberWithDouble:([latitude  doubleValue] + 0.01 * sin(angle))];
                longitude = [NSNumber numberWithDouble:([longitude doubleValue] + 0.01 * cos(angle))];
            }
            
            [cinemaParams setObject:[NSString stringWithFormat:@"%@ %@", location, [cinemasData objectAtIndex:i]]            forKey:kCinemaName];
            [cinemaParams setObject:[NSString stringWithFormat:@"%@", [cinemasData objectAtIndex:(cinemasData.count -1 -i)]] forKey:kShowtimeName];
            [cinemaParams setObject:[NSNumber numberWithInteger:(i+1)]                                                       forKey:kShowtimeNumber];
            [cinemaParams setObject:longitude                                                                                forKey:kCinemaLongitude];
            [cinemaParams setObject:latitude                                                                                 forKey:kCinemaLatitude];
            [cinemaParams setObject:[NSNumber numberWithInteger:100 + i * 10]                                                forKey:kCinemaSeatNumbers];
            
            [self addCinemaWithParams:cinemaParams];
        }
    }
                            
    [main release];
}

@end

