# UpCloo Cocoa Touch SDK

***This library is completely unstable***

This SDK is intented for iOS applications

## Example of usage

***todo: add docs for import ```.a``` static library

First of all you have to require the SDK

```
#import "UpClooSDK.h"
```

That's load the library and you can use into your controllers.

### Bootstrap UpCloo SDK

You have to set credentials during your bootstrap (application launch)

```
UpClooSDK *upcloo = [UpClooSDK sharedManger];
upcloo.sitekey = @"my-sitekey";
upcloo.password = @"my-password";
```

If you prefere you can use ```setCredential()``` method instead property setting.

```
[sharedManager setCredential: @"my-sitekey", @"my-password"];
```

### Using the SDK for getting documents

UpCloo SDK use delegates for send messages asyncronously to your application. 
When you ask for a document (using ```get``` method), UpCloo SDK detach threads
for process your request and only when the message is ready or error is returned
call a delegate method.

Actually only two callback methods are available, one for all goes ok and one for
show an error message.

Definition of callbacks are into ```UpClooGetDelegate``` protocol definition.
For using you have to implements it at your controller and implements methods.

```
...

#import "UpClooGetDelegate.h"

...

@interface MyController : UIViewController <UpClooGetDelegate> {

...

- (void)upclooContentsReady:(UpClooDocuments *)documents 
{
    //Documents are available
}

- (void)upclooUnableToGetContentsWithMessage: (NSString *)message
{
    //Show the error or handle it
}
```
