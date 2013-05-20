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
        [self setup];
    }
    
    return self;
    
}

+(NiceDate*)date
{
    NiceDate *date = [NiceDate new];
    date.date = [NSDate date];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date.date];
    
    date.second = [components second];
    date.minute = [components minute];
    date.hour = [components hour];
    date.day = [components day];
    date.month = [components month];
    date.year = [components year];
    
    [date setup];
    return date;
}

-(void)setup
{
    _format = @"MM-dd-yyyy HH:mm:ss";
    _timeZone = [NSTimeZone timeZoneForSecondsFromGMT:-18000];
    _formatter = [NSDateFormatter new];
    [_formatter setDateFormat:_format];
    _gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
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
    self.date = [_gregorian dateFromComponents:dateComponents];
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
    self.date = [_gregorian dateFromComponents:dateComponents];
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
    self.date = [_gregorian dateFromComponents:dateComponents];
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
    self.date = [_gregorian dateFromComponents:dateComponents];
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
    self.date = [_gregorian dateFromComponents:dateComponents];
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
    self.date = [_gregorian dateFromComponents:dateComponents];
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
