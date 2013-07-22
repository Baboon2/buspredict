//
//  BUDataSource.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BUDataSource.h"
#import "BUConnectionManager.h"

@implementation BUDataSource
@synthesize url = _url;
@synthesize key = _key;
@synthesize connectionManager = _connectionManager;
@synthesize fetchError;

- (id)initWithUrlString:(NSString*)theUrlString key:(NSString *)theKey
{
    if ((self = [super init])) {
        _url = [NSURL URLWithString:theUrlString];
        _key = theKey;
    }
    return self;
}

- (void)fetchingFailedWithError:(NSError *)error
{
     self.fetchError = error;
}


- (void)didReceiveItems: (NSArray *)items
{
    
}

- (NSArray *)fetchedItems
{
    return [self.connectionManager items];
}
@end
