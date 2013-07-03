# NiceDate

Tired of NSDate manipulation shenanigans?  
Me too, so I made it suck less.


## Installation

Just copy the two files into your project!

## Usage

```
// Create our NiceDate wrapper based on today's date.
NiceDate *niceDate = [NiceDate niceDate];
            
// I want it to be my birthday already!
niceDate.day = 16;
niceDate.month = 11;
                            
// I don't need to see the seconds, I'll fix the format.
niceDate.format = @"MM-dd-YYYY";
                                        
// Now we have a nice formatted date!
NSString *formattedDate = niceDate.description;

// Let's log it
NSLog(@"%@", formattedDate);

// Could also be written as:
// NSLog(@"%@", niceDate);

```

No Apple, I shouldn't have to tell you I'm using a Gregorian calendar.
```
-(NSDate*)incrementMonth:(NSDate*)date
{
    NiceDate *niceDate = [[NiceDate alloc] initWithDate:date]; // same as [NiceDate niceDateWithDate:date];
    niceDate.month++;
    return niceDate.date;
}

-(NSDate*)oldIncrementMonth:(NSDate*)date
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [gregorian components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit ) fromDate:date];
    [dateComponents setMonth:[dateComponents month]+1];
    return [gregorian dateFromComponents:dateComponents];
}

```

Although, if you need to:
```
  niceDate.calendarIdentifier = NSBuddhistCalendar;
  
  // We can also change the time zone as usual (this only affects the description string):
  niceDate.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:(-5 * 3600)];
```

## Requirements
ARC

## Todo
NSDateFormatter is *really* slow, especially allocation.  Make a shared instance or something more clever.
