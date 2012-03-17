//
//  UpClooSDK.m
//  UpClooSDK
//
//  Created by Walter Dal Mut on 14/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import "UpClooSDK.h"
#import "UpClooDocuments.h"
#import "UpClooGetManager.h"

static UpClooSDK *sharedManager = nil;

@implementation UpClooSDK

@synthesize username, sitekey, password;
@synthesize delegate;

@synthesize receivedData;

#pragma mark Singleton methods
+ (id)sharedManager{
    @synchronized(self) {
        if (sharedManager == nil)
            sharedManager = [[super allocWithZone:NULL] init];
            sharedManager.username = @"corley";
    }
    return sharedManager;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [[self sharedManager] retain];
}
- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (unsigned)retainCount {
    return UINT_MAX; //denotes an object that cannot be released
}

- (oneway void)release {
    // never release
}
- (id)autorelease {
    return self;
}

- (id)init {
    if (self = [super init]) {
        vsitekeys = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)setCredential: (NSString *)s: (NSString *)p
{
    self.sitekey = s;
    self.password = p;
}

- (void)get:(NSString *)idKey
{
    UpClooGetManager *manager = [[UpClooGetManager alloc] init];
    [manager getFromVirtualSitekey:idKey :nil];
}

- (void)getFromVirtualSitekey:(NSString *)idKey :(NSString *)vsitekey
{
    UpClooGetManager *manager = [[UpClooGetManager alloc] init];
    [manager getFromVirtualSitekey:idKey :vsitekey];
}



@end
