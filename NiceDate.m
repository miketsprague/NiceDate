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
    return [[self components] second];
}

-(void)setSecond:(NSUInteger)second
{
    NSDateComponents *dateComponents = [self components];
    [dateComponents setSecond:second];
    self.date = [_calendar dateFromComponents:dateComponents];
}

-(NSUInteger)minute
{
    return [[self components] minute];
}

-(void)setMinute:(NSUInteger)minute
{
    NSDateComponents *dateComponents = [self components];
    [dateComponents setMinute:minute];
    self.date = [_calendar dateFromComponents:dateComponents];
}

-(NSUInteger)hour
{
    return [[self components] hour];
}

-(void)setHour:(NSUInteger)hour
{
    NSDateComponents *dateComponents = [self components];
    [dateComponents setHour:hour];
    self.date = [_calendar dateFromComponents:dateComponents];
}


-(NSUInteger)day
{
    return [[self components] day];
}

-(void)setDay:(NSUInteger)day
{
    NSDateComponents *dateComponents = [self components];
    [dateComponents setDay:day];
    
    // Update our date object.  This will update all of our properties.
    self.date = [_calendar dateFromComponents:dateComponents];
}

-(NSUInteger)dayOfWeek {
    return [self components].weekday;
}

-(NSString*)shortDayOfWeekString {
    return [[self.formatter shortWeekdaySymbols] objectAtIndex:[self components].weekday-1];
}

-(NSString*)dayOfWeekString {
    return [[self.formatter weekdaySymbols] objectAtIndex:[self components].weekday-1];
}

-(NSUInteger)month
{
    return [[self components] month];
}

-(void)setMonth:(NSUInteger)month
{
    NSDateComponents *dateComponents = [self components];
    [dateComponents setMonth:month];
    self.date = [_calendar dateFromComponents:dateComponents];
}

-(NSString*)monthString {
    return [[self.formatter monthSymbols] objectAtIndex:(self.month-1)];
}

-(NSUInteger)year
{
    return [[self components] year];
}

-(void)setYear:(NSUInteger)year
{
    NSDateComponents *dateComponents = [self components];
    [dateComponents setYear:year];
    self.date = [_calendar dateFromComponents:dateComponents];
}

-(void)setCalendarIdentifier:(NSString *)calendarIdentifier
{
    _calendarIdentifier = calendarIdentifier;
    // Update our calendar.
    _calendar = [[NSCalendar alloc] initWithCalendarIdentifier:_calendarIdentifier];
}

-(void)setDate:(NSDate *)date
{
    _date = date;
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

-(NSDateComponents*)components
{
    return [_calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit ) fromDate:self.date];
}

- (BOOL)isEqualToNiceDate:(NiceDate *)otherDate {
	
	return [self.date isEqualToDate:otherDate.date];
}
@end
