//
//  XMLParser.h
//  ParsingXMLTutorial
//
//  Created by kent franks on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XML.h"

@interface XMLParser : NSObject <NSXMLParserDelegate> {
   
    NSMutableArray *_photoid;
    NSMutableString	*currentNodeContent;
    NSMutableArray *_title ;
    NSMutableArray *_owner ;
    //NSMutableArray *author ;
    NSXMLParser		*parser;
    XML			*currentNode;
    bool            isStatus;

}

@property (strong, readonly) NSMutableArray *data;
@property (nonatomic, retain) NSMutableArray *photoid;
@property (nonatomic, retain) NSMutableArray *title;
@property (nonatomic, retain) NSMutableArray *owner;

-(id) loadXMLByURL:(NSString *)urlString;
-(id) loadXMLByString:(NSString *)String;

@end
