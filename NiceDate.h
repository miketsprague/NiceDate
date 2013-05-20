//
//  NiceDate.h
//  NiceDate
//
//  Created by Michael Sprague on 5/20/13.
//
//

#import <Foundation/Foundation.h>

@interface NiceDate : NSObject

@property (nonatomic, assign) NSUInteger second;
@property (nonatomic, assign) NSUInteger minute;
@property (nonatomic, assign) NSUInteger hour;
@property (nonatomic, assign) NSUInteger day;
@property (nonatomic, assign) NSUInteger month;
@property (nonatomic, assign) NSUInteger year;
@property (nonatomic, strong) NSString *format;
@property (nonatomic, strong) NSTimeZone *timeZone;
@property (nonatomic, strong) NSDate *date;

-(id)init;
-(NSString*)description; // description will be formatted by the format string.

+(NiceDate*)date;

@end
