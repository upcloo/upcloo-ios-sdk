//
//  UpClooSDK.m
//  UpClooSDK
//
//  Created by Walter Dal Mut on 14/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import "UpClooSDK.h"
#import "UpClooDocuments.h"

static UpClooSDK *sharedManager = nil;

@implementation UpClooSDK

@synthesize sitekey,password;
@synthesize delegate;

@synthesize receivedData;

#pragma mark Singleton methods
+ (id)sharedManager{
    @synchronized(self) {
        if (sharedManager == nil)
            sharedManager = [[self alloc] init];
    }
    return sharedManager;
}

- (id)init {
    if (self = [super init]) {
        vsitekeys = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

- (void)setCredential: (NSString *)s: (NSString *)p
{
    self.sitekey = s;
    self.password = p;
}

- (void)get:(NSString *)idKey
{
    [self getFromVirtualSitekey:idKey :nil];
}

- (void)getFromVirtualSitekey:(NSString *)idKey :(NSString *)vsitekey
{
    if (self.delegate == nil) {
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
                                                    cachePolicy: NSURLRequestUseProtocolCachePolicy 
                                                timeoutInterval:8];
        NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest
                                                                         delegate:self];

        if (theConnection) {
            receivedData = [NSMutableData data];
        } else {
            [self.delegate upclooUnableToGetContentsWithMessage:
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
    [self.delegate upclooUnableToGetContentsWithMessage:[error localizedDescription]];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //todo: parse the response and create upcloo document
    UpClooDocuments *documents = [[UpClooDocuments alloc] 
                                  initWithNSMutableData:receivedData];
    
    [self.delegate upclooContentsReady:documents];
}

@end
