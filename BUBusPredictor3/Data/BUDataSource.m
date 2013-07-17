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
@synthesize key = _key;
@synthesize connectionManager = _connectionManager;
@synthesize fetchError;

- (id)initWithUrlString:(NSString*)theUrlString key:(NSString *)theKey
{
    if ((self = [super init])) {
        _urlString = [theUrlString copy];
        _url = [NSURL URLWithString:_urlString];
        _key = theKey;
    }
    return self;
}

- (void)fetchingFailedWithError:(NSError *)error
{
    
}

@end
