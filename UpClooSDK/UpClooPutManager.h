//
//  UpClooPutManager.h
//  UpClooSDK
//
//  Created by Walter Dal Mut on 17/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UPCLOO_FRONT_INSTANCE @"http://%@.update.upcloo.com"
//#define UPCLOO_FRONT_INSTANCE @"https://%@.update.upcloo.com"

@class UpClooModelDocument;

@interface UpClooPutManager : NSObject

@property (nonatomic, retain) NSMutableData *receivedData;

- (void)postContent:(UpClooModelDocument *)upclooDocument;

@end
