NiceDate
========

Tired of NSDate formatting bullshit?  Don't want to have to specify that you're using a Gregorian calendar?  Neither do I.  So use this.


Usage:
```
NiceDate *niceDate = [NiceDate date]; // today
// I would like it to be my birthday.
niceDate.month = 11;
niceDate.day = 16;
NSLog(@"Horray, it's my birthday today (%@)", niceDate);
```

TODO: Formatting
