//
//  BULiveBusDataSource.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BULiveBusDataSource.h"
#import "BULiveBusConnectionManager.h"

@implementation BULiveBusDataSource

- (id)initWithUrlString:(NSString *)theUrlString key:(NSString *)theKey
{
    if (self = [super initWithUrlString:theUrlString key:theKey]) {
        self.connectionManager = [[BULiveBusConnectionManager alloc] initWithURL:[self url]];
        [self.connectionManager setDelegate:self];
    }
    return self;
}

@end
