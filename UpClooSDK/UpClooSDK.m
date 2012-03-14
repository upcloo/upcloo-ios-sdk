//
//  UpClooSDK.m
//  UpClooSDK
//
//  Created by Walter Dal Mut on 14/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import "UpClooSDK.h"
#import "UpClooDocument.h"

static UpClooSDK *sharedManager = nil;

@implementation UpClooSDK

@synthesize sitekey,vsitekeys,password;
@synthesize delegate;

#pragma mark Singleton methods
+ (id)sharedManager{
    @synchronized(self) {
        if (sharedManager == nil)
            sharedManager = [[self alloc] init];
    }
    return sharedManager;
}

- (id)init {
    if (self = [super init]) {
        vsitekeys = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

- (void)addVirtualSitekey:(NSString *)vsitekey
{
    [self.vsitekeys addObject:vsitekey];
}

- (void)setCredential: (NSString *)s: (NSString *)p
{
    self.sitekey = s;
    self.password = p;
}

@end
