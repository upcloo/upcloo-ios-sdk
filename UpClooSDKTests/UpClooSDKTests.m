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
    STAssertEquals(SITEKEY, manager.sitekey, @"Sitekey previously setted actually is missing...");
    
    STAssertEquals(PASSWORD, manager.password, @"Password previously setted actually is missing...");
}

- (void)testSetCredential
{
    UpClooSDK *manager = [UpClooSDK sharedManager];
    [manager setCredential:PASSWORD :SITEKEY]; //Reversed for override
    
    STAssertEquals(PASSWORD, manager.sitekey, @"Sitekey previously setted actually is missing...");
    STAssertEquals(SITEKEY, manager.password, @"Password previously setted actually is missing...");
}

@end
