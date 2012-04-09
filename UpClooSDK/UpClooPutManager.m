//
//  UpClooPutManager.m
//  UpClooSDK
//
//  Created by Walter Dal Mut on 17/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import "UpClooPutManager.h"
#import "UpClooModelDocument.h"
#import "UpClooSDK.h"

@implementation UpClooPutManager

@synthesize receivedData;

- (void)postContent:(UpClooModelDocument *)upclooDocument
{
    NSString *xml =[upclooDocument asXML];
    
    UpClooSDK *manager = [UpClooSDK sharedManager];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:
                                       [NSURL URLWithString:[NSString stringWithFormat:UPCLOO_FRONT_INSTANCE, manager.username]] 
                                                cachePolicy: NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                            timeoutInterval:8];
                                    
    [theRequest setHTTPBody:[xml dataUsingEncoding:NSUTF8StringEncoding]];
    [theRequest setHTTPMethod:@"POST"];
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest
                                                                     delegate:self];
    
    if (theConnection) {
        receivedData = [[NSMutableData data] retain];
    } else {
        [manager.putDelegate upclooUnableToPutThisContentWithMessage:
         [NSString stringWithFormat:
          @"Unable to send this content, please check your internet connection"]];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //Reset data length
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //Add data
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    // inform the user
    UpClooSDK *manager = [UpClooSDK sharedManager];
    [manager.putDelegate upclooUnableToPutThisContentWithMessage:[error localizedDescription]];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    UpClooSDK *manager = [UpClooSDK sharedManager];
    [manager.putDelegate upclooPutCompleted];
    
    [connection release];
    [receivedData release];
}

- (oneway void)release
{
    [super release];
}

@end
