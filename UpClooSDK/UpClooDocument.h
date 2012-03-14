//
//  UpClooDocument.h
//  UpClooSDK
//
//  Created by Walter Dal Mut on 14/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UpClooDocument : NSObject {
    NSMutableString *title;
    NSMutableString *url;
}

@property (nonatomic, retain) NSMutableString *title;
@property (nonatomic, retain) NSMutableString *url;

@end
