//
//  UpClooDocuments.h
//  UpClooSDK
//
//  Created by Walter Dal Mut on 14/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UpClooDocument;

#define ELEMENT_DOC @"doc"
#define ELEMENT_TITLE @"title"
#define ELEMENT_URL @"url"

@interface UpClooDocuments : NSObject <NSXMLParserDelegate> {
    NSMutableArray *documents;
    NSMutableData *xmlData;
    
    UpClooDocument *document;
    NSString *actualElement;
    BOOL parseEnds;
}

@property (nonatomic, retain) NSMutableArray *documents;
@property (nonatomic, retain) NSMutableData *xmlData;
@property (nonatomic, retain) UpClooDocument *document;
@property (nonatomic, retain) NSString *actualElement;

@property BOOL parseEnds;

- (id)initWithNSMutableData: (NSMutableData *)data;
- (void)start;

@end
