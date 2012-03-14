//
//  UpClooDocumentsTests.m
//  UpClooSDK
//
//  Created by Walter Dal Mut on 14/03/12.
//  Copyright (c) 2012 Walter Dal Mut. All rights reserved.
//

#import "UpClooDocumentsTests.h"
#import "UpClooDocuments.h"
#import "UpClooDocument.h"

@implementation UpClooDocumentsTests

NSMutableData *xmlData;

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    NSString *xml = @"<?xml version=\"1.0\" encoding=\"utf-8\"?><docs><doc id=\"post_1110\" uid=\"ab90HGwdm_post_1110_it_1\" pubDate=\"2012-02-15T18:40:57Z\"><title>Zend_Soap_Server compatibile con Java e C#</title><url>http://walterdalmut.com/2012/02/15/zend_soap_server-compatibile-con-java-e-c-sharp/</url><description>Sfortunatamente Java e C# preferiscono un tipo di servizio SOAP differente da quello che Zend ci offre come default, ovvero il sistema RPC.</description><type>post</type><image/><authors><author>Walter Dal Mut</author></authors><categories><category>PHP</category></categories><tags><tag>php</tag><tag>soap</tag><tag>zend</tag><tag>Zend_Soap</tag></tags></doc><doc id=\"post_604\" uid=\"ab90HGwdm_post_604_it_1\" pubDate=\"2011-09-04T19:36:21Z\"><title>Wordpress XML-RPC - Zend Connector</title><url>http://walterdalmut.com/2011/09/wordpress-xml-rpc-to-zend-connector/</url><description/><type>post</type><image/><authors><author>Walter Dal Mut</author></authors><categories><category>PHP</category><category>Pubblicazioni</category><category>Tests</category></categories><tags><tag>php</tag><tag>wordpress</tag><tag>xml-rpc</tag><tag>zend</tag></tags></doc><doc id=\"post_608\" uid=\"ab90HGwdm_post_608_it_1\" pubDate=\"2011-09-08T21:56:00Z\"><title>Zend Wordpress XML-RPC Connector- 1.0.1</title><url>http://walterdalmut.com/2011/09/zend-wordpress-1-0-1/</url><description/><type>post</type><image/><authors><author>Walter Dal Mut</author></authors><categories><category>PHP</category><category>Pubblicazioni</category><category>Tests</category></categories><tags><tag>php</tag><tag>wordpress</tag><tag>xml-rpc</tag><tag>zend</tag></tags></doc><doc id=\"post_681\" uid=\"ab90HGwdm_post_681_en_1\" pubDate=\"2011-09-16T16:50:11Z\"><title>PEAR Repository Zend Wordpress</title><url>http://walterdalmut.com/2011/09/pear-repository-zend-wordpress/</url><description/><type>post</type><image/><authors><author>Walter Dal Mut</author></authors><categories><category>Generali</category><category>PEAR</category><category>PHP</category></categories><tags><tag>pear</tag><tag>php</tag><tag>wordpress</tag><tag>zend</tag></tags></doc><doc id=\"post_638\" uid=\"ab90HGwdm_post_638_en_1\" pubDate=\"2011-09-16T00:52:49Z\"><title>PHPUnit Zend Framework Project [English]</title><url>http://walterdalmut.com/2011/09/phpunit-on-zend-framework-project-english/</url><description/><type>post</type><image/><authors><author>Walter Dal Mut</author></authors><categories><category>Generali</category><category>PHP</category><category>Tests</category></categories><tags><tag>code coverage</tag><tag>php</tag><tag>phpunit</tag><tag>test</tag><tag>zend</tag></tags></doc><doc id=\"post_863\" uid=\"ab90HGwdm_post_863_it_1\" pubDate=\"2011-10-31T01:10:20Z\"><title>Zend Wordpress XML-RPC Connector 1.1.0</title><url>http://walterdalmut.com/2011/10/zend-wordpress-xml-rpc-connector-1-1-0/</url><description/><type>post</type><image/><authors><author>Walter Dal Mut</author></authors><categories><category>Applicazioni</category><category>PHP</category><category>Tests</category></categories><tags><tag>wordpress</tag><tag>xml</tag><tag>xml-rpc</tag><tag>zend</tag></tags></doc><doc id=\"post_530\" uid=\"ab90HGwdm_post_530_it_1\" pubDate=\"2011-08-07T13:39:42Z\"><title>CouchDB Replicator (Server Cluster)</title><url>http://walterdalmut.com/2011/08/couchdb-replicator/</url><description/><type>post</type><image/><authors><author>Walter Dal Mut</author></authors><categories><category>Applicazioni</category><category>Cloud Computing</category><category>PHP</category></categories><tags><tag>cloud computing</tag><tag>couchdb</tag><tag>nosql</tag><tag>php</tag><tag>zend</tag></tags></doc><doc id=\"post_816\" uid=\"ab90HGwdm_post_816_it_1\" pubDate=\"2011-10-09T19:50:54Z\"><title>Nginx e Moduli: filtri, handlers e load balancers</title><url>http://walterdalmut.com/2011/10/nginx-e-moduli-filtri-handlers-e-load-balancers/</url><description/><type>post</type><image/><authors><author>Walter Dal Mut</author></authors><categories><category>Cloud Computing</category><category>Generali</category><category>Tests</category></categories><tags><tag>apache</tag><tag>cloud computing</tag><tag>nginx</tag></tags></doc><doc id=\"post_806\" uid=\"ab90HGwdm_post_806_en_1\" pubDate=\"2011-10-08T18:30:15Z\"><title>Nginx VS Apache2 on static resources</title><url>http://walterdalmut.com/2011/10/nginx-vs-apache2-on-static-resources/</url><description/><type>post</type><image/><authors><author>Walter Dal Mut</author></authors><categories><category>Cloud Computing</category><category>Generali</category><category>Tests</category></categories><tags><tag>apache</tag><tag>cloud computing</tag><tag>cluster</tag><tag>nginx</tag></tags></doc><doc id=\"post_717\" uid=\"ab90HGwdm_post_717_en_1\" pubDate=\"2011-09-19T10:00:00Z\"><title>jQuery touch screen enabled menu system</title><url>http://walterdalmut.com/2011/09/jquery-touch-screen-enabled-menu-system/</url><description/><type>post</type><image/><authors><author>Walter Dal Mut</author></authors><categories><category>Applicazioni</category><category>Generali</category><category>jQuery</category></categories><tags><tag>android</tag><tag>apple</tag><tag>ios</tag><tag>ipod touch</tag><tag>jquery</tag><tag>menu</tag></tags></doc></docs>";
    xmlData = [NSMutableData dataWithData:[xml dataUsingEncoding:NSUTF8StringEncoding]];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testParsing
{
    UpClooDocuments *documents = [[UpClooDocuments alloc] initWithNSMutableData:xmlData];
    [documents start];
    
    while (!documents.parseEnds) {
        //wait
    }
    
    STAssertTrue(documents.documents.count > 0, 
                 [NSString stringWithFormat: @"FAILURE: Library says that have %d documents?", documents.documents.count]);

    STAssertTrue(documents.documents.count == 10, 
             [NSString stringWithFormat: @"FAILURE: Library says that have %d documents but I want 10 docs?", documents.documents.count]);

    UpClooDocument *doc = (UpClooDocument *)[documents.documents objectAtIndex:0];

    if (![doc.title isEqualToString:@"Zend_Soap_Server compatibile con Java e C#"]) {
        STFail([NSString stringWithFormat:@"Title %@ and parsed title is different", doc.title]);
    }

    if (![doc.url isEqualToString:@"http://walterdalmut.com/2012/02/15/zend_soap_server-compatibile-con-java-e-c-sharp/"]) {
        STFail([NSString stringWithFormat:@"URL %@ and parsed URL is different", doc.url]);
    }
}

@end
