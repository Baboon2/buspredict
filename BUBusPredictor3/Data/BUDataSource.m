//
//  BUDataSource.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BUDataSource.h"

@implementation BUDataSource
@synthesize urlString = _urlString;
@synthesize url = _url;

- (id)initWithUrlString:(NSString*)theUrlString
{
    if ((self = [super init])) {
        _urlString = [theUrlString copy];
        _url = [NSURL URLWithString:_urlString];
        
        
    }
    return self;
}


@end
