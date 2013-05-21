NiceDate
========

Tired of NSDate formatting bullshit?  
Me too, so I made it suck less.

Example:
```
// Create our NiceDate wrapper based on today's date.
NiceDate *niceDate = [NiceDate date];
            
// I want it to be my birthday already!
niceDate.day = 16;
niceDate.month = 11;
                            
// I don't need to see the seconds, I'll fix the format.
niceDate.format = @"MM-dd-YYYY";
                                        
// Now we have a nice formatted date!
NSString *formattedDate = niceDate.description;

// Let's log it
NSLog(@"%@", formattedDate);

```

No Apple, I shouldn't have to tell you I'm using a Gregorian calendar.
```
-(NSDate*)incrementMonth:(NSDate*)date
{
    NiceDate *niceDate = [NiceDate new];
    niceDate.date = date;
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



