//
//  UpClooSDK.h
//  UpClooSDK
//
//  Created by Walter Dal Mut on 14/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UpClooGetDelegate.h"

#define UPCLOO_REPOSITORY_PATH      @"repository.upcloo.com"
#define UPCLOO_REPOSITORY           @"http://repository.upcloo.com/%@/%@"
#define UPCLOO_REPOSITORY_VSITEKEY  @"http://repository.upcloo.com/%@/%@/%@"

@class UpClooDocument;

@interface UpClooSDK : NSObject {
    NSString *sitekey;
    NSString *password;
    NSMutableArray *vsitekeys;
}

+(id)sharedManager;

@property (nonatomic, retain) NSString *sitekey;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSMutableArray *vsitekeys;

@property (nonatomic, retain) NSMutableData *receivedData;

@property (nonatomic, retain) id <UpClooGetDelegate> delegate;

- (void)addVirtualSitekey: (NSString *)vsitekey;
- (void)setCredential: (NSString *)s :(NSString *)p;

- (void)get:(NSString *)idKey;

@end
