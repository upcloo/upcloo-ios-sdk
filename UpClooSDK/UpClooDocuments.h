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

@interface UpClooDocuments : NSObject <NSXMLParserDelegate> {
    NSMutableArray *documents;
    NSMutableData *xmlData;
    
    UpClooDocument *document;
    NSString *actualElement;
}

@property (nonatomic, retain) NSMutableArray *documents;
@property (nonatomic, retain) NSMutableData *xmlData;
@property (nonatomic, retain) UpClooDocument *document;
@property (nonatomic, retain) NSString *actualElement;

- (id)initWithNSMutableData: (NSMutableData *)data;
- (void)start;

@end
