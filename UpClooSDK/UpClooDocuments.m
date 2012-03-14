//
//  UpClooDocuments.m
//  UpClooSDK
//
//  Created by Walter Dal Mut on 14/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import "UpClooDocuments.h"
#import "UpClooDocument.h"
#import "UpClooSDK.h"

@implementation UpClooDocuments

@synthesize documents, document;
@synthesize xmlData;
@synthesize actualElement;

- (id)initWithNSMutableData:(NSMutableData *)data
{
    if (self = [super init])
    {
        self.xmlData = data;
    }
    
    return self;
}

- (void)start
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:self.xmlData];
    parser.delegate = self;
    
    [parser setShouldProcessNamespaces:NO];
    [parser setShouldReportNamespacePrefixes:NO];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];

}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqual:@"doc"]) {
        self.document = [[UpClooDocument alloc] init];
        actualElement = @"doc";
    } else if ([elementName isEqual:@"title"]) {
        actualElement = @"title";
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqual:@"doc"]) {
        [documents addObject:document];

        actualElement = nil;
        document = nil;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([actualElement isEqual:@"title"]) {
        document.title = string;
    }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    UpClooSDK *manager = [UpClooSDK sharedManager];
    [manager.delegate upclooUnableToGetContentsWithMessage:[parseError localizedDescription]];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    //handle ends
    UpClooSDK *manager = [UpClooSDK sharedManager];
    [manager.delegate upclooContentsReady:self];
}

@end
