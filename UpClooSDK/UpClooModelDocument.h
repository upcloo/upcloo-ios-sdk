//
//  UpClooModelDocument.h
//  UpClooSDK
//
//  Created by Walter Dal Mut on 17/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UpClooModelDocument : NSObject {
    NSString *idContent;
    NSString *title;
    NSString *summary;
    NSString *content;
    NSArray *tags;
    NSArray *categories;
    NSDate *publishDate;
}

@property (nonatomic, retain) NSString *idContent;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *summary;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSArray *tags;
@property (nonatomic, retain) NSArray *categories;
@property (nonatomic, retain) NSDate *publishDate;

- (id)initWithIdContent:(NSString *)value;

- (void)asXML;

@end
