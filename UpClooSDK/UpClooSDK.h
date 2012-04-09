//
//  UpClooSDK.h
//  UpClooSDK
//
//  Created by Walter Dal Mut on 14/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UpClooGetDelegate.h"
#import "UpClooPutDelegate.h"

#define UPCLOO_FRONT_PATH           @"http://%@.update.upcloo.com/"

#define RELEASE_GET_MANAGER         @"ReleaseGetManager"

@class UpClooDocument;
@class UpClooGetManager;

@interface UpClooSDK : NSObject {
    NSString *username;
    NSString *sitekey;
    NSString *password;
    NSMutableArray *vsitekeys;
}

@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *sitekey;
@property (nonatomic, retain) NSString *password;

@property (nonatomic, retain) NSMutableData *receivedData;

@property (nonatomic, retain) id <UpClooGetDelegate> delegate;
@property (nonatomic, retain) id <UpClooPutDelegate> putDelegate;

@property (nonatomic, retain) UpClooGetManager *getManager;

#pragma mark Methods
+(id)sharedManager;
- (void)setCredential: (NSString *)s :(NSString *)p;
- (void)get:(NSString *)idKey;
- (void)getFromVirtualSitekey:(NSString *)idKey :(NSString *)vsitekey;

@end
