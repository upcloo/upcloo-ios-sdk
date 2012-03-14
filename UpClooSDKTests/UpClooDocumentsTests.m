//
//  UpClooDocumentsTests.m
//  UpClooSDK
//
//  Created by Walter Dal Mut on 14/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import "UpClooDocumentsTests.h"
#import "UpClooDocuments.h"

@implementation UpClooDocumentsTests

NSMutableData *xmlData;

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    NSString *xml = @"<docs><doc><title>ciao</title></doc></docs>";
    xmlData = [NSMutableData dataWithData:[xml dataUsingEncoding:NSUTF8StringEncoding]];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testParsing
{
    UpClooDocuments *documents = [[UpClooDocuments alloc] initWithNSMutableData:xmlData];
    [documents start];
    
    while (!documents.parseEnds) {
        //wait
    }
    
    STAssertTrue(documents.documents.count > 0, 
                 [NSString stringWithFormat: @"FAILURE: Library says that have %d documents?", documents.documents.count]);

}

@end
