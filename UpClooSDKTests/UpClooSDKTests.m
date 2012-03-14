//
//  UpClooSDKTests.m
//  UpClooSDKTests
//
//  Created by Walter Dal Mut on 14/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import "UpClooSDKTests.h"
#import "UpClooSDK.h"

#define SITEKEY @"test-sitekey"
#define PASSWORD @"example"

@implementation UpClooSDKTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    UpClooSDK *manager = [UpClooSDK sharedManager];
    manager.sitekey = SITEKEY;
    manager.password = PASSWORD;
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testSingletonBase
{
    UpClooSDK *manager = [UpClooSDK sharedManager];
    if (![manager.sitekey isEqual: SITEKEY]) {
        STFail(@"Sitekey previously setted actually is missing...");
    }
    
    if (![manager.password isEqual:PASSWORD]) {
        STFail(@"Password previously setted actually is missing...");
    }
}

- (void)testSetCredential
{
    UpClooSDK *manager = [UpClooSDK sharedManager];
    [manager setCredential:PASSWORD :SITEKEY]; //Reversed for override
    
    if (![manager.sitekey isEqual: PASSWORD]) {
        STFail(@"Sitekey previously setted actually is missing...");
    }
    
    if (![manager.password isEqual:SITEKEY]) {
        STFail(@"Password previously setted actually is missing...");
    }
}

@end
