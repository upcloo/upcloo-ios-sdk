//
//  UpClooSDK.h
//  UpClooSDK
//
//  Created by Walter Dal Mut on 14/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UpClooGetDelegate.h"

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

@property (nonatomic, retain) id <UpClooGetDelegate> delegate;

- (void)addVirtualSitekey: (NSString *)vsitekey;
- (void)setCredential: (NSString *)s :(NSString *)p;

@end
