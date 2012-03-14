//
//  UpClooGetDelegate.h
//  UpClooSDK
//
//  Created by Walter Dal Mut on 14/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UpClooGetDelegate <NSObject>
- (void)upclooContentsReady:(NSArray *)documents;
- (void)upclooUnableToGetContentsWithMessage: (NSString *)message;
@end
