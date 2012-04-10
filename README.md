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

### Compile with ARC support

In order to compile the library into a project with ARC support
you have to remove this one from UpCloo library. For do that simply open
```BuildPhases``` tab under main project settings and for all 
UpCloo's files add ```-fno-objc-arc``` property on ```Compile Source```
section.

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
//password is useless for only-get apps
upcloo.password = @"my-password";
```

If you prefere you can use ```setCredential()``` method instead property setting.

```
[sharedManager setCredential: @"my-sitekey", @"my-password"];
```

## Using the SDK for getting documents

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

### Documents structure (Get)

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

## Using SDK for posting documents (create/update)

Posting new documents or update olds you have to follow a similar flow as 
used during get flow.

First of all you have to fill a new ```UpClooModelDocument``` and request 
the indexing on ```UpClooManager``` shared manager. See it on an example:

```
UpClooModelDocument *model = [[UpClooModelDocument alloc] initWithIdAndTitle: @"post_14" : @"My title"];

model.url = @"http://domain.ltd/my-link.html";
model.content = @"This is the summary";
//Other fields of document model

[[UpClooManager sharedManager] postContent: model];
```

Calls are async as get calls. If you want you can register a delegate and 
listen for events. Two events are available: error, valid post content.
For listen thoose events you have to implement the ```UpClooPutDelegate```
protocol.

That protocol have two methods: ```- (void)upclooUnableToPutThisContentWithMessage:(NSString *)message;```
that is called when an error occur or the method: ```- (void)upclooPutCompleted;```. The last one is
optional and that you can never implement this one.

### Post/Put delegate

For post/put new contents or updates old ones, you have to register a delegate for post/put operation.

```
//MyController.m
UpClooSDK *manager = [UpClooSDK sharedManager];
manager.putDelegate = self;
```

You have to be sure that your controller implements the put delegate protocol.

```
#import "UpClooPutDelegate.h"

@interface MyCotroller : UIViewController <UpClooPutDelegate> {
    - (void)upclooUnableToPutThisContentWithMessage:(NSString *)message
   {
       //Unable to store this content
   }

   //Optional method
   - (void)upclooPutCompleted
   {
       //Sending OK
   }
}

```

Now you are ready to get messages from UpCloo SDK.

Remember that method ```upclooPutCompleted``` is optional.

## Unit Tests

All tests are into UpClooSDKTests folder

