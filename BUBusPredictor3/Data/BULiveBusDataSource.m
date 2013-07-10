//
//  BULiveBusDataSource.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BULiveBusDataSource.h"

@implementation BULiveBusDataSource

- (id)initWithUrlString:(NSString *)theUrlString
{
    if (self = [super initWithUrlString:theUrlString]) {
        _connection = [[BULiveBusConnectionManager alloc] initWithURL:[self url]];
    }
    return self;
}

@end
