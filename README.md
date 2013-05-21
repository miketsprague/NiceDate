NiceDate
========

Tired of NSDate formatting bullshit?  
So am I.  
I made NSDate manipulation easy.

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

It makes simple date manipulation as easy as it should be.
```
-(NSDate*)incrementMonth:(NSDate*)date
{
    NiceDate *niceDate = [NiceDate new];
    niceDate.date = date;
    niceDate.month++;
    return niceDate.date;
}

```

