//
//  XMLParser.m
//  ParsingXMLTutorial
//
//  Created by kent franks on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLParser.h"

@implementation XMLParser 
@synthesize data = _data;
@synthesize photoid = _photoid;
@synthesize title = _title;
@synthesize owner = _owner;

-(id) loadXMLByURL:(NSString *)urlString
{
	_data			= [[NSMutableArray alloc] init];
    _photoid          = [[NSMutableArray alloc]init];
    _title          = [[NSMutableArray alloc]init];
    _owner          = [[NSMutableArray alloc]init];
	NSURL *url		= [NSURL URLWithString:urlString];
	NSData	*data   = [[NSData alloc] initWithContentsOfURL:url];
	parser			= [[NSXMLParser alloc] initWithData:data];
	parser.delegate = self;
	[parser parse];
	return self;
}
-(id) loadXMLByString:(NSString *)XMLString
{  
	_data			= [[NSMutableArray alloc] init];
    _photoid          = [[NSMutableArray alloc]init];
    _title          = [[NSMutableArray alloc]init];
    _owner          = [[NSMutableArray alloc]init];
	//NSURL *url		= [NSURL URLWithString:urlString];
    NSData* data = [XMLString dataUsingEncoding:NSUnicodeStringEncoding];
    
     NSLog(@"Inside loadXMLBy the following String : %@",data);
     NSLog(@"Inside loadXMLByString");
	parser			= [[NSXMLParser alloc] initWithData:data];
	parser.delegate = self;
	[parser parse];
	return self;
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	currentNodeContent = (NSMutableString *) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	if ([elementname isEqualToString:@"photo"]) 
	{
		currentNode = [XML alloc];
        isStatus = YES;
        [self.photoid addObject:[attributeDict objectForKey:@"id"]];
        [self.title addObject:[attributeDict objectForKey:@"title"]];
        [self.owner addObject:[attributeDict objectForKey:@"owner"]];
//         NSLog(@"Inside didStartElement 1 %@",isStatus);
       //NSLog(@"Inside didStartElement 2 %@",_photoid);
        //NSLog(@"Inside didStartElement 2 %@",[attributeDict objectForKey:@"id"]);
        //NSLog(@"Inside didStartElement 3 %@",currentNode);
	}
	//if ([elementname isEqualToString:@"user"]) 
	//{
        //isStatus = NO;
	//}
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{  //titles = [[NSMutableArray alloc] initWithObjects:nil];
//    author = [[NSMutableArray alloc] initWithObjects:nil];
     
//    if (isStatus) 
//    {NSLog(@"Inside didEndElement");
//        if ([elementname isEqualToString:@"id"]) 
//        {NSLog(@"Inside didEndElement");
//            currentNode.photoid = currentNodeContent;
//            [self.photoid addObject:currentNodeContent];
//            NSLog(@"Inside didStartElement 2 %@",currentNodeContent);
//            NSLog(@"Inside didStartElement 3 %@",currentNode.photoid);
//           // NSLog(@"%i",_make.count);
//        }
//        if ([elementname isEqualToString:@"title"]) 
//        {NSLog(@"Inside didEndElement");
//            currentNode.title = currentNodeContent;
//            [self.title addObject:currentNodeContent];
//           // NSLog(@"%i",_model.count);
//            
//        }
////        if ([elementname isEqualToString:@"image"]) 
////        {
////            currentNode.image = currentNodeContent;
////            [self.image addObject:currentNodeContent];
////            //NSLog(@"%i",_image.count);
////            
////        }
//    }
    //[self.photoid addObject:[attributeDict objectForKey:@"id"]];
    
    
//	if ([elementname isEqualToString:@"photo"]) 
//	{
//		[self.data addObject:currentNode];
//        
//		currentNode = nil;
//		currentNodeContent = nil;
//	}
}

@end

