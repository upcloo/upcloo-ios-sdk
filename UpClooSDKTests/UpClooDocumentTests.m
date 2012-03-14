//
//  UpClooDocumentTests.m
//  UpClooSDK
//
//  Created by Walter Dal Mut on 14/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import "UpClooDocumentTests.h"
#import "UpClooDocument.h"

#define TITLE @"title"

@implementation UpClooDocumentTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testFields
{
    UpClooDocument *document = [[UpClooDocument alloc] init];
    document.title = TITLE;
    
    STAssertEquals(@"title", TITLE, @"FAILURE: title not valid");
}

@end
