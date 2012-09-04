//
//  XYZViewController.m
//  Yahoo
//
//  Created by qbadmin on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XYZViewController.h"
#import "YOSSocial.h" 
#import "CJSONDeserializer.h"
#import "XMLParser.h"

//#import "SBJsonParser.h"
@interface XYZViewController ()

@end
XMLParser *xmlParser;
@implementation XYZViewController
@synthesize photoid = _photoid; 
@synthesize phototitle = _phototitle;
@synthesize owner = _owner;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Hello World");
    
    /* BOOL hasSession = [session resumeSession];  
     
     if(hasSession == FALSE) {  
     [session sendUserToAuthorizationWithCallback:nil];  
     }else{  
     [self sendRequests];  
     }  */
    [self sendRequests];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (void)sendRequests {  
    /* YOSSession *session = [YOSSession sessionWithConsumerKey:@"dj0yJmk9MHpDZjB2MkRMcW43JmQ9WVdrOU1VRk9kWGt3TkRnbWNHbzlNVGsyTlRFMU9EVTJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD1jMw--"  
     andConsumerSecret:@"d8a965156fc707d2167547f5906edb3d2a7e6c7f"  
     andApplicationId:@"1ANuy048"];*/
    YOSSession *session = [YOSSession sessionWithConsumerKey:@"dj0yJmk9N2RRaUxlSkp3ZVBxJmQ9WVdrOVIzWTFOWEpNTXpBbWNHbzlPVEE1TXpNek1EWXkmcz1jb25zdW1lcnNlY3JldCZ4PTI0"  
                                           andConsumerSecret:@"5a01aeeac818d12236ff2bba2eadd1dec2eaa5b1"  
                                            andApplicationId:@"Gv55rL30"];
     
    
    // initialize a user request for the logged-in user     
    //YOSUserRequest *request = [YOSUserRequest requestWithSession:session];  
    NSLog(@"Reached here");
    // fetch the user's profile data  
   // [request fetchProfileWithDelegate:self];  
    YQLQueryRequest *yqlrequest = [YQLQueryRequest   
                                   requestWithSession:session];  
    //    NSLog(@"%@ ,%@",userProfileResponse.responseText);
    /* NSString *structuredProfileLocationQuery = [NSString   
     stringWithFormat:@"select * from flickr.photos.info where photo_id=2439864402 and api_key=1ANuy048"];  
     */
    
    NSString *structuredProfileLocationQuery = [NSString   
                                                stringWithFormat:@"select * from flickr.photos.search where user_id='11414938@N00' and api_key='9aae7ac1770fdd8027b7aec220ae6400'"];
    
    [yqlrequest query:structuredProfileLocationQuery  
         withDelegate:self]; 
    NSLog(@"Reached here ......");

    //    
    //    //[self requestDidFinishLoading:userProfileResponse];
    //    NSLog(@"Reached here 2");
    //    NSLog(@"%@",userProfileResponse);
}  

- (void)requestDidFinishLoading:(YOSResponseData *)data {  
    // parse the response text string into a dictionary 
    //NSString* newStr = [[[NSString alloc] initWithData:data.data
    //                                          encoding:NSUTF8StringEncoding] autorelease];
      //NSLog(@"Reached here 3 %@",data.responseText);
      xmlParser = [[XMLParser alloc] loadXMLByString:data.responseText
                 ];
    //self.photoid = xmlParser.photoid;
    //self.phototitle = xmlParser.title;
    NSLog(@" Photo ID %i",xmlParser.photoid.count); 
    NSLog(@" Title %i",xmlParser.title.count); 
    //NSString *urlstring = @"http://www.flickr.com/photos/";
    //NSURL *url = [NSURL URLWithString:@"http://www.flickr.com/photos/"];
    NSString *append1 = [xmlParser.owner objectAtIndex:(0)];
     NSString *append2 = [xmlParser.photoid objectAtIndex:(0)];
    NSString *fullurl = [NSString stringWithFormat:@"http://www.flickr.com/photos/%@/%@",append1,append2];
    NSURL *url = [NSURL URLWithString:fullurl];
    [[UIApplication sharedApplication] openURL: url];


  // NSDictionary *rspData = [data.responseText JSONValue];
    //[CJSONDeserializer ];
//    NSDictionary *rspData = [data.responseText JSONValue];  
//    NSDictionary *queryData = [rspData objectForKey:@"query"];  
//    NSDictionary *results = [queryData objectForKey:@"results"];  
//    
//    NSLog(@"%@", [results description]); 
    //    SBJsonParser *parser = [[SBJsonParser alloc]init];
    //    NSDictionary *rspData = [parser objectWithString:data.responseText];
    //    NSDictionary *profileData = [rspData objectForKey:@"profile"];  
    //    
    //    // format a string using the nickname object from the profile.  
    //    NSString *welcomeText = [NSString stringWithFormat:@"Hey %@ %@!",   
    //                             [profileData objectForKey:@"givenName"],  
    //                             [profileData objectForKey:@"familyName"]];  
}  

@end
