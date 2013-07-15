//
//  BUBusStopDataSource.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/8/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BUBusStopDataSource.h"

@implementation BUBusStopDataSource

- (id)initWithUrlString:(NSString *)theUrlString key:(NSString *)theKey
{
    if (self = [super initWithUrlString:theUrlString key:theKey]) {
        _connectionManager = [[BUBusStopConnectionManager alloc] initWithURL:[NSURL URLWithString:theUrlString]];
        [_connectionManager setDelegate:self];
    }
    return self;
}

@end
