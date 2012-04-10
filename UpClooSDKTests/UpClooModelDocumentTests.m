//
//  UpClooModelDocumentTests.m
//  UpClooSDK
//
//  Created by Walter Dal Mut on 10/04/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import "UpClooModelDocumentTests.h"

#import "UpClooSDK.h"
#import "UpClooModelDocument.h"

@implementation UpClooModelDocumentTests

- (void) setUp
{
    [super setUp];
    
    UpClooSDK *manager = [UpClooSDK sharedManager];
    manager.sitekey = @"test-sitekey";
    manager.password = @"example";
    manager.username = @"corley";
}

- (void) tearDown
{
    [super tearDown];
}

- (void)testXmlGeneration
{
    UpClooModelDocument *doc = [[UpClooModelDocument alloc] initWithIdAndTitle:@"post_1" :@"Title"];

    doc.publishDate = nil;
    
    NSString *xml = [doc asXML];
    
    STAssertTrue([xml isEqualToString: @"<model><sitekey>test-sitekey</sitekey><password>example</password><id>post_1</id><title>Title</title></model>"], @"FAILURE: XML Structure is invalid");
}

/*
 //Not valid test skipped
- (void)testPublishDateIso8601
{
    NSString *date = [UpClooModelDocument dateToISO8601:[NSDate dateWithTimeIntervalSince1970:0]];
    
    STAssertTrue([date isEqualToString:@"1970-01-01T01:00:00+02:00"], @"ISO8601 invalid date format");
}
*/

@end
