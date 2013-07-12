//
//  MockConnectionManager.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/12/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "MockConnectionManager.h"

@implementation MockConnectionManager {
    BOOL wasAskedToFetchBusStops;
}

- (BOOL)wasAskedToFetchBusStops
{
    return wasAskedToFetchBusStops;
}

@end
