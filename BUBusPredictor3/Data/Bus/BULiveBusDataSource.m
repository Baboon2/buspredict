//
//  BULiveBusDataSource.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BULiveBusDataSource.h"

@implementation BULiveBusDataSource

- (id)initWithUrlString:(NSString *)theUrlString key:(NSString *)theKey
{
    if (self = [super initWithUrlString:theUrlString key:theKey]) {
        _connection = [[BULiveBusConnectionManager alloc] initWithURL:[self url]];
        [_connection setDelegate:self];
    }
    return self;
}

@end
