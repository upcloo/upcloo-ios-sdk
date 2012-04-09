//
//  UpClooModelDocument.h
//  UpClooSDK
//
//  Created by Walter Dal Mut on 17/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ISO_TIMEZONE_UTC_FORMAT @"Z"
#define ISO_TIMEZONE_OFFSET_FORMAT @"+%f:%f"

@interface UpClooModelDocument : NSObject {
    NSString *idContent;
    NSString *title;
    NSString *content;
    NSDate *publishDate;
}

@property (nonatomic, retain) NSString *idContent;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSDate *publishDate;

- (id)initWithId: (NSString *)contentId;
- (id)initWithIdAndTitle: (NSString *)contentId : (NSString *)contentTitle;

- (NSString *)asXML;

@end
