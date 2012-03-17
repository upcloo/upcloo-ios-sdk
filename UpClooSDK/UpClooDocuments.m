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
@synthesize parseEnds;

- (id)initWithNSMutableData:(NSMutableData *)data
{
    if (self = [super init])
    {
        self.xmlData = data;
        self.documents = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)start
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
    parser.delegate = self;
    
    self.parseEnds = NO;
    
    [parser setShouldProcessNamespaces:NO];
    [parser setShouldReportNamespacePrefixes:NO];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];

}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqual:ELEMENT_DOC]) {
        self.document = [[UpClooDocument alloc] init];
        self.document.title = [NSMutableString stringWithString:@""];
        self.document.url = [NSMutableString stringWithString:@""];
        
        actualElement = ELEMENT_DOC;
    } else if ([elementName isEqual:ELEMENT_TITLE]) {
        actualElement = ELEMENT_TITLE;
    } else if ([elementName isEqual:ELEMENT_URL]) {
        actualElement = ELEMENT_URL;
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqual:ELEMENT_DOC]) {
        [documents addObject:document];
        
        //TODO: check id document needs to be released
    }
    
    actualElement = @"";
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([actualElement isEqual:ELEMENT_TITLE]) {
        [document.title appendString:string];
    } else if ([actualElement isEqual:ELEMENT_URL]) {
        [document.url appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    UpClooSDK *manager = [UpClooSDK sharedManager];
    [manager.delegate upclooUnableToGetContentsWithMessage:[parseError localizedDescription]];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    parseEnds = YES;
    //handle ends
    UpClooSDK *manager = [UpClooSDK sharedManager];
    [manager.delegate upclooContentsReady:self];
    
    [parser release];
}

- (oneway void)release
{
    [actualElement release];
    [xmlData release];
    
    [documents release];
    
    [super release];
}

@end
