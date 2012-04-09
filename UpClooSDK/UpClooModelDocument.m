//
//  UpClooModelDocument.m
//  UpClooSDK
//
//  Created by Walter Dal Mut on 17/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import "UpClooModelDocument.h"
#import "UpClooSDK.h"

@implementation UpClooModelDocument

@synthesize idContent;
@synthesize title;
@synthesize content;;
@synthesize publishDate;

- (id)initWithId:(NSString *)contentId
{
    return [self initWithIdAndTitle:contentId :nil];
}

- (id)initWithIdAndTitle: (NSString *)contentId : (NSString *)contentTitle
{
    if (self = [super init])
    {
        self.idContent = contentId;
        self.title = contentTitle;
        self.publishDate = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
    }
    
    
    return self;
}

+ (NSString *)dateToISO8601: (NSDate *)date
{
    static NSDateFormatter* sISO8601 = nil;
    
    if (!sISO8601) {
        sISO8601 = [[NSDateFormatter alloc] init];
        
        NSTimeZone *timeZone = [NSTimeZone localTimeZone];
        int offset = [timeZone secondsFromGMT];
        
        NSMutableString *strFormat = [NSMutableString stringWithString:@"yyyyMMdd'T'HH:mm:ss"];
        offset /= 60; //bring down to minutes
        if (offset == 0)
            [strFormat appendString:ISO_TIMEZONE_UTC_FORMAT];
        else
            [strFormat appendFormat:ISO_TIMEZONE_OFFSET_FORMAT, offset / 60, offset % 60];
        
        [sISO8601 setTimeStyle:NSDateFormatterFullStyle];
        [sISO8601 setDateFormat:strFormat];
    }
    return[sISO8601 stringFromDate:date];
}


- (NSString *)asXML
{
    UpClooSDK *manager = [UpClooSDK sharedManager];
    NSString *result = [NSString stringWithFormat:@"<model><username>%@</username><password>%@</password><id>%@</id><title>%@</title><content>%@</content><publish_date>%@<publish_date></model>", manager.username, manager.password,
                        self.idContent, self.title, self.content, [UpClooModelDocument dateToISO8601:self.publishDate]];
    
    return result;
}

- (oneway void)release
{
    [self.idContent release];
    [self.title release];
    [self.content release];
    [self.publishDate release];
    
    [super release];
}

@end
