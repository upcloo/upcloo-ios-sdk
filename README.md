# UpCloo Cocoa Touch SDK

This SDK is intented for iOS applications

## Load the library

You can load the UpCloo Cocoa SDK in two ways:

 * Using sources directly
 * Load static library

The first method is pretty simple, copy all ```.h``` and ```.c``` files
into your project and use it.

The second one is simple as well, move the ```.a``` into your framework
group and move only ```.h``` header files into your project.

That's it no big deal!

## Example of usage

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

## Documents structure

Documents are divided into two containers: ```UpClooDocuments``` and ```UpClooDocument```. 
First type encapsulate the second one using an ```NSArray``` structure.

For that reason if you want to get elements you have to do:

```
//documents variable is a valid and filled UpClooDocuments instance
int i;
for (i=0; i<documents.documents.count; i++) {
    UpClooDocument *document = (UpClooDocument *)[documents.documents objectAtIndex: i];
    NSLog(@"%@", document.title);
}
```

## Unit Tests

All tests are into UpClooSDKTests folder

