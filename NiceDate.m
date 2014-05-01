//
//  NiceDate.m
//  NiceDate
//
//  Created by Michael Sprague on 5/20/13.
//
//

#import "NiceDate.h"

@interface NiceDate()
@property (nonatomic, strong, readonly) NSDateFormatter *formatter;
@property (nonatomic, strong) NSCalendar *calendar;

@end

@implementation NiceDate
@synthesize second = _second;
@synthesize minute = _minute;
@synthesize hour = _hour;
@synthesize day = _day;
@synthesize month = _month;
@synthesize year = _year;
@synthesize timeZone = _timeZone;

-(id)init
{
    return self = [self initWithDate:[NSDate date]];
}

-(id)initWithDate:(NSDate*)date
{
    if(self = [super init]){
        _format = @"MM-dd-yyyy HH:mm:ss";
        _timeZone = [[NSCalendar autoupdatingCurrentCalendar] timeZone];
        _calendarIdentifier = NSGregorianCalendar;
        _calendar = [[NSCalendar alloc] initWithCalendarIdentifier:_calendarIdentifier];
        self.date = date;
    }
    
    return self;
}

-(id)initWithNiceDate:(NiceDate*)niceDate
{
    if(self = [super init]) {
        _format = niceDate.format;
        _timeZone = niceDate.timeZone;
        _calendar = niceDate.calendar;
        _calendarIdentifier = niceDate.calendarIdentifier;
        self.date = niceDate.date;
    }
    
    return self;
}

//  unix timestamp
- (NSTimeInterval) unixTime
{
    return [self.date timeIntervalSince1970];
}

//  gets a date/time stamp formatted YYYY-mm-dd H:i:s
- (NSString *) mysqlDateTime
{
    self.format = @"yyyy-MM-dd HH:mm:ss";
    return [self description];
}

+(NiceDate*)niceDate
{
    NiceDate *niceDate = [NiceDate new];
    return niceDate;
}

+(NiceDate*)niceDateWithDate:(NSDate*)date
{
    NiceDate *niceDate = [[NiceDate alloc] initWithDate:date];
    return niceDate;
}

+(NiceDate*)niceDateWithNiceDate:(NiceDate*)niceDate {
    NiceDate *newNiceDate = [[NiceDate alloc] initWithNiceDate:niceDate];
    return newNiceDate;
}

+ (NSString *) currentMysqlDateTime
{
    NSString *ret = nil;
    @autoreleasepool {
        ret = [[NiceDate new] mysqlDateTime];
    }
    return ret;
}

+ (NSTimeInterval) currentUnixTime
{
    NSTimeInterval ret = -1;
    @autoreleasepool {
        ret = [[NiceDate new] unixTime];
    }
    return ret;
}


-(NSUInteger)second
{
    return _second;
}

-(void)setSecond:(NSUInteger)second
{
    _second = second;
    NSDateComponents *dateComponents = [self getDateComps];
    [dateComponents setSecond:_second];
    _date = [_calendar dateFromComponents:dateComponents];
}

-(NSUInteger)minute
{
    return _minute;
}

-(void)setMinute:(NSUInteger)minute
{
    _minute = minute;
    NSDateComponents *dateComponents = [self getDateComps];
    [dateComponents setMinute:_minute];
    _date = [_calendar dateFromComponents:dateComponents];
}

-(NSUInteger)hour
{
    return _hour;
}

-(void)setHour:(NSUInteger)hour
{
    _hour = hour;
    NSDateComponents *dateComponents = [self getDateComps];
    [dateComponents setHour:_hour];
    _date = [_calendar dateFromComponents:dateComponents];
}


-(NSUInteger)day
{
    return _day;
}

-(void)setDay:(NSUInteger)day
{
    _day = day;
    NSDateComponents *dateComponents = [self getDateComps];
    [dateComponents setDay:_day];
    _date = [_calendar dateFromComponents:dateComponents];
}

-(NSUInteger)month
{
    return _month;
}

-(void)setMonth:(NSUInteger)month
{
    _month = month;
    NSDateComponents *dateComponents = [self getDateComps];
    [dateComponents setMonth:_month];
    _date = [_calendar dateFromComponents:dateComponents];
}

-(NSUInteger)year
{
    return _year;
}

-(void)setYear:(NSUInteger)year
{
    _year = year;
    NSDateComponents *dateComponents = [self getDateComps];
    [dateComponents setYear:_year];
    _date = [_calendar dateFromComponents:dateComponents];
}

-(void)setCalendarIdentifier:(NSString *)calendarIdentifier
{
    _calendarIdentifier = calendarIdentifier;
    // Update our calendar.
    _calendar = [[NSCalendar alloc] initWithCalendarIdentifier:_calendarIdentifier];
}

// We're overriding our date, so we need to make sure that we update all of our fields to take the NSDate's values.
-(void)setDate:(NSDate *)date
{
    _date = date;
    
    // Update all of our fields.  We need to be overridden by the new date.
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:_date];
    _second = [components second];
    _minute = [components minute];
    _hour = [components hour];
    _day = [components day];
    _month = [components month];
    _year = [components year];
}

- (NSDateFormatter*)formatter {
    static NSDateFormatter *_sharedFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedFormatter = [NSDateFormatter new];
        [_sharedFormatter setDateFormat:_format];
    });
    
    return _sharedFormatter;
}

-(NSString*)description
{
    [self.formatter setDateFormat:_format];
    [self.formatter setTimeZone:_timeZone];
    return [self.formatter stringFromDate:self.date];
    
}

-(NSDateComponents*)getDateComps
{
    return [_calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:self.date];
}

- (BOOL)isEqualToNiceDate:(NiceDate *)otherDate {
	
	return [self.date isEqualToDate:otherDate.date];
}
@end
