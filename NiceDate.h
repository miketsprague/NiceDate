//
//  NiceDate.h
//  NiceDate
//
//  Created by Michael Sprague on 5/20/13.
//

#import <Foundation/Foundation.h>

@interface NiceDate : NSObject

@property (nonatomic, assign) NSUInteger second;
@property (nonatomic, assign) NSUInteger minute;
@property (nonatomic, assign) NSUInteger hour;
@property (nonatomic, assign) NSUInteger day;
@property (nonatomic, assign, readonly) NSUInteger dayOfWeek;
@property (nonatomic, assign, readonly) NSString *shortDayOfWeekString;
@property (nonatomic, assign, readonly) NSString *dayOfWeekString;
@property (nonatomic, assign) NSUInteger month;
@property (nonatomic, assign, readonly) NSString *monthString;
@property (nonatomic, assign) NSUInteger year;
@property (nonatomic, strong) NSString *format;
@property (nonatomic, strong) NSTimeZone *timeZone;
@property (nonatomic, strong) NSDate *date;
// Just in case you don't feel like Gregorian ;)
@property (nonatomic, strong) NSString *calendarIdentifier;

//  create with current date/time
- (id) init;

//  create with supplied date/time
- (id) initWithDate: (NSDate*) date;

// Create with another nice date
- (id) initWithNiceDate: (NiceDate*)niceDate;

//  overrides description to display formatted date
- (NSString *) description;

//  unix timestamp
- (NSTimeInterval) unixTime;

//  gets a date/time stamp formatted YYYY-mm-dd H:i:s
- (NSString *) mysqlDateTime;

//  The same as alloc init
+ (NiceDate *) niceDate;

//  The same as alloc initWithDate
+ (NiceDate *) niceDateWithDate: (NSDate*) date;

// Ditto
+ (NiceDate*) niceDateWithNiceDate: (NiceDate*)niceDate;

//  current time in mysql format, intended for one-time use
+ (NSString *) currentMysqlDateTime;

//  current unix timestamp, intended for one-time use
+ (NSTimeInterval) currentUnixTime;

// returns whether two NiceDate instances are equal or not
- (BOOL)isEqualToNiceDate:(NiceDate *)otherDate;

@end
