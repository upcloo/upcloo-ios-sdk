//
//  UpClooGetDelegate.h
//  UpClooSDK
//
//  Created by Walter Dal Mut on 14/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UpClooDocuments.h"
#import "UpClooGetManager.h"

@protocol UpClooGetDelegate <NSObject>
- (void)upclooContentsReady:(UpClooDocuments *)documents;
- (void)upclooUnableToGetContentsWithMessage: (NSString *)message;
@end
