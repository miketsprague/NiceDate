//
//  NiceDate.m
//  NiceDate
//
//  Created by Michael Sprague on 5/20/13.
//
//

#import "NiceDate.h"

@interface NiceDate()
@property (nonatomic, strong) NSDateFormatter *formatter;
@property (nonatomic, strong) NSCalendar *gregorian;
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
    if(self = [super init])
    {
        _format = @"MM-dd-yyyy HH:mm:ss";
        _timeZone = [NSTimeZone timeZoneForSecondsFromGMT:-18000];
        _formatter = [NSDateFormatter new];
        [_formatter setDateFormat:_format];
        _gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    }
    
    return self;
    
}

// Today!
+(NiceDate*)date
{
    NiceDate *date = [NiceDate new];
    date.date = [NSDate date];
    return date;
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
    _date = [_gregorian dateFromComponents:dateComponents];
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
    _date = [_gregorian dateFromComponents:dateComponents];
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
    _date = [_gregorian dateFromComponents:dateComponents];
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
    _date = [_gregorian dateFromComponents:dateComponents];
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
    _date = [_gregorian dateFromComponents:dateComponents];
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
    _date = [_gregorian dateFromComponents:dateComponents];
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

-(NSString*)description
{
    [_formatter setDateFormat:_format];
    [_formatter setTimeZone:_timeZone];
    return [_formatter stringFromDate:self.date];
    
}

-(NSDateComponents*)getDateComps
{
    return [_gregorian components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit ) fromDate:self.date];
}

@end
