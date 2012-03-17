//
//  UpClooGetManager.m
//  UpClooSDK
//
//  Created by Walter Dal Mut on 17/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import "UpClooGetManager.h"
#import "UpClooSDK.h"

@implementation UpClooGetManager

@synthesize sitekey;
@synthesize receivedData;

- (void)getFromVirtualSitekey:(NSString *)idKey :(NSString *)vsitekey
{
    UpClooSDK *manager = [UpClooSDK sharedManager];
    if (manager.delegate == nil) {
        NSLog(@"WARNING! You have to set a delegate for get end document.");
    } else {
        NSString *repositoryUrl = nil;
        if (vsitekey == nil) {
            //Get from base repository
            repositoryUrl = [NSString stringWithFormat:UPCLOO_REPOSITORY, self.sitekey, idKey];
        } else {
            //Get form virtual sitekey
            repositoryUrl = [NSString stringWithFormat:UPCLOO_REPOSITORY_VSITEKEY, self.sitekey, vsitekey, idKey];
        }
        NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:repositoryUrl] 
                                                    cachePolicy: NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                timeoutInterval:8];
        NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest
                                                                         delegate:self];
        
        if (theConnection) {
            receivedData = [[NSMutableData data] retain];
        } else {
            [manager.delegate upclooUnableToGetContentsWithMessage:
             [NSString stringWithFormat:
              @"Unable to connect to %@, please check your internet connection", 
              UPCLOO_REPOSITORY_PATH]];
        }
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
    [manager.delegate upclooUnableToGetContentsWithMessage:[error localizedDescription]];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //todo: parse the response and create upcloo document
    UpClooDocuments *documents = [[UpClooDocuments alloc] 
                                  initWithNSMutableData:receivedData];
    [documents start];
    
    [connection release];
    [receivedData release];
}

- (oneway void)release
{
    [sitekey release];
    [super release];
}

@end
