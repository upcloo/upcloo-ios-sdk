//
//  UpClooModelDocument.h
//  UpClooSDK
//
//  Created by Walter Dal Mut on 17/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ISO_TIMEZONE_UTC_FORMAT @"Z"
#define ISO_TIMEZONE_OFFSET_FORMAT @"%02d:%02d"

@interface UpClooModelDocument : NSObject {
    NSString *idContent;
    NSString *title;
    NSURL *url;
    NSString *content;
    NSDate *publishDate;
}

@property (nonatomic, retain) NSString *idContent;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSURL *url;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSDate *publishDate;

- (id)initWithId: (NSString *)contentId;
- (id)initWithIdAndTitle: (NSString *)contentId : (NSString *)contentTitle;
+ (NSString *)dateToISO8601: (NSDate *)date;

- (NSString *)asXML;

@end
