//
//  UpClooModelDocument.m
//  UpClooSDK
//
//  Created by Walter Dal Mut on 17/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import "UpClooModelDocument.h"

@implementation UpClooModelDocument

@synthesize idContent;
@synthesize title;
@synthesize summary;
@synthesize content;
@synthesize tags;
@synthesize categories;
@synthesize publishDate;

- (id)initWithIdContent:(NSString *)value
{
    if (self = [super init])
    {
        self.idContent = value;
    }
    
    return self;
}


- (void)asXML
{
    
}

@end
