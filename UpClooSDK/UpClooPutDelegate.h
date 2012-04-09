//
//  UpClooPutDelegate.h
//  UpClooSDK
//
//  Created by Walter Dal Mut on 17/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UpClooPutDelegate <NSObject>
- (void)upclooUnableToPutThisContentWithMessage:(NSString *)message;

@optional
- (void)upclooPutCompleted;

@end
