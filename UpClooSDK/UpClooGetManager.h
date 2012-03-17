//
//  UpClooGetManager.h
//  UpClooSDK
//
//  Created by Walter Dal Mut on 17/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UPCLOO_REPOSITORY_PATH      @"repository.upcloo.com"
#define UPCLOO_REPOSITORY           @"http://repository.upcloo.com/%@/%@.xml"
#define UPCLOO_REPOSITORY_VSITEKEY  @"http://repository.upcloo.com/%@/%@/%@.xml"

@interface UpClooGetManager : NSObject 

@property (nonatomic, retain) NSMutableData *receivedData;

#pragma mark Methods
- (void)getFromVirtualSitekey:(NSString *)sitekey :(NSString *)idKey :(NSString *)vsitekey;

@end
